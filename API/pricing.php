<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: GET');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');

// Database credentials
$host = 'localhost:3306';
$user = 'kayemndjr11_123';
$password = 'Kayemondejar123!';
$database = 'kayemndjr11_123';

// Create connection
$conn = new mysqli($host, $user, $password, $database);

// Check connection
if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]));
}

// Get user ID
$userId = $_GET['user_id'] ?? null;

if (!$userId) {
    echo json_encode(["success" => false, "message" => "User ID is required"]);
    exit;
}

// Fetch the latest pickup based on created_at
$sql = "SELECT pickup_id, weight_kg, e_waste_type, status, created_at 
        FROM pickups 
        WHERE user_id = ? 
        ORDER BY created_at DESC 
        LIMIT 1";

$stmt = $conn->prepare($sql);
$stmt->bind_param("i", $userId);
$stmt->execute();
$result = $stmt->get_result();

if ($result->num_rows > 0) {
    $pickup = $result->fetch_assoc();

    // Pricing logic
    $pricingTable = [
        'Small' => ['Type 1' => 100, 'Type 2' => 200, 'Type 3' => 300],
        'Medium' => ['Type 1' => 150, 'Type 2' => 250, 'Type 3' => 350],
        'Large' => ['Type 1' => 200, 'Type 2' => 300, 'Type 3' => 400],
        'XL' => ['Type 1' => 250, 'Type 2' => 350, 'Type 3' => 450],
    ];

    $weight = $pickup['weight_kg'];
    $type = $pickup['e_waste_type'];

    // Only calculate price if status is not 'completed'
    $price = $pickup['status'] === 'completed'
        ? null // Set price to null for completed pickups
        : ($pricingTable[$weight][$type] ?? 0);

    $pickup['price'] = $price;
    $pickup['status'] = strtolower($pickup['status']); // Convert to lowercase

    echo json_encode(["success" => true, "pickup" => $pickup]);
} else {
    echo json_encode(["success" => false, "message" => "No pickups found for this user"]);
}

$conn->close();
?>
