<?php
require_once '../../constants/constants.php'; // Require the constants file
// Database credentials
$servername = DB_HOST;
$username = DB_USER;
$password = DB_PASSWORD;
$dbname =  DB_NAME;

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Get the JSON POST data
$json = file_get_contents('php://input');
$data = json_decode($json);

// Prepare the SQL statement
$stmt = $conn->prepare("INSERT INTO mails (name, pronoun, email, message, dateofbirth, sujet) VALUES (?, ?, ?, ?, ?, ?)");
$stmt->bind_param("ssssss", $data->name, $data->prenom, $data->email, $data->sujet, $data->birthDate, $data->sujet );

// Execute the statement and check for errors
if ($stmt->execute()) {
    echo "New record created successfully";
} else {
    echo "Error: " . $stmt->error;
}

$stmt->close();
$conn->close();
?>
