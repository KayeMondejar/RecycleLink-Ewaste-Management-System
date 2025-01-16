<?php
ini_set('display_errors', 1);
error_reporting(E_ALL);

header("Content-Type: application/json");
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Methods: POST, GET, OPTIONS");
header("Access-Control-Allow-Headers: Content-Type, Authorization");

if ($_SERVER['REQUEST_METHOD'] === 'OPTIONS') {
    http_response_code(200);
    exit();
}

$host = 'localhost';
$port = 3306;
$user = 'kayemndjr11_123';
$password = 'Kayemondejar123!';
$database = 'kayemndjr11_123';

$conn = new mysqli($host, $user, $password, $database, $port);

if ($conn->connect_error) {
    http_response_code(500);
    echo json_encode(["success" => false, "message" => "Database connection failed: " . $conn->connect_error]);
    exit();
}

$input = file_get_contents("php://input");
$data = json_decode($input, true);

if (json_last_error() !== JSON_ERROR_NONE) {
    http_response_code(400);
    echo json_encode(["success" => false, "message" => "Invalid JSON input: " . json_last_error_msg()]);
    exit();
}

$action = isset($data['action']) ? $data['action'] : '';

switch ($action) {
    case 'schedule':
        schedulePickup($data, $conn);
        break;
    case 'get_pickups':
        getPickupRequests($conn);
        break;
    case 'update_status':
        updatePickupStatus($data, $conn);
        break;
    default:
        http_response_code(400);
        echo json_encode(["success" => false, "message" => "Invalid action specified."]);
        break;
}

$conn->close();

function schedulePickup($data, $conn) {
    $required = ['user_id', 'weight_kg', 'pickup_date', 'pickup_time', 'e_waste_type', 'address', 'phone_number'];
    foreach ($required as $field) {
        if (empty($data[$field])) {
            http_response_code(400);
            echo json_encode(["success" => false, "message" => "Missing required field: $field"]);
            exit();
        }
    }

    $stmt = $conn->prepare("INSERT INTO pickups (user_id, collector_id, weight_kg, status, pickup_date, pickup_time, e_waste_type, address, phone_number) VALUES (?, NULL, ?, 'Pending', ?, ?, ?, ?, ?)");
    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Preparation failed: " . $conn->error]);
        exit();
    }

    $stmt->bind_param("issssss", $data['user_id'], $data['weight_kg'], $data['pickup_date'], $data['pickup_time'], $data['e_waste_type'], $data['address'], $data['phone_number']);
    if ($stmt->execute()) {
        http_response_code(201);
        echo json_encode(["success" => true, "message" => "Pickup scheduled successfully.", "pickup_id" => $stmt->insert_id]);
    } else {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Failed to schedule pickup.", "error" => $stmt->error]);
    }

    $stmt->close();
}

function getPickupRequests($conn) {
    $result = $conn->query("SELECT * FROM pickups WHERE status = 'Pending'");
    $pickups = [];
    while ($row = $result->fetch_assoc()) {
        $pickups[] = $row;
    }
    echo json_encode(["success" => true, "pickups" => $pickups]);
}

function updatePickupStatus($data, $conn) {
    $required = ['pickup_id', 'collector_id', 'status'];
    foreach ($required as $field) {
        if (empty($data[$field])) {
            http_response_code(400);
            echo json_encode(["success" => false, "message" => "Missing required field: $field"]);
            exit();
        }
    }

    $validStatuses = ['Pending', 'Approved', 'Disapproved', 'Completed'];
    if (!in_array($data['status'], $validStatuses)) {
        http_response_code(400);
        echo json_encode(["success" => false, "message" => "Invalid status value"]);
        exit();
    }

    $stmt = $conn->prepare("UPDATE pickups SET collector_id = ?, status = ? WHERE pickup_id = ?");
    if (!$stmt) {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Preparation failed: " . $conn->error]);
        exit();
    }

    $stmt->bind_param("isi", $data['collector_id'], $data['status'], $data['pickup_id']);
    if ($stmt->execute()) {
        http_response_code(200);
        echo json_encode(["success" => true, "message" => "Pickup status updated successfully."]);
    } else {
        http_response_code(500);
        echo json_encode(["success" => false, "message" => "Failed to update pickup status.", "error" => $stmt->error]);
    }

    $stmt->close();
}
?>