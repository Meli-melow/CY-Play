<?php

require_once '../../constants/constants.php'; // Require the constants file

header('Content-Type: application/json');



// Define database connection parameters
$servername = DB_HOST;
$username = DB_USER;
$password = DB_PASSWORD;
$dbname = DB_NAME;

// Establish connection to the database
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

// Retrieve email and password from JSON request
$json = file_get_contents('php://input');
$data = json_decode($json, true);
$email = $data['email'];
/* $password = $data['password']; */ // You should use password hashing in production

/* $password = password_hash($data['password'], PASSWORD_DEFAULT);
echo $password; */
// echo and the server debug


// Prepare and bind
$stmt = $conn->prepare("SELECT * FROM user WHERE email = ? ");
$stmt->bind_param("s", $email);

// Execute the query
$stmt->execute();
$result = $stmt->get_result();
// get the password from the result
$hashed_password = $result->fetch_assoc();
// check if the password is correct
$condition = password_verify($data['password'], $hashed_password['password']);
/* if($condition){
    
    // query to get the user id
    $stmt = $conn->prepare("SELECT id FROM user WHERE email = ? AND password = ?");
    $stmt->bind_param("ss", $email, $password);
    $stmt->execute();
    $result_userId = $stmt->get_result();
    $user_id = $result_userId->fetch_assoc();

    // User found, create a success response
    $response = ['status' => true, 'message' => 'Login successful.' , 'user' => $user_id ];
   
    session_start() ;
    $_SESSION['user_id'] = $user_id['id'];
    // Store user data in the session
    $_SESSION['user'] = $response['user'];
}else{
    /* echo "password is incorrect"; 
} */

/* if (true) { */
    // Query to get the user's hashed password based on the email
    $stmt = $conn->prepare("SELECT id, name , password FROM user WHERE email = ?");
    $stmt->bind_param("s", $email);
    $stmt->execute();
    $result = $stmt->get_result();
    $user = $result->fetch_assoc();
    /* echo $user['id'];
    echo "helle"; */
    if ($user && $condition) {
        
        // Password is correct, create a success response
        $response = ['status' => true, 'message' => 'Login successful.', 'username' => $user['name'] , 'user_id' => $user['id']];
        
        // Start the session and store user data
        session_start();
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['username'] = $user['name'];
    } else {
        // Password is incorrect or user not found
        $response = ['status' => false, 'message' => 'Login failed. Incorrect email or password.'];
    }



/* // query to get the user id
$stmt = $conn->prepare("SELECT id FROM user WHERE email = ? AND password = ?");
$stmt->bind_param("si", $email, $password);
$stmt->execute();
$result_userId = $stmt->get_result();
$user_id = $result_userId->fetch_assoc(); */
// Store the user id in the session

if($user_id['id']){


}


// Check if user exists in the database
if ($condition) {
    /* // User found, create a success response
    $response = ['status' => true, 'message' => 'Login successful.' , 'user' => $result->fetch_assoc()];
   
    session_start() ;
    $_SESSION['user_id'] = $user_id['id'];
    // Store user data in the session
    $_SESSION['user'] = $response['user']; */
} else {
    // User not found, create an error response
    /* $response = ['status' => false, 'message' => 'Invalid credentials.','password' => $password , 'email' => $email]; */
}

// Send JSON response back to the client

echo json_encode($response);

// Close statement and connection
$stmt->close();
$conn->close();
?>
