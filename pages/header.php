<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="assets/css/bootstrap.min.css" />
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300&display=swap" rel="stylesheet">
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>

<?php
function clean($data){
    $data = htmlspecialchars(stripslashes(trim($data)));
    return $data;
}

$isZoneLeader = clean($_SESSION['role']) === clean('Zone Leader') ? true : false;
$zone_barangay = isset($_SESSION['********']) ? clean($_SESSION['********']) : '';

?>

