<?php
session_start();

// Check if the user is logged in
if (!isset($_SESSION['user_id'])) {
    header("Location: login.php");
    exit;
}

// Database connection
$conn = new mysqli('localhost:3306', 'kayemndjr11_123', 'Kayemondejar123!', 'kayemndjr11_123');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get selected year and month from the form or default to current
$selected_year = isset($_POST['year']) ? $_POST['year'] : date('Y');
$selected_month = isset($_POST['month']) ? $_POST['month'] : date('m');

// total users
$user_query = "SELECT COUNT(*) AS total_users FROM users";
$user_result = $conn->query($user_query);
$total_users = $user_result->fetch_assoc()['total_users'];

// total collectors
$collector_query = "SELECT COUNT(*) AS total_collectors FROM collectors";
$collector_result = $conn->query($collector_query);
$total_collectors = $collector_result->fetch_assoc()['total_collectors'];

// total waste collected
$waste_query = "SELECT SUM(weight_kg) AS total_waste FROM pickups WHERE status = 'Completed'";
$waste_result = $conn->query($waste_query);
$total_waste = $waste_result->fetch_assoc()['total_waste'];

// counts of each type of e-waste
$ewaste_query = "SELECT e_waste_type, COUNT(*) AS count FROM pickups WHERE status = 'Completed' AND e_waste_type IN ('Type 1', 'Type 2', 'Type 3') GROUP BY e_waste_type";
$ewaste_result = $conn->query($ewaste_query);

$ewaste_types = [];
$ewaste_counts = [];
$all_types = ["Type 1", "Type 2", "Type 3"];
$type_count = array_fill_keys($all_types, 0);

while ($row = $ewaste_result->fetch_assoc()) {
    $type_count[$row['e_waste_type']] = $row['count'];
}

$ewaste_types = array_keys($type_count);
$ewaste_counts = array_values($type_count);

$colors = [
    '#4CAF50', // Type 1 - Green
    '#FF0000', // Type 2 - Red
    '#2196F3'  // Type 3 - Blue
];

// Get pickup data for the selected year and month
function getPickupData($conn, $year, $month) {
    $pickup_query = "SELECT pickup_date, status, COUNT(*) AS total 
                     FROM pickups 
                     WHERE status IN ('Approved', 'Completed') 
                     AND YEAR(pickup_date) = '$year' 
                     AND MONTH(pickup_date) = '$month' 
                     GROUP BY pickup_date, status 
                     ORDER BY pickup_date ASC";
    $pickup_result = $conn->query($pickup_query);

    $all_dates = [];
    $approved_counts = [];
    $completed_counts = [];

    while ($row = $pickup_result->fetch_assoc()) {
        $date = $row['pickup_date'];
        if (!in_array($date, $all_dates)) {
            $all_dates[] = $date;
        }
        if ($row['status'] == 'Approved') {
            $approved_counts[$date] = $row['total'];
        } else if ($row['status'] == 'Completed') {
            $completed_counts[$date] = $row['total'];
        }
    }

    sort($all_dates);

    $approved_counts_filled = [];
    $completed_counts_filled = [];

    foreach ($all_dates as $date) {
        $approved_counts_filled[] = $approved_counts[$date] ?? 0;
        $completed_counts_filled[] = $completed_counts[$date] ?? 0;
    }

    return [
        'dates' => $all_dates,
        'approvedCounts' => $approved_counts_filled,
        'completedCounts' => $completed_counts_filled
    ];
}

if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['ajax'])) {
    $year = $_POST['year'];
    $month = $_POST['month'];
    echo json_encode(getPickupData($conn, $year, $month));
    exit;
}

$pickup_data = getPickupData($conn, $selected_year, $selected_month);

// Will get the username of the logged-in admin
$admin_name = isset($_SESSION['username']) ? $_SESSION['username'] : 'Admin';

// Get available years and months for filtering
$years_query = "SELECT DISTINCT YEAR(pickup_date) AS year FROM pickups ORDER BY year DESC";
$years_result = $conn->query($years_query);
$years = [];
while ($row = $years_result->fetch_assoc()) {
    $years[] = $row['year'];
}

$months = [
    "01" => "January",
    "02" => "February",
    "03" => "March",
    "04" => "April",
    "05" => "May",
    "06" => "June",
    "07" => "July",
    "08" => "August",
    "09" => "September",
    "10" => "October",
    "11" => "November",
    "12" => "December"
];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RecycleLink Admin Panel</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="sidebar.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <!-- Side Navigation Bar -->
    <div class="sidebar">
        <h2>
            <img src="logo.png" alt="Logo" class="logo"> <span class="recyclelink-text">RecycleLink</span>
        </h2>
        <ul>
            <li><a href="index.php" class="active">Dashboard</a></li>
            <li><a href="collector_admin.php">Collector Management</a></li>
            <li><a href="user_management.php">User Management</a></li>
            <li><a href="transaction_history.php">Transaction History</a></li>
            <li><a href="logout.php">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <div class="admin-welcome">
            <h2>Welcome, <?php echo htmlspecialchars($admin_name); ?>!</h2>
        </div>

        <h1>Dashboard</h1>

        <div class="dashboard-cards">
            <div class="card">
                <h2>Total Users</h2>
                <p><?php echo $total_users; ?></p>
            </div>
            <div class="card">
                <h2>Number of Collectors</h2>
                <p><?php echo $total_collectors; ?></p>
            </div>
            <div class="card">
                <h2>Waste Collected (kg)</h2>
                <p><?php echo $total_waste . " kg"; ?></p>
            </div>
        </div>

        <div class="chart-wrapper">
            <div class="card pieChart">
                <h2>E-Waste Types</h2>
                <canvas id="ewastePieChart" width="400" height="200"></canvas>
            </div>

            <div class="line-chart-wrapper">
                <div class="card lineChart">
                    <h2>Total Approved and Completed Pickups </h2>
                    <form id="filterForm" class="filter-form">                        
                        <label for="month">Month:</label>
                        <select name="month" id="month">
                            <?php foreach ($months as $month_num => $month_name): ?>
                                <option value="<?php echo $month_num; ?>" <?php echo $month_num == $selected_month ? 'selected' : ''; ?>><?php echo $month_name; ?></option>
                            <?php endforeach; ?>
                        </select>
						<label for="year">Year:</label>
                        <select name="year" id="year">
                            <?php foreach ($years as $year): ?>
                                <option value="<?php echo $year; ?>" <?php echo $year == $selected_year ? 'selected' : ''; ?>><?php echo $year; ?></option>
                            <?php endforeach; ?>
                        </select>
                    </form>
                    <canvas id="pickupsLineChart" width="400" height="200"></canvas>
                </div>
            </div>
        </div>
    </div>

    <script>
        const ewasteTypes = <?php echo json_encode($ewaste_types); ?>;
        const ewasteCounts = <?php echo json_encode($ewaste_counts); ?>;
        const ewasteColors = <?php echo json_encode($colors); ?>;

        const ewasteCtx = document.getElementById('ewastePieChart').getContext('2d');
        new Chart(ewasteCtx, {
            type: 'pie',
            data: {
                labels: ewasteTypes,
                datasets: [{
                    data: ewasteCounts,
                    backgroundColor: ewasteColors
                }]
            },
            options: {
                responsive: true
            }
        });

        const initialData = <?php echo json_encode($pickup_data); ?>;

        const pickupsCtx = document.getElementById('pickupsLineChart').getContext('2d');
        const pickupsLineChart = new Chart(pickupsCtx, {
            type: 'line',
            data: {
                labels: initialData.dates,
                datasets: [
                    {
                       label: 'Approved',
data: initialData.approvedCounts,
borderColor: '#2196F3', // Blue border
backgroundColor: 'rgba(33, 150, 243, 0.2)', // Light blue background
fill: true
                    },
                    {
                        label: 'Completed',
                        data: initialData.completedCounts,
                        borderColor: '#4CAF50',
                        backgroundColor: 'rgba(76, 175, 80, 0.2)',
                        fill: true
                    }
                ]
            },
            options: {
                responsive: true
            }
        });

        document.getElementById('filterForm').addEventListener('change', function () {
            const year = document.getElementById('year').value;
            const month = document.getElementById('month').value;

            fetch('', {
                method: 'POST',
                headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
                body: new URLSearchParams({
                    ajax: true,
                    year: year,
                    month: month
                })
            })
            .then(response => response.json())
            .then(data => {
                pickupsLineChart.data.labels = data.dates;
                pickupsLineChart.data.datasets[0].data = data.approvedCounts;
                pickupsLineChart.data.datasets[1].data = data.completedCounts;
                pickupsLineChart.update();
            })
            .catch(error => console.error('Error:', error));
        });
    </script>
</body>
</html>
