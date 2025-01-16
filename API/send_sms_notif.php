<?php
function send_sms_notif($to, $message) {
    $url = 'https://app.philsms.com/api/v3/sms/send';
    $apiToken = '1062|TSNDmTikPlrhT5TzYiXBeWgvW2uKasP3ELQ2bXEs'; // Use the actual API token here
    $senderID = 'PhilSMS';

    $data = [
        'recipient' => $to,
        'sender_id' => $senderID,
        'type' => 'plain',
        'message' => $message
    ];

    $ch = curl_init($url);
    curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
    curl_setopt($ch, CURLOPT_HTTPHEADER, [
        'Authorization: Bearer ' . $apiToken,
        'Content-Type: application/json',
        'Accept: application/json'
    ]);
    curl_setopt($ch, CURLOPT_POST, true);
    curl_setopt($ch, CURLOPT_POSTFIELDS, json_encode($data));

    $response = curl_exec($ch);

    if ($response === false) {
        curl_close($ch);
        return false;
    }

    curl_close($ch);
    $responseData = json_decode($response, true);
    if (json_last_error() !== JSON_ERROR_NONE) {
        return false;
    }

    if (isset($responseData['status']) && $responseData['status'] === 'success') {
        return true;
    } else {
        return false;
    }
}
?>
