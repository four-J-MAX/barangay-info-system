<!DOCTYPE html>
<html>
<?php
session_start();
if (!isset($_SESSION['role'])) {
  header("Location: ../../login.php");
} else {
  ob_start();
  include ('../head_css.php');
  
  $barangayByZoneLeader = htmlspecialchars(stripslashes(trim($_SESSION['barangay'])));
  
  ?>
  

  <body class="skin-black">
    <!-- header logo: style can be found in header.less -->
    <?php
    include "../connection.php";
    ?>
    <?php include ('../header.php'); ?>

    <div class="wrapper row-offcanvas row-offcanvas-left">
      <!-- Left side column. contains the logo and sidebar -->
      <?php include ('../sidebar-left.php'); ?>

      <!-- Right side column. Contains the navbar and content of the page -->
      <aside class="right-side">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>
            Dashboard
          </h1>
        </section>

        <!-- Main content -->
        <section class="content">

        <?= $barangayByZoneLeader ?>

          <div class="row">
            <!-- left column -->
            <div class="box">
              <!-- Total Household -->
                           <?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] == 'Administrator') {
?>
              <div class="col-md-4 col-sm-6 col-xs-12"><br>
                <div class="info-box">
                  <a href="../household/household.php"><span class="info-box-icon" style="background-color: transparent;"><i
                        class="fa fa-home"></i></span></a>
                  <div class="info-box-content">
                    <span class="info-box-text">Total number of Municipal household</span>
                    <span class="info-box-number">
                      <?php
                     if ($isZoneLeader) {
                      $q = mysqli_query($con, "SELECT * from tblhousehold WHERE barangay = '$barangayByZoneLeader'");
                      $num_rows = mysqli_num_rows($q);
                     }else{
                      $q = mysqli_query($con, "SELECT * from tblhousehold");
                      $num_rows = mysqli_num_rows($q);
                     }
                      echo $num_rows;
                      ?>
                    </span>
                  </div>
                </div>
              </div>
                <?php
}
?>
  
                             <?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] != 'Administrator') {
?>
   <div class="col-md-4 col-sm-6 col-xs-12"><br>
                <div class="info-box">
                  <a href="../household/household.php"><span class="info-box-icon" style="background-color: transparent;"><i
                        class="fa fa-home"></i></span></a>
                  <div class="info-box-content">
                    <span class="info-box-text">Total number of households</span>
                    <span class="info-box-number">
                      <?php
                     if ($isZoneLeader) {
                      $q = mysqli_query($con, "SELECT * from tblhousehold WHERE barangay = '$barangayByZoneLeader'");
                      $num_rows = mysqli_num_rows($q);
                     }else{
                      $q = mysqli_query($con, "SELECT * from tblhousehold");
                      $num_rows = mysqli_num_rows($q);
                     }
                      echo $num_rows;
                      ?>
                    </span>
                  </div>
                </div>
              </div>

                              <?php
}
?>
              <!-- Total Resident -->
              <div class="col-md-4 col-sm-6 col-xs-12"><br>
                <div class="info-box">
                  <a href="../resident/resident.php"><span class="info-box-icon" style="background-color: transparent;"><i
                        class="fa fa-users"></i></span></a>
                  <div class="info-box-content">
                    <span class="info-box-text">Total number of Municipal residents</span>
                    <span class="info-box-number">
                      <?php
                      if ($isZoneLeader) {
                        $q = mysqli_query($con, "SELECT * from tblresident WHERE barangay = '$barangayByZoneLeader'");
                      }else{
                        $q = mysqli_query($con, "SELECT * from tblresident");
                      }
                     
                      $num_rows = mysqli_num_rows($q);
                      echo $num_rows;
                      ?>
                    </span>
                  </div>
                </div>
              </div>
                           <?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] != 'Administrator') {
?>
              <!-- Total New Resident -->
              <div class="col-md-3 col-sm-6 col-xs-12"><br>
                <div class="info-box">
                  <a href="../resident/newResident.php"><span class="info-box-icon" style="background-color: transparent;"><i
                        class="fa fa-users"></i></span></a>
                  <div class="info-box-content">
                    <span class="info-box-text">Total New Resident</span>
                    <span class="info-box-number">
                      <?php
                      if ($isZoneLeader) {
                        $q = mysqli_query($con, "SELECT * from tblresident WHERE barangay = '$barangayByZoneLeader' AND status = 'New Resident'");
                      }else{
                        $q = mysqli_query($con, "SELECT * from tblresident WHERE status = 'New Resident'");
                      }
                      $num_rows = mysqli_num_rows($q);
                      echo $num_rows;
                      ?>
                    </span>
                  </div>
                </div>
              </div>
                <?php
}
?>
              
                                       <?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] != 'Administrator') {
?>

              <!-- Clearance Issued -->
              <div class="col-md-3 col-sm-6 col-xs-12"><br>
                <div class="info-box">
                  <a href="../clearance/clearance.php"><span class="info-box-icon" style="background-color: transparent;"><i
                        class="fa fa-file"></i></span></a>
                  <div class="info-box-content">
                    <span class="info-box-text">Clearance Issued</span>
                    <span class="info-box-number">
                      <?php
                      if ($isZoneLeader) {
                        $q = mysqli_query($con, "SELECT * from tblclearance where status = 'Approved' AND barangay = '$barangayByZoneLeader' ");
                      }else{
                        $q = mysqli_query($con, "SELECT * from tblclearance where status = 'Approved'");
                      }
                      $num_rows = mysqli_num_rows($q);
                      echo $num_rows;
                      ?>
                    </span>
                  </div>
                </div>
              </div>

              <!-- Permit Issued -->
              <div class="col-md-3 col-sm-6 col-xs-12"><br>
                <div class="info-box">
                  <a href="../permit/permit.php"><span class="info-box-icon" style="background-color: transparent;"><i
                        class="fa fa-file"></i></span></a>
                  <div class="info-box-content">
                    <span class="info-box-text">Permit Issued</span>
                    <span class="info-box-number">
                      <?php
                     if ($isZoneLeader) {
                      $q = mysqli_query($con, "SELECT * from tblpermit where status = 'Approved' AND businessAddress = '$barangayByZoneLeader' ");
                     }else{
                      $q = mysqli_query($con, "SELECT * from tblpermit where status = 'Approved'");
                     }
                      $num_rows = mysqli_num_rows($q);
                      echo $num_rows;
                      ?>
                    </span>
                  </div>
                </div>
              </div>

              <!-- Blotter Issued -->
              <div class="col-md-3 col-sm-6 col-xs-12"><br>
                <div class="info-box">
                  <a href="../blotter/blotter.php"><span class="info-box-icon" style="background-color: transparent;"><i
                        class="fa fa-user"></i></span></a>
                  <div class="info-box-content">
                    <span class="info-box-text">Blotter Issued</span>
                    <span class="info-box-number">
                      <?php
                      if ($isZoneLeader) {
                        $q = mysqli_query($con, "SELECT * from tblblotter WHERE barangay = '$barangayByZoneLeader'");
                      }else{
                        $q = mysqli_query($con, "SELECT * from tblblotter");
                      }
                      $num_rows = mysqli_num_rows($q);
                      echo $num_rows;
                      ?>
                    </span>
                  </div>
                </div>
              </div>
                              <?php
}
?>
  
            </div> <!-- /.row -->

<div class="row">
            <?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] != 'Administrator') {
?>
  <!-- Population per Zone/Purok -->
  <div class="col-md-12 col-sm-12 col-xs-12">
    <div class="panel panel-default">
      <div class="panel-heading">
        Population per Zone/Purok
      </div>
      <div class="panel-body">
        <div id="morris-bar-chart3"></div>
      </div>
    </div>
  </div>
<?php
}
?>

              <!-- Males and Females in Barangay -->
              <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    Males and Females in Barangay
                  </div>
                  <div class="panel-body">
                    <div id="morris-bar-chart6"></div>
                  </div>
                </div>
              </div>
                           <?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] == 'Administrator') {
?>
              <!-- Resident Educational Attainment -->
              <div class="col-md-6 col-sm-12 col-xs-12">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    Resident Educational Attainment
                  </div>
                  <div class="panel-body">
                    <div id="morris-donut-chart"></div>
                  </div>
                </div>
              </div>
  <?php
}
?>


              <!-- Total Households -->
              <div class="col-md-12 col-sm-12 col-xs-12">
                <div class="panel panel-default">
                  <div class="panel-heading">
                    Total number of Municipal household bar graph
                  </div>
                  <div class="panel-body">
                    <div id="morris-bar-chart5"></div>
                  </div>
                </div>
              </div>
 </div> <!-- /.row -->
            </div><!-- /.box -->

        </section><!-- /.content -->
      </aside><!-- /.right-side -->
    </div><!-- ./wrapper -->
    <!-- jQuery 2.0.2 -->
  <?php }
include "../footer.php";
include "donut-chart.php";
include "bar-chart.php"; ?>
  <script type="text/javascript">
    $(function () {
      $("#table").dataTable({
        "aoColumnDefs": [{ "bSortable": false, "aTargets": [0, 5] }], "aaSorting": []
      });
    });
  </script>
</body>

</html>
