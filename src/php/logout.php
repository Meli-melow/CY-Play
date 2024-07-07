
<!-- removing the session variable -->


 <?php
 session_start();
 header('Content-Type: application/json');

 // Unset the session variables
 unset($_SESSION['user_id']);
 unset($_SESSION['username']);
  
 // Send a success response
 echo json_encode(['status' => true, 'message' => 'Session data removed successfully']);
 ?>