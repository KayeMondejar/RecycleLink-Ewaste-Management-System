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
    $query = "SELECT user_id AS id, password FROM users WHERE email = ?";
} elseif ($role === 'collector') {
    $query = "SELECT collector_id AS id, password, status FROM collectors WHERE email = ?";
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
        if ($role === 'collector') {
            $stmt->bind_result($id, $hashedPassword, $status);
        } else {
            $stmt->bind_result($id, $hashedPassword);
        }
        $stmt->fetch();

        if (password_verify($password, $hashedPassword)) {
            if ($role === 'collector') {
                if ($status === 'Pending') {
                    $response = ['success' => false, 'message' => 'Your account is awaiting approval.'];
                } elseif ($status === 'Rejected') {
                    $response = ['success' => false, 'message' => 'Your account has been rejected.'];
                } else { // Approved
                    $response = [
                        'success' => true,
                        'role' => $role,
                        'message' => 'Login successful.',
                        'id' => $id,
                        'collector_id' => $id,
                        'fullname' => 'Collector Name Placeholder', // Replace this with an actual name column if available
                        'status' => $status
                    ];
                }
            } else { // Role is user
                $response = [
                    'success' => true,
                    'role' => $role,
                    'message' => 'Login successful.',
                    'id' => $id,
                    'user_id' => $id,
                    'full_name' => 'User Name Placeholder' // Replace this with an actual name column if available
                ];
            }
        } else {
            $response = ['success' => false, 'message' => 'Incorrect password.'];
        }
    } else {
        $response = ['success' => false, 'message' => 'No account found with this email.'];
    }
    $stmt->close();
} else {
    $response = ['success' => false, 'message' => 'Failed to prepare query: ' . $conn->error];
}

// Output the response as JSON
echo json_encode($response);
$conn->close();
?>

