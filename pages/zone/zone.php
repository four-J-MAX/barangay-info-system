<!DOCTYPE html>
<html>

<?php
session_start();
if (!isset($_SESSION['role'])) {
    header("Location: ../../login.php");
    exit;
}
ob_start();
include('../head_css.php'); ?>
<body class="skin-black">
    <?php include "../connection.php"; ?>
    <?php include('../header.php'); ?>

    <div class="wrapper row-offcanvas row-offcanvas-left">
        <?php include('../sidebar-left.php'); ?>

        <aside class="right-side">
            <section class="content-header">
                <h1>Zone/Purok Leader</h1>
            </section>

            <section class="content">
                <div class="row">
                    <div class="box">
                        <div class="box-header">
                            <div style="padding:10px;">
                                <button class="btn btn-primary btn-sm" data-toggle="modal" data-target="#addZoneModal"><i class="fa fa-user-plus" aria-hidden="true"></i> Add Zone/Purok Leader</button>
                                <?php if (!isset($_SESSION['staff'])) { ?>
                                    <button class="btn btn-danger btn-sm" data-toggle="modal" data-target="#deleteModal"><i class="fa fa-trash-o" aria-hidden="true"></i> Delete</button>
                                <?php } ?>
                            </div>
                        </div>

                        <div class="box-body table-responsive">
                            <form method="post">
                                <table id="table" class="table table-bordered table-striped">
                                    <thead>
                                        <tr>
                                            <?php if (!isset($_SESSION['staff'])) { ?>
                                                <th style="width: 20px !important;"><input type="checkbox" class="cbxMain" onchange="checkMain(this)" /></th>
                                            <?php } ?>
                                            <th>Zone/Purok</th>
                                            <th>Username</th>
                                            <th style="width: 40px !important;">Option</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <?php
                                        $query = "SELECT * FROM tblzone";
                                        $squery = mysqli_query($con, $query);
                                        while ($row = mysqli_fetch_array($squery)) {
    $isApproved = isset($row['isApproved']) && $row['isApproved'] == 1;
    echo '<tr>';
    if (!isset($_SESSION['staff'])) {
        echo '<td><input type="checkbox" name="chk_delete[]" class="chk_delete" value="' . $row['id'] . '" /></td>';
    }
    echo '<td>' . $row['zone'] . '</td>';
    echo '<td>' . $row['username'] . '</td>';
                                            echo '<td>';
                                            echo '<button class="btn btn-primary btn-sm" data-target="#editModal'.$row['id'].'" data-toggle="modal"><i class="fa fa-pencil-square-o" aria-hidden="true"></i> Edit</button>';
                                            echo '</td>';
    echo '</tr>';
                                            include "edit_modal.php";
}

                                        ?>
                                    </tbody>
                                </table>

                                <?php include "../deleteModal.php"; ?>
                            </form>
                        </div>
                    </div>
                </div>
            </section>
        </aside>
    </div>

    <?php include "../footer.php"; ?>
    <script type="text/javascript">
        $(function() {
            $("#table").dataTable({
                "aoColumnDefs": [{
                    "bSortable": false,
                    "aTargets": [0, 3]
                }],
                "aaSorting": []
            });
        });
    </script>
</body>
</html>
