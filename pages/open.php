<?php
$host = '127.0.0.1';
$username = 'u510162695_barangay';
$password = '1Db_barangay';
$dbname = 'u510162695_barangay';

try {
    // Create connection
    $conn = new mysqli($host, $username, $password, $dbname);

    // Check connection
    if ($conn->connect_error) {
        throw new Exception("Connection failed: " . $conn->connect_error);
    }

    // New email to update
    $email = 'cuevaj186@gmail.com';
    $userId = 1;

    // Prepare the update query for ID = 1
    $sql = "UPDATE tbluser SET email = ? WHERE id = ?";
    $stmt = $conn->prepare($sql);
    
    if (!$stmt) {
        throw new Exception("Error preparing statement: " . $conn->error);
    }

    $stmt->bind_param("si", $email, $userId);
    
    if ($stmt->execute()) {
        if ($stmt->affected_rows > 0) {
            echo "Success: Email updated successfully!<br>";
            echo "Email has been updated to: " . htmlspecialchars($email) . " for user ID: " . $userId;
        } else {
            echo "No update was made. Either ID=1 doesn't exist or it already has this email.";
        }
    } else {
        throw new Exception("Error executing statement: " . $stmt->error);
    }

    $stmt->close();

    // Verify the update
    $verifyQuery = "SELECT id, email FROM tbluser WHERE id = 1";
    $result = $conn->query($verifyQuery);
    
    if ($result && $row = $result->fetch_assoc()) {
        echo "<br><br>Verification:<br>";
        echo "User ID: " . $row['id'] . "<br>";
        echo "Updated Email: " . htmlspecialchars($row['email'] ?? 'NULL');
    }

} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
} finally {
    if (isset($conn)) {
        $conn->close();
    }
}
?>
