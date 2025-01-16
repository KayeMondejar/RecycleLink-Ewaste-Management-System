<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type');

// Database connection details
$host = 'localhost:3306';
$user = 'kayemndjr11_123';
$password = 'Kayemondejar123!';
$database = 'kayemndjr11_123';

// Connect to the database
$conn = new mysqli("localhost:3306", "kayemndjr11_123", "Kayemondejar123!", "kayemndjr11_123");

// Check for connection errors
if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => "Connection failed: " . $conn->connect_error]);
    exit();
}

// Get the JSON data from the request
$data = json_decode(file_get_contents("php://input"));

// Check if all required fields are provided
if (empty($data->full_name) || empty($data->email) || empty($data->phone) || empty($data->password) || empty($data->address)) {
    echo json_encode(['success' => false, 'message' => 'Please fill in all required fields']);
    exit();
}

// Sanitize and prepare the data
$full_name = $conn->real_escape_string($data->full_name);
$email = $conn->real_escape_string($data->email);
$phone = $conn->real_escape_string($data->phone);
$address = $conn->real_escape_string($data->address);
$password = password_hash($data->password, PASSWORD_DEFAULT); // Hash the password

// Insert the data into the users table (without specifying the id, as it auto-increments)
$sql = "INSERT INTO users (full_name, email, phone, address, password, registration_date) 
        VALUES (?, ?, ?, ?, ?, NOW())";
$stmt = $conn->prepare($sql);
$stmt->bind_param("sssss", $full_name, $email, $phone, $address, $password);

// Execute and check for errors
if ($stmt->execute()) {
    echo json_encode(['success' => true, 'message' => 'Registration successful']);
} else {
    echo json_encode(['success' => false, 'message' => 'Failed to register: ' . $stmt->error]);
}

// Close the statement and connection
$stmt->close();
$conn->close();
?>
