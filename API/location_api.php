<?php
// Enable error reporting for development
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Set response headers for CORS and JSON content
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=UTF-8');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');

// Database connection details
$host = 'localhost';  // Adjusted: without the port
$user = 'kayemndjr11_123';
$password = 'Kayemondejar123!';
$dbname = 'locations';

// Create connection
$conn = new mysqli($host, $user, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die(json_encode(array("error" => "Connection failed: " . $conn->connect_error)));
}

// Handle POST requests (to insert location data)
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $user_id = $_POST['user_id'];
    $collector_id = $_POST['collector_id'];
    $user_latitude = $_POST['user_latitude'];
    $user_longitude = $_POST['user_longitude'];
    $collector_latitude = $_POST['collector_latitude'];
    $collector_longitude = $_POST['collector_longitude'];

    $sql = "INSERT INTO locations (user_id, collector_id, user_latitude, user_longitude, collector_latitude, collector_longitude)
            VALUES ('$user_id', '$collector_id', '$user_latitude', '$user_longitude', '$collector_latitude', '$collector_longitude')";

    if ($conn->query($sql) === TRUE) {
        echo json_encode(array("success" => "Location data inserted successfully"));
    } else {
        echo json_encode(array("error" => "Error: " . $sql . "<br>" . $conn->error));
    }
}

// Handle GET requests (to retrieve location data)
if ($_SERVER['REQUEST_METHOD'] == 'GET') {
    $user_id = $_GET['user_id'];
    $collector_id = $_GET['collector_id'];

    $sql = "SELECT * FROM locations WHERE user_id = '$user_id' AND collector_id = '$collector_id' ORDER BY timestamp DESC LIMIT 1";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        echo json_encode($row);
    } else {
        echo json_encode(array("error" => "No location data found"));
    }
}

// Close the database connection
$conn->close();
?>
