<?php
// Enable error reporting for debugging
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Set response headers
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json; charset=UTF-8');
header('Access-Control-Allow-Methods: GET, POST, OPTIONS');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');

// Database connection details
$host = 'localhost:3306';
$user = 'kayemndjr11_123';
$password = 'Kayemondejar123!';
$database = 'kayemndjr11_123';

$conn = new mysqli($host, $user, $password, $database);

// Check connection
if ($conn->connect_error) {
    error_log("Database connection failed: " . $conn->connect_error);
    die(json_encode(array("status" => "error", "message" => "Database connection failed")));
}

// Fetch messages for a user
if ($_SERVER['REQUEST_METHOD'] == 'GET' && isset($_GET['user_id']) && isset($_GET['collector_id'])) {
    $userId = intval($_GET['user_id']);
    $collectorId = intval($_GET['collector_id']);

    $sql = "SELECT * FROM messages 
            WHERE (sender_id = $userId AND receiver_id = $collectorId) 
               OR (sender_id = $collectorId AND receiver_id = $userId)
            ORDER BY timestamp DESC";

    $result = $conn->query($sql);

    $messages = array();
    if ($result->num_rows > 0) {
        while ($row = $result->fetch_assoc()) {
            $messages[] = $row;
        }
        echo json_encode(array("status" => "success", "messages" => $messages));
    } else {
        echo json_encode(array("status" => "success", "messages" => []));
    }
    exit;
}

// Send a new message
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Get and decode the input JSON data
    $data = json_decode(file_get_contents("php://input"), true);

    // Log the received data for debugging
    error_log("Received Data: " . print_r($data, true));

    // Validate the input data
    $senderId = intval($data['senderId'] ?? 0);
    $senderType = $conn->real_escape_string($data['senderType'] ?? '');
    $receiverId = intval($data['receiverId'] ?? 0);
    $receiverType = $conn->real_escape_string($data['receiverType'] ?? '');
    $messageText = $conn->real_escape_string($data['messageText'] ?? '');

    if (!$senderId || !$receiverId || empty($messageText)) {
        error_log("Invalid input data: " . print_r($data, true));
        echo json_encode(array("status" => "error", "message" => "Invalid input data"));
        exit;
    }

    // Prepare and execute the insert statement
    $stmt = $conn->prepare(
        "INSERT INTO messages (sender_id, sender_type, receiver_id, receiver_type, message_text) 
         VALUES (?, ?, ?, ?, ?)"
    );
    $stmt->bind_param("isiss", $senderId, $senderType, $receiverId, $receiverType, $messageText);

    if ($stmt->execute()) {
        echo json_encode(array("status" => "success", "message" => "Message sent"));
    } else {
        error_log("Database error: " . $stmt->error);
        echo json_encode(array("status" => "error", "message" => $stmt->error));
    }

    $stmt->close();
    exit;
}

// Default response for unsupported requests
echo json_encode(array("status" => "error", "message" => "Unsupported request method"));
$conn->close();
?>
