<?php
require_once '../../constants/constants.php'; // Require the constants file
header('Content-Type: application/json');

// Database connection variables
$servername = DB_HOST;
$username = DB_USER;
$password = DB_PASSWORD;
$dbname = DB_NAME;

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    // Return a JSON-encoded error if the connection fails
    echo json_encode(['error' => 'Database connection failed']);
    exit(); // Stop script execution after an error
}


/* $sql = "SELECT name, description, imagelink, max(nbofachat) AS total_quantity_sold
FROM product 
GROUP BY name, description, imagelink
ORDER BY total_quantity_sold DESC
LIMIT 1"; */

$sql = "SELECT p.name, p.description, pi.image_url, max(p.nbofachat) AS total_quantity_sold
 FROM product p
 JOIN productimages pi ON p.id = pi.product_id
 GROUP BY p.name, p.description, pi.image_url
 ORDER BY total_quantity_sold DESC
 LIMIT 1" ;

$result = $conn->query($sql);

if ($result->num_rows > 0) {
    $row = $result->fetch_assoc();
    echo json_encode($row); // Encode the result as a JSON object
} else {
    echo json_encode(["message" => "No results found"]); // Return an error message if no results
}

$conn->close();

?>
