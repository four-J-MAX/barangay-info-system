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

    // Get all columns from the table
    $columnsQuery = "SHOW COLUMNS FROM tbluser";
    $columnsResult = $conn->query($columnsQuery);
    
    if (!$columnsResult) {
        throw new Exception("Error fetching columns: " . $conn->error);
    }

    // Get all data from the table
    $dataQuery = "SELECT * FROM tbluser";
    $dataResult = $conn->query($dataQuery);
    
    if (!$dataResult) {
        throw new Exception("Error fetching data: " . $conn->error);
    }
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>TblUser Data</title>
    <style>
        table {
            border-collapse: collapse;
            width: 100%;
            margin: 20px 0;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }
        tr:hover {
            background-color: #f5f5f5;
        }
        .container {
            padding: 20px;
            max-width: 100%;
            overflow-x: auto;
        }
        h1 {
            color: #333;
        }
        .column-info {
            margin-bottom: 20px;
        }
        .column-info table {
            width: auto;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>TblUser Table Structure and Data</h1>

        <!-- Display Column Information -->
        <h2>Table Structure</h2>
        <div class="column-info">
            <table>
                <tr>
                    <th>Column Name</th>
                    <th>Type</th>
                    <th>Null</th>
                    <th>Key</th>
                    <th>Default</th>
                    <th>Extra</th>
                </tr>
                <?php while ($column = $columnsResult->fetch_assoc()): ?>
                <tr>
                    <td><?php echo htmlspecialchars($column['Field']); ?></td>
                    <td><?php echo htmlspecialchars($column['Type']); ?></td>
                    <td><?php echo htmlspecialchars($column['Null']); ?></td>
                    <td><?php echo htmlspecialchars($column['Key']); ?></td>
                    <td><?php echo $column['Default'] !== null ? htmlspecialchars($column['Default']) : 'NULL'; ?></td>
                    <td><?php echo htmlspecialchars($column['Extra']); ?></td>
                </tr>
                <?php endwhile; ?>
            </table>
        </div>

        <!-- Display Table Data -->
        <h2>Table Data</h2>
        <table>
            <tr>
                <?php
                // Reset column result pointer
                $columnsResult->data_seek(0);
                while ($column = $columnsResult->fetch_assoc()) {
                    echo "<th>" . htmlspecialchars($column['Field']) . "</th>";
                }
                ?>
            </tr>
            <?php while ($row = $dataResult->fetch_assoc()): ?>
            <tr>
                <?php foreach ($row as $value): ?>
                <td><?php echo htmlspecialchars($value ?? 'NULL'); ?></td>
                <?php endforeach; ?>
            </tr>
            <?php endwhile; ?>
        </table>
    </div>
</body>
</html>

<?php
} catch (Exception $e) {
    echo "Error: " . $e->getMessage();
} finally {
    if (isset($conn)) {
        $conn->close();
    }
}
?>
