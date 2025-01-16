<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');

$host = 'localhost:3306';
$user = 'kayemndjr11_123';
$password = 'Kayemondejar123!';
$database = 'kayemndjr11_123';

$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    echo json_encode(['success' => false, 'message' => 'Connection failed: ' . $conn->connect_error]);
    exit();
}

// Get the input data
$data = json_decode(file_get_contents("php://input"), true);
$email = $data['email'] ?? '';
$password = $data['password'] ?? '';
$role = $data['role'] ?? '';

if (empty($email) || empty($password) || empty($role)) {
    echo json_encode(['success' => false, 'message' => 'Please provide email, password, and role.']);
    exit();
}

// Define the query based on the role
if ($role === 'user') {
    $query = "SELECT id, password FROM users WHERE email = ?";
} elseif ($role === 'collector') {
    $query = "SELECT id, password FROM collectors WHERE email = ?";
} else {
    echo json_encode(['success' => false, 'message' => 'Invalid role specified.']);
    exit();
}

$response = [];
if ($stmt = $conn->prepare($query)) {
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $stmt->store_result();

    if ($stmt->num_rows > 0) {
        $stmt->bind_result($id, $hashedPassword);
        $stmt->fetch();

        // Debugging output to check the retrieved hash and password verification
        error_log("Debug Info:");
        error_log("Provided password: $password");
        error_log("Hash from database: $hashedPassword");
        error_log("Password verify result: " . (password_verify($password, $hashedPassword) ? "true" : "false"));

        // Perform the password verification
        if (password_verify($password, $hashedPassword)) {
            $response = ['success' => true, 'role' => $role, 'message' => 'Login successful.'];
        } else {
            $response = ['success' => false, 'message' => 'Password verification failed.'];
        }
    } else {
        $response = ['success' => false, 'message' => 'No account found with this email.'];
    }
    $stmt->close();
} else {
    $response = ['success' => false, 'message' => 'Failed to prepare query.'];
}

echo json_encode($response);
$conn->close();