<?php

require_once '../../constants/constants.php';
// Start or resume a session
session_start();

// Create a connection to the database
$mysqli = new mysqli(DB_HOST, DB_USER, DB_PASSWORD, DB_NAME);
if ($mysqli->connect_error) {
    die("Connection failed: " . $mysqli->connect_error);
}

try {
    // Check if user ID is available in the session
    if (!isset($_SESSION['user_id'])) {
        throw new Exception("User is not logged in.");
    }
    $user_id = $_SESSION['user_id'];

    // Get product_id from the form data
    $product_id = isset($_POST['product_id']) ? (int)$_POST['product_id'] : null;

    if ($product_id === null) {
        throw new Exception("Product ID is missing.");
    }

    // Start transaction
    $mysqli->begin_transaction();

    // Decrement the stock for the given product_id
    $decrementStockSql = "UPDATE product SET stock = stock - 1 WHERE id = $product_id AND stock > 0";
    if (!$mysqli->query($decrementStockSql) || $mysqli->affected_rows === 0) {
      echo json_encode( $product_id  ); 
        echo json_encode( $mysqli->query($decrementStockSql) );
        throw new Exception("No stock available or product does not exist.");
    }

    // Add a new command entry with user ID and status 'pending'
    $addCommandSql = "INSERT INTO commande (product_id, user_id, status, order_date, quantity) 
                  VALUES ($product_id, $user_id, 'pending', CURDATE(), COALESCE(quantity, 0) + 1)
                  ON DUPLICATE KEY UPDATE quantity = COALESCE(quantity, 0) + 1, order_date = CURDATE()";



    /* $addCommandSql = "INSERT INTO commande (product_id, user_id, status) VALUES ($product_id, $user_id, 'pending')"; */
    if (!$mysqli->query($addCommandSql)) {
        throw new Exception("Failed to insert command.");
    }

    // Commit transaction
    $mysqli->commit();

    // Sending a success response back to the front end
    echo json_encode(["status" => true, "message" => "Produit ajouté avec succès"]);
} catch (Exception $e) {
    // Roll back if any error occurs
    $mysqli->rollback();
    echo json_encode(["status" => false, "message" => "Error: " . $e->getMessage()]);
} finally {
    // Close the database connection
    $mysqli->close();
}
?>
