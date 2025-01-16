<?php
ini_set('display_errors', 1);
ini_set('display_startup_errors', 1);
error_reporting(E_ALL);

// Include the send_sms_notif function
include_once 'send_sms_notif.php';

// Set headers for CORS and JSON response
header('Access-Control-Allow-Origin: *');
header('Content-Type: application/json');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Headers, Authorization, X-Requested-With');

// Database connection details
$host = 'localhost:3306';
$user = 'kayemndjr11_123';
$password = 'Kayemondejar123!';
$database = 'kayemndjr11_123';  

// Connect to the database
$conn = new mysqli($host, $user, $password, $database);

if ($conn->connect_error) {
    die(json_encode(["success" => false, "message" => "Connection failed: " . $conn->connect_error]));
}

// Check if collector ID and status are passed in POST request
if (isset($_POST['id']) && isset($_POST['status'])) {
    $collector_id = $_POST['id'];
    $status = $_POST['status'];

    // Prepare the SQL update query
    $updateQuery = "UPDATE collectors SET status = ? WHERE collector_id = ?";
    $stmt = $conn->prepare($updateQuery);

    if ($stmt === false) {
        echo json_encode(["success" => false, "message" => "Error preparing query: " . $conn->error]);
        exit();
    }

    // Bind the parameters (status as string, collector_id as integer)
    $stmt->bind_param("si", $status, $collector_id);

    // Execute the query
    if ($stmt->execute()) {
        // If approved, send an SMS notification
        if ($status === 'Approved') {
            // Fetch the collector's phone number
            $query = "SELECT phone FROM collectors WHERE collector_id = ?";
            $fetchStmt = $conn->prepare($query);
            $fetchStmt->bind_param("i", $collector_id);
            $fetchStmt->execute();
            $result = $fetchStmt->get_result();

            if ($result->num_rows > 0) {
                $collector = $result->fetch_assoc();
                $phone = $collector['phone'];

                // Send SMS notification
                $message = "Congratulations! Your account has been approved. You can now access the RecycleLink dashboard.";
                if (send_sms_notif($phone, $message)) {
                    echo json_encode(["success" => true, "message" => "Collector status updated and SMS sent successfully!"]);
                } else {
                    echo json_encode(["success" => true, "message" => "Collector status updated, but failed to send SMS."]);
                }
            }
        } else {
            echo json_encode(["success" => true, "message" => "Collector status updated successfully!"]);
        }
    } else {
        echo json_encode(["success" => false, "message" => "Error updating status: " . $stmt->error]);
    }

    // Close the statement and connection
    $stmt->close();
    $conn->close();
} else {
    echo json_encode(["success" => false, "message" => "Required parameters missing"]);
}
?>
