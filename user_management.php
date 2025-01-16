<?php
session_start();

// Check if the admin is logged in
if (!isset($_SESSION['username'])) {
    header("Location: login.php"); // Redirect to login if not logged in
    exit;
}

// Get admin's name from session
$admin_name = $_SESSION['username'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	<link rel="stylesheet" href="sidebar.css">

    <title>User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 0;
        }

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
            vertical-align: middle;
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

        .main-content {
            margin-left: 260px;
            padding: 20px;
        }

        .main-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 20px;
        }

        .main-header h1 {
            color: #2e7d32;
            font-weight: bold;
            margin: 0;
        }

        .search-container {
            display: flex;
            justify-content: flex-end;
            flex-grow: 1;
            margin-left: 20px;
			 margin-top: 35px; 
        }

        .search-container input,
        .search-container select {
            padding: 8px;
            font-size: 14px;
            border-radius: 5px;
            border: 1px solid #ccc;
            margin-left: 10px;
        }

        .table-container {
            background: white;
            border-radius: 12px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            padding: 20px;
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

        /* Success/Error Message */
        #message {
            margin-bottom: 20px;
            padding: 10px;
            border-radius: 6px;
            display: none;
        }

        #message.success {
            background-color: #d4edda;
            color: #155724;
        }

        #message.error {
            background-color: #f8d7da;
            color: #721c24;
        }

        .admin-welcome {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 18px;
            font-weight: bold;
            color: black;
        }
    </style>
    <script>
        // JavaScript function to search through the table
        function searchUsers() {
            const searchInput = document.getElementById('search').value.toLowerCase();
            const monthFilter = document.getElementById('month-filter').value;
            const yearFilter = document.getElementById('year-filter').value;
            const tableRows = document.querySelectorAll('#user-table-body tr');

            tableRows.forEach(row => {
                const rowData = row.textContent.toLowerCase();
                const registrationDate = row.querySelector('.registration-date').textContent;
                const rowMonth = new Date(registrationDate).getMonth() + 1;
                const rowYear = new Date(registrationDate).getFullYear();

                const matchesSearch = rowData.includes(searchInput);
                const matchesMonth = monthFilter === '' || rowMonth === parseInt(monthFilter);
                const matchesYear = yearFilter === '' || rowYear === parseInt(yearFilter);

                row.style.display = (matchesSearch && matchesMonth && matchesYear) ? '' : 'none';
            });
        }
    </script>
</head>
<body>
    <!-- Side Navigation Bar -->
    <div class="sidebar">
        <h2>
            <img src="logo.png" alt="Logo"> <!-- Replace 'logo.png' with your logo file path -->
            <span>RecycleLink</span>
        </h2>
        <ul>
            <li><a href="index.php">Dashboard</a></li>
            <li><a href="collector_admin.php">Collector Management</a></li>
            <li><a href="user_management.php" class="active">User Management</a></li>
            <li><a href="transaction_history.php">Transaction History</a></li>
            <li><a href="logout.php">Logout</a></li>
        </ul>
    </div>

    <!-- Main Content -->
    <div class="main-content">
        <!-- Main Header with Title and Search Bar -->
        <div class="main-header">
            <h1>Registered Users</h1>
            <div class="search-container">
                <input type="text" id="search" placeholder="Search by name, email, or phone" onkeyup="searchUsers()" />
                <select id="month-filter" onchange="searchUsers()">
                    <option value="">Select Month</option>
                    <option value="1">January</option>
                    <option value="2">February</option>
                    <option value="3">March</option>
                    <option value="4">April</option>
                    <option value="5">May</option>
                    <option value="6">June</option>
                    <option value="7">July</option>
                    <option value="8">August</option>
                    <option value="9">September</option>
                    <option value="10">October</option>
                    <option value="11">November</option>
                    <option value="12">December</option>
                </select>
                <select id="year-filter" onchange="searchUsers()">
                    <option value="">Select Year</option>
                    <option value="2023">2023</option>
                    <option value="2024">2024</option>
                    <option value="2025">2025</option>
                </select>
            </div>
        </div>
        <div class="table-container">
            <table>
                <thead>
                    <tr>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Address</th>
                        <th>Registration Date</th>
                    </tr>
                </thead>
                <tbody id="user-table-body">
                    <?php
                    // Database connection
                    $conn = new mysqli('localhost:3306', 'kayemndjr11_123', 'Kayemondejar123!', 'kayemndjr11_123');

                    if ($conn->connect_error) {
                        die("Connection failed: " . $conn->connect_error);
                    }

                    // Fetching registered users from the database
                    // Fetching registered users from the database, ordered by registration date (latest first)
$sql = "SELECT full_name, email, phone, address, registration_date FROM users ORDER BY registration_date DESC";
$result = $conn->query($sql);

                    $result = $conn->query($sql);

                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr>
                                    <td>" . htmlspecialchars($row['full_name']) . "</td>
                                    <td>" . htmlspecialchars($row['email']) . "</td>
                                    <td>" . htmlspecialchars($row['phone']) . "</td>
                                    <td>" . htmlspecialchars($row['address']) . "</td>
                                    <td class='registration-date'>" . htmlspecialchars($row['registration_date']) . "</td>
                                  </tr>";
                        }
                    } else {
                        echo "<tr><td colspan='5'>No registered users</td></tr>";
                    }

                    $conn->close();
                    ?>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
