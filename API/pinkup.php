<?php
header('Content-Type: application/json');

// Database connection details
$host = 'localhost:3306'; // Database host
$user = 'kayemndjr11_123'; // Database username
$password = 'Kayemondejar123!'; // Database password
$database = 'kayemndjr11_123'; // Database name

// Database connection
try {
    $pdo = new PDO("mysql:host=$host;dbname=$dbname;charset=utf8mb4", $username, $password);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo json_encode(["status" => "error", "message" => "Database connection failed: " . $e->getMessage()]);
    exit();
}

// Collect and sanitize input data
$user_id = $_POST['user_id'] ?? null;
$collector_id = $_POST['collector_id'] ?? null;
$weight_kg = $_POST['weight_kg'] ?? null;
$status = $_POST['status'] ?? 'Pending';
$pickup_date = $_POST['pickup_date'] ?? null;
$pickup_time = $_POST['pickup_time'] ?? null;
$cancellation_reason = $_POST['cancellation_reason'] ?? null;
$cancellation_date = $_POST['cancellation_date'] ?? null;

// Combine pickup date and time if both are provided
$pickup_datetime = $pickup_date;
if ($pickup_date && $pickup_time) {
    $pickup_datetime = "$pickup_date $pickup_time";
}

// Check required fields
if (!$user_id || !$collector_id || !$weight_kg || !$pickup_datetime) {
    echo json_encode(["status" => "error", "message" => "Required fields are missing."]);
    exit();
}

try {
    // Begin transaction
    $pdo->beginTransaction();

    // Insert into pickups table
    $stmt = $pdo->prepare("
        INSERT INTO pickups (user_id, collector_id, weight_kg, status, pickup_date, cancellation_reason, cancellation_date) 
        VALUES (:user_id, :collector_id, :weight_kg, :status, :pickup_date, :cancellation_reason, :cancellation_date)
    ");
    $stmt->execute([
        ':user_id' => $user_id,
        ':collector_id' => $collector_id,
        ':weight_kg' => $weight_kg,
        ':status' => $status,
        ':pickup_date' => $pickup_datetime,
        ':cancellation_reason' => $cancellation_reason,
        ':cancellation_date' => $cancellation_date
    ]);

    // Get the ID of the newly inserted pickup
    $pickup_id = $pdo->lastInsertId();

    // Insert into transaction_history table
    $stmt = $pdo->prepare("
        INSERT INTO transaction_history (user_id, collector_id, pickup_date, status, amount, pickups_id) 
        VALUES (:user_id, :collector_id, :pickup_date, :status, :amount, :pickups_id)
    ");
    $stmt->execute([
        ':user_id' => $user_id,
        ':collector_id' => $collector_id,
        ':pickup_date' => $pickup_datetime,
        ':status' => $status,
        ':amount' => $weight_kg,
        ':pickups_id' => $pickup_id
    ]);

    // Commit transaction
    $pdo->commit();

    echo json_encode(["status" => "success", "message" => "Pickup scheduled and transaction recorded successfully."]);
} catch (PDOException $e) {
    // Rollback transaction on error
    $pdo->rollBack();
    echo json_encode(["status" => "error", "message" => "Database error: " . $e->getMessage()]);
}

?>
