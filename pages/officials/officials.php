<!DOCTYPE html>
<html>

    <?php
    session_start();
    if(!isset($_SESSION['role']))
    {
        header("Location: ../../login.php"); 
    }
    else
    {
    ob_start();
    include('../head_css.php'); ?>
    <body class="skin-black">
        <!-- header logo: style can be found in header.less -->
        <?php 
        
        include "../connection.php";
        ?>
        <?php include('../header.php'); ?>

        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <?php include('../sidebar-left.php'); ?>

            <!-- Right side column. Contains the navbar and content of the page -->
            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Barangay Officials
                    </h1>
                    
                </section>

                <!-- Main content -->
                <section class="content">
                    <div class="row">
                        <!-- left column -->
                            <div class="box">
                                <div class="box-header">
                                    <div style="padding:10px;">
                                        <?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] == 'administrator') {
?>
                                        <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addCourseModal"><i class="fa fa-user-plus" aria-hidden="true"></i> Add Officials</button>  

                                        <?php 
                                            if(!isset($_SESSION['staff']))
                                            {
                                        ?>
                                        <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</button> 
                                        <?php
                                            }
}
                                        ?>
                                
                                    </div>                                
                                </div><!-- /.box-header -->
                                <div class="box-body table-responsive">
                                <form method="post">
                                    <table id="table" class="table table-bordered table-striped">
                                        <thead>
                                            <tr>
                                                <?php 
                                                    if(!isset($_SESSION['staff']))
                                                    {
                                                ?>
                                                <th style="width: 20px !important;"><input type="checkbox" name="chk_delete[]" class="cbxMain" onchange="checkMain(this)"/></th>
                                                <?php
                                                    }
                                                ?>
                                                <th>Position</th>
                                                <th>Name</th>
                                                <th>Contact</th>
                                                <th>Address</th>
                                                <th>Start of Term</th>
                                                <th>End of Term</th>
                                                                                                <?php
// Check if the session role is not equal to 'Administrator'
if ($_SESSION['role'] == 'administrator') {
?>
                                                <th style="width: 130px !important;">Option</th>
                                            <?php
}
?>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <?php
if (!isset($_SESSION['staff'])) {
    if ($isZoneLeader) {
        $squery = mysqli_query($con, "select * from tblofficial WHERE barangay = '$zone_barangay' ");
    } else {
        $squery = mysqli_query($con, "select * from tblofficial ");
    }
    while ($row = mysqli_fetch_array($squery)) {
        echo '
        <tr>
            <td><input type="checkbox" name="chk_delete[]" class="chk_delete" value="' . $row['id'] . '" /></td>
            <td>' . $row['sPosition'] . '</td>
            <td>' . $row['completeName'] . '</td>
            <td>' . $row['pcontact'] . '</td>
            <td>' . $row['paddress'] . '</td>
            <td>' . $row['termStart'] . '</td>
            <td>' . $row['termEnd'] . '</td>
            <td>';
        
        // Only show buttons if the role is 'Administrator'
        if ($_SESSION['role'] == 'Administrator') {
            echo '
                <button class="btn btn-primary btn-sm" data-target="#editModal' . $row['id'] . '" data-toggle="modal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</button>';
            if ($row['status'] == 'Ongoing Term') {
                echo '<button class="btn btn-danger btn-sm" data-target="#endModal' . $row['id'] . '" data-toggle="modal"><i class="fa fa-minus-circle" aria-hidden="true"></i> End</button>';
            } else {
                echo '<button class="btn btn-success btn-sm" data-target="#startModal' . $row['id'] . '" data-toggle="modal"><i class="fa fa-plus-circle" aria-hidden="true"></i> Start</button>';
            }
        }
        
        echo '</td>
        </tr>';

        include "edit_modal.php";
        include "endterm_modal.php";
        include "startterm_modal.php";
    }
} else {
    $squery = mysqli_query($con, "select * from tblofficial where status = 'Ongoing Term' group by termend");
    while ($row = mysqli_fetch_array($squery)) {
        echo '
        <tr>
            <td>' . $row['sPosition'] . '</td>
            <td>' . $row['completeName'] . '</td>
            <td>' . $row['pcontact'] . '</td>
            <td>' . $row['paddress'] . '</td>
            <td>' . $row['termStart'] . '</td>
            <td>' . $row['termEnd'] . '</td>';

        // Only show the "Edit" button if the role is 'Administrator'
        if ($_SESSION['role'] == 'administrator') {
            echo '<td><button class="btn btn-primary btn-sm" data-target="#editModal' . $row['id'] . '" data-toggle="modal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</button></td>';
        }
        
        echo '</tr>';

        include "edit_modal.php";
    }
}
?>
                                        </tbody>
                                    </table>

                                    <?php include "../deleteModal.php"; ?>

                                    </form>
                                </div><!-- /.box-body -->
                            </div><!-- /.box -->

                            <?php include "../duplicate_error.php"; ?>
                            <?php include "../edit_notif.php"; ?>

                            <?php include "../added_notif.php"; ?>

                            <?php include "../delete_notif.php"; ?>

            <?php include "add_modal.php"; ?>

            <?php include "function.php"; ?>


                    </div>   <!-- /.row -->
                </section><!-- /.content -->
            </aside><!-- /.right-side -->
        </div><!-- ./wrapper -->
        <!-- jQuery 2.0.2 -->
        <?php }
        include "../footer.php"; ?>
<script type="text/javascript">
    <?php
    if(!isset($_SESSION['staff']))
    {
    ?>
        $(function() {
            $("#table").dataTable({
               "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 0,7 ] } ],"aaSorting": []
            });
        });
    <?php
    }
    else{
    ?>
        $(function() {
            $("#table").dataTable({
               "aoColumnDefs": [ { "bSortable": false, "aTargets": [ 6 ] } ],"aaSorting": []
            });
        });
    <?php
    }

$request = $_SERVER['REQUEST_URI'];
if (substr($request, -4) == '.php') {
    $new_url = substr($request, 0, -4);
    header("Location: $new_url", true, 301);
    exit();
}
    ?>
</script>
    </body>
</html>
