<?php
require_once '../../constants/constants.php'; // Require the constants file
session_start() ;

// Connect to your database
header('Content-Type: application/json');

// Database connection variables
$servername = DB_HOST;
$username = DB_USER;
$password = DB_PASSWORD;
$dbname = DB_NAME;

$conn = new mysqli($servername , $username , $password, $dbname);  // Create


if ($conn->connect_error) {
    echo json_encode(['status' => 'error', 'message' => 'Connection failed: ' . $conn->connect_error]);
    exit;
}

// Retrieve data from the AJAX request
$data = json_decode(file_get_contents('php://input'), true);

// Prepare your INSERT statement
$stmt = $conn->prepare("INSERT INTO user (name, email, password, pronoun) VALUES (?, ?, ?, ?)");
$stmt->bind_param("ssss", $name, $email, $password, $pronoun);




// Assign variables

$name = $data['name'];
$email = $data['email'];
$password = password_hash($data['password'], PASSWORD_DEFAULT);

/* password_hash($data['password'], PASSWORD_DEFAULT); */
$pronoun = $data['pronoun'];


// Write a query to get the user_id from the database using the name and email
$userIdQuery = $conn->prepare("SELECT id FROM user WHERE name = ? AND email = ?");
$userIdQuery->bind_param("ss", $name, $email);
$userIdQuery->execute();
$userIdResult = $userIdQuery->get_result();
$userIdRow = $userIdResult->fetch_assoc();
$userId = $userIdRow['id'];
$userIdQuery->close();

$userIdQuery = $conn->$pronoun = $data['pronoun'];

try {
    // Execute the query
    $stmt->execute();
    $_SESSION['user'] = ['name' => $name , 'email' => $email /* , 'user_id' => $userId  */];
    echo json_encode(['status' => 'success', 'message' => 'New record created successfully' , 'name' => $_SESSION['user']['name']]);
} catch (mysqli_sql_exception $e) {
    $message = 'Error: ' . $e->getMessage();
    if ($e->getCode() == 1062) {
        $message = 'This email is already registered.';
    }
    echo json_encode(['status' => 'error', 'message' => $message ]);
}

// Close connections
$stmt->close();
$conn->close();
?>