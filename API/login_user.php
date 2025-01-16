<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Set headers for CORS and JSON response
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');

// Database connection details
$host = 'localhost:3306';
$user = 'kayemndjr11_123';
$password = 'Kayemondejar123!';

// Connect to the database
$conn = new mysqli($host, $username, $password, $database);

if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]));
}

// Retrieve the email and password from POST request
$email = $_POST['email'];
$password = $_POST['password'];

// Check if user exists and is not a collector
$sql = "SELECT * FROM users_table WHERE email = ? AND password = ?";
$stmt = $conn->prepare($sql);
$stmt->bind_param("ss", $email, $password);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $user = $result->fetch_assoc();
    if ($user['role'] === 'user') {
        echo json_encode(["success" => true, "message" => "User login successful", "role" => "user"]);
    } else {
        echo json_encode(["success" => false, "message" => "Unauthorized access"]);
    }
} else {
    echo json_encode(["success" => false, "message" => "Invalid email or password"]);
}

$stmt->close();
$conn->close();
?>