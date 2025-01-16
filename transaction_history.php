<?php
// Enable error reporting for debugging
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);

// Database connection
$conn = new mysqli('localhost:3306', 'kayemndjr11_123', 'Kayemondejar123!', 'kayemndjr11_123');

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve filter values
$month = isset($_GET['month']) ? intval($_GET['month']) : null;
$year = isset($_GET['year']) ? intval($_GET['year']) : null;

// Build SQL query
$sql = "SELECT pickup_id, user_id, collector_id, address, phone_number, e_waste_type, weight_kg, status FROM pickups WHERE 1=1";

if ($month && $year) {
    $startDate = "$year-$month-01";
    $endDate = date("Y-m-t", strtotime($startDate)); // Get the last day of the selected month
    $sql .= " AND pickup_date BETWEEN '$startDate' AND '$endDate'";
}

$sql .= " ORDER BY pickup_date DESC";

// Execute query and fetch results
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Transaction History</title>
    <style>
        /* General Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 0;
        }

        /* Sidebar Styles */
        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            background-color: #2e7d32; /* Dark green */
            padding-top: 20px;
        }

        .sidebar h2 {
            color: white;
            text-align: center;
            margin-bottom: 30px;
            font-size: 22px;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .sidebar h2 img {
            width: 50px; /* Adjust the size as needed */
            height: 50px;
            margin-right: 10px;
            vertical-align: middle; /* Space between the logo and text */
        }

        .sidebar ul {
            list-style-type: none;
            padding: 0;
        }

        .sidebar ul li {
            padding: 10px;
            text-align: left;
        }

        .sidebar ul li a {
            text-decoration: none;
            color: white;
            font-size: 18px;
            padding: 10px 15px;
            display: block;
        }

        .sidebar ul li a:hover {
            background-color: #388e3c; /* Lighter green on hover */
            border-radius: 5px;
        }

        /* Main Content Styles */
        .main-content {
            margin-left: 260px;
            padding: 20px;
        }

        .main-content h1 {
            color: #2e7d32;
            font-weight: bold;
            margin-bottom: 20px;
        }

        /* Table Styles */
        .table-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
			margin-top: 40px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }

        table thead {
            background: #2e7d32;
            color: white;
        }

        table thead th {
            padding: 15px;
            text-align: left;
        }

        table tbody tr {
            border-bottom: 1px solid #e5e5e5;
        }

        table tbody tr:hover {
            background: #f1f8e9; /* Light green hover */
        }

        table td {
            padding: 12px;
        }

        /* Filter Styles */
        .filter-container {
    position: absolute;
    top: 80px; /* Adjust this value based on the desired vertical position */
    right: 20px; /* Adjust this value based on the desired horizontal position */
    margin-bottom: 20px;
}


        .filter-container form {
            display: flex;
            align-items: center;
            gap: 15px;
        }

        .filter-container label {
            font-weight: bold;
        }

        .filter-container select,
        .filter-container button {
            padding: 8px 12px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }

        .filter-container button {
            background-color: #2e7d32;
            color: white;
            cursor: pointer;
        }

        .filter-container button:hover {
            background-color: #388e3c;
        }
    </style>
</head>
<body>

    <!-- Sidebar -->
    <div class="sidebar">
        <h2><img src="logo.png" alt="Logo"> RecycleLink</h2>
        <ul>
            <li><a href="index.php">Dashboard</a></li>
            <li><a href="collector_admin.php">Collector Management</a></li>
            <li><a href="user_management.php">User Management</a></li>
            <li><a href="transaction_history.php" class="active">Transaction History</a></li>
            <li><a href="logout.php">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <h1>Transaction History</h1>

        <!-- Filter Section -->
        <div class="filter-container">
            <form id="filterForm">
               
                <select id="month" name="month" required>
                    <option value="">Select Month</option>
                    <?php for ($m = 1; $m <= 12; $m++) {
                        $monthName = date('F', mktime(0, 0, 0, $m, 1));
                        echo "<option value=\"$m\"" . ($m == $month ? ' selected' : '') . ">$monthName</option>";
                    } ?>
                </select>

                
                <select id="year" name="year" required>
                    <option value="">Select Year</option>
                    <?php for ($y = 2020; $y <= date('Y'); $y++) {
                        echo "<option value=\"$y\"" . ($y == $year ? ' selected' : '') . ">$y</option>";
                    } ?>
                </select>
            </form>
        </div>

        <!-- Table Section -->
        <div class="table-container" id="transactionTable">
            <table>
                <thead>
                    <tr>
                        <th>Pickup ID</th>
                        <th>User ID</th>
                        <th>Collector ID</th>
                        <th>Address</th>
                        <th>Phone Number</th>
                        <th>E-Waste Type</th>
                        <th>Weight (kg)</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <?php
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr>
                                    <td>" . htmlspecialchars($row['pickup_id']) . "</td>
                                    <td>" . htmlspecialchars($row['user_id']) . "</td>
                                    <td>" . htmlspecialchars($row['collector_id']) . "</td>
                                    <td>" . htmlspecialchars($row['address']) . "</td>
                                    <td>" . htmlspecialchars($row['phone_number']) . "</td>
                                    <td>" . htmlspecialchars($row['e_waste_type']) . "</td>
                                    <td>" . htmlspecialchars($row['weight_kg']) . "</td>
                                    <td>" . htmlspecialchars($row['status']) . "</td>
                                  </tr>";
                        }
                    } else {
                        echo "<tr><td colspan='8'>No records found</td></tr>";
                    }
                    ?>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Include jQuery for AJAX -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

    <script>
        $(document).ready(function() {
            // Trigger filter function when month or year is selected
            $('#month, #year').change(function() {
                // Get filter values
                var month = $('#month').val();
                var year = $('#year').val();

                // Make AJAX request
                $.ajax({
                    url: 'transaction_history.php', // Self-referential to the same page
                    type: 'GET',
                    data: { month: month, year: year },
                    success: function(response) {
                        // Extract the table body from the response
                        var tableBody = $(response).find('tbody').html();
                        // Update the table body with new data
                        $('#transactionTable tbody').html(tableBody);
                    },
                    error: function() {
                        alert('Error filtering transactions.');
                    }
                });
            });
        });
    </script>

</body>
</html>

<?php
$conn->close();
?>
