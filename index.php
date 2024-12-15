<?php
session_start();
if (!isset($_SESSION['username']) && !isset($_SESSION['role']) && !isset($_SESSION['userid']) && !isset($_SESSION['barangay'])  ) {
	header('Location: login.php');
}
?>