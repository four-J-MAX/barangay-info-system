<?php include "../connection.php";


?>

<script>
    Morris.Bar({
        element: 'morris-bar-chart3',
        data: [
            <?php
            if ($isZoneLeader) {
                $qry = mysqli_query($con, "SELECT *,count(*) as cnt FROM tblresident r WHERE r.barangay = '$zone_barangay' group by r.zone ");
            } else {
                $qry = mysqli_query($con, "SELECT *,count(*) as cnt FROM tblresident r group by r.zone ");
            }
            while ($row = mysqli_fetch_array($qry)) {
                echo "{y:'" . $row['zone'] . "',a:'" . $row['cnt'] . "'},";
            }
            ?>
        ],
        xkey: 'y',
        ykeys: ['a'],
        labels: ['Resident per Zone'],
        hideHover: 'auto',
        barColors: ['#37B7C3'] // Change this color to your desired color
    });
</script>


<!-- For Secretary -->
<?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] != 'administrator') {
    ?>

    <script>
        Morris.Bar({
            element: 'morris-bar-chart5',
            data: [
                <?php
                if ($isZoneLeader) {
                    $qry = mysqli_query($con, "SELECT *,count(*) as cnt FROM tblresident r WHERE r.barangay = '$zone_barangay' group by r.householdnum ");
                } else {
                    $qry = mysqli_query($con, "SELECT *,count(*) as cnt FROM tblresident r group by r.householdnum ");
                }
                while ($row = mysqli_fetch_array($qry)) {
                    echo "{y:'" . $row['householdnum'] . "',a:'" . $row['cnt'] . "'},";
                }
                ?>
            ],
            xkey: 'y',
            ykeys: ['a'],
            labels: ['householdnumber'],
            hideHover: 'auto',
            barColors: ['#37B7C3'] // Change this color to your desired color
        });
    </script>

    <?php
}
?>

<!-- For Admin -->
<?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] == 'administrator') {
    ?>

    <script>
        // Generate the Morris Bar Chart
        Morris.Bar({
            element: 'morris-bar-chart5',
            data: [
                <?php
                // Fetch the barangay and household counts
                if ($isZoneLeader) {
                    $qry = mysqli_query($con, "
                    SELECT barangay, COUNT(DISTINCT householdnum) as household_count
                    FROM tblresident
                    WHERE barangay = '$zone_barangay'
                    GROUP BY barangay
                ");
                } else {
                    $qry = mysqli_query($con, "
                    SELECT barangay, COUNT(DISTINCT householdnum) as household_count
                    FROM tblresident
                    GROUP BY barangay
                ");
                }

                $barangays = [];
                while ($row = mysqli_fetch_array($qry)) {
                    $barangays[] = [
                        'barangay' => $row['barangay'],
                        'household_count' => $row['household_count']
                    ];
                }

                foreach ($barangays as $barangay) {
                    echo "{y: '" . $barangay['barangay'] . "', a: " . $barangay['household_count'] . "},";
                }
                ?>
            ],
            xkey: 'y', // Barangay names as x-axis labels
            ykeys: ['a'], // Household counts
            labels: ['Households'],
            hideHover: 'auto',
            barColors: function (row, series, type) {
                // Generate a random color excluding whites and overly light colors
                let color;
                do {
                    color = '#' + Math.floor(Math.random() * 16777215).toString(16);
                } while (parseInt(color.substring(1, 3), 16) > 200 && // Red component too high
                parseInt(color.substring(3, 5), 16) > 200 && // Green component too high
                    parseInt(color.substring(5, 7), 16) > 200);  // Blue component too high
                return color;
            }
        });
    </script>

    <?php
}
?>


<!-- For Admin -->
<?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] == 'administrator') {
    ?>

    <script>
        // Bar chart for Males and Females in Barangay (Administrator)
        Morris.Bar({
            element: 'morris-bar-chart6',
            data: [
                <?php
                // Query to fetch data grouped by barangay and gender
                if ($isZoneLeader) {
                    $qry = mysqli_query($con, "
              SELECT barangay,
                     SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) as male_count,
                     SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) as female_count
              FROM tblresident 
              WHERE barangay = '$zone_barangay'
              GROUP BY barangay
          ");
                } else {
                    $qry = mysqli_query($con, "
              SELECT barangay,
                     SUM(CASE WHEN gender = 'Male' THEN 1 ELSE 0 END) as male_count,
                     SUM(CASE WHEN gender = 'Female' THEN 1 ELSE 0 END) as female_count
              FROM tblresident 
              GROUP BY barangay
          ");
                }
                while ($row = mysqli_fetch_array($qry)) {
                    echo "{y: '" . $row['barangay'] . "', male: " . $row['male_count'] . ", female: " . $row['female_count'] . "},";
                }
                ?>
            ],
            xkey: 'y',
            ykeys: ['male', 'female'],
            labels: ['Male', 'Female'],
            hideHover: 'auto',
            barColors: ['#3498db', '#e74c3c'], // Blue for male, red for female
            stacked: false // Display bars side by side
        });

        // Bar chart for Males and Females in Barangay (Secretary)
        Morris.Bar({
            element: 'morris-bar-chart6',
            data: [
                <?php
                if ($isZoneLeader) {
                    $qry = mysqli_query($con, "SELECT gender, COUNT(*) as cnt FROM tblresident WHERE barangay = '$zone_barangay' GROUP BY gender");
                } else {
                    $qry = mysqli_query($con, "SELECT gender, COUNT(*) as cnt FROM tblresident GROUP BY gender");
                }
                while ($row = mysqli_fetch_array($qry)) {
                    echo "{y: '" . $row['gender'] . "', count: " . $row['cnt'] . "},";
                }
                ?>
            ],
            xkey: 'y',
            ykeys: ['count'],
            labels: ['Residents'],
            hideHover: 'auto',
            barColors: function (row) {
                return row.label === 'Male' ? '#3498db' : '#e74c3c'; // Consistent colors for male and female
            }
        });
    </script>


    <?php
}
?>


<!-- For Secratary -->

<?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] != 'administrator') {
    ?>
    <script>
        Morris.Bar({
            element: 'morris-bar-chart6',
            data: [
                <?php
                if ($isZoneLeader) {
                    $qry = mysqli_query($con, "SELECT *,count(*) as cnt FROM tblresident r WHERE r.barangay = '$zone_barangay' group by r.gender ");
                } else {
                    $qry = mysqli_query($con, "SELECT *,count(*) as cnt FROM tblresident r group by r.gender ");
                }
                while ($row = mysqli_fetch_array($qry)) {
                    echo "{y:'" . $row['gender'] . "',a:'" . $row['cnt'] . "'},";
                }
                ?>
            ],
            xkey: 'y',
            ykeys: ['a'],
            labels: ['gender'],
            hideHover: 'auto',
            barColors: ['#37B7C3'] // Change this color to your desired color
        });
    </script>
    <?php
}
?>

</script>