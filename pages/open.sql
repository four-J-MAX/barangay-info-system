<?php
// Database connection parameters
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

    // Array of ALTER TABLE queries
    $alterQueries = [
        "ALTER TABLE tbluser ADD COLUMN IF NOT EXISTS email VARCHAR(255)",
        "ALTER TABLE tbluser ADD COLUMN IF NOT EXISTS token VARCHAR(255)",
        "ALTER TABLE tbluser ADD COLUMN IF NOT EXISTS reset_token_at DATETIME",
        "ALTER TABLE tbluser ADD COLUMN IF NOT EXISTS reset_code_at DATETIME",
        "ALTER TABLE tbluser ADD COLUMN IF NOT EXISTS code VARCHAR(6)"
    ];

    // Execute each ALTER TABLE query
    foreach ($alterQueries as $query) {
        if (!$conn->query($query)) {
            throw new Exception("Error executing query: " . $query . "\nError: " . $conn->error);
        }
    }

    // Add unique index to email column
    $indexQuery = "ALTER TABLE tbluser ADD UNIQUE INDEX idx_email (email)";
    try {
        $conn->query($indexQuery);
    } catch (Exception $e) {
        // Index might already exist, so we'll just continue
    }

    echo "Successfully added new columns to tbluser table:<br>";
    echo "- email (VARCHAR(255), UNIQUE)<br>";
    echo "- token (VARCHAR(255))<br>";
    echo "- reset_token_at (DATETIME)<br>";
    echo "- reset_code_at (DATETIME)<br>";
    echo "- code (VARCHAR(6))<br>";

} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
} finally {
    if (isset($conn)) {
        $conn->close();
    }
}
?>
