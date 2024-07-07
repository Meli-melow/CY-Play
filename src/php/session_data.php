<?php
session_start();
header('Content-Type: application/json');

$response = ['username' => isset($_SESSION['username']) ? $_SESSION['username'] : null ,
'user_id' => isset($_SESSION['user_id']) ? $_SESSION['user_id'] : null];
echo json_encode($response);

?>