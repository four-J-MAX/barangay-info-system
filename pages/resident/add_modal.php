<!-- ========================= MODAL ======================= -->
<div id="addCourseModal" class="modal fade">
    <form class="form-horizontal" method="post" enctype="multipart/form-data">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title">RECORD OF BARANGAY INHABITANTS BY HOUSEHOLD</h4>
                </div>
                <div class="modal-body">

                    <div class="row">
                        <div class="container-fluid">
                            <div class="col-md-6 col-sm-12">

                                <div class="form-group">
                                    <!--<label class="control-label" >Name:</label><br>-->
                                    <div class="col-sm-4">
                                        <input name="txt_lname" class="form-control input-sm" type="text"
                                            placeholder="Lastname" required="" />
                                    </div>
                                    <div class="col-sm-4">
                                        <input name="txt_fname" class="form-control input-sm col-sm-4" type="text"
                                            placeholder="Firstname" required="" />
                                    </div>
                                    <div class="col-sm-4">
                                        <input name="txt_mname" class="form-control input-sm col-sm-4" type="text"
                                            placeholder="Middlename" />
                                    </div>
                                </div>

                                <div class="form-group">
                                    <!-- <label class="control-label">Birthdate:</label>-->
                                    <input name="txt_bdate" class="form-control input-sm input-size" type="date"
                                        placeholder="Birthdate" required="" />
                                </div>
                                <!--
                                    <div class="form-group">
                                        <label class="control-label">Age:</label>
                                        <input name="txt_age" class="form-control input-sm input-size" type="number" placeholder="Age"/>
                                    </div> -->

                                <?php
                                if ($isZoneLeader) {
                                    $username = $_SESSION['username']; // Assuming username is stored in session
                                    $query = "SELECT barangay FROM tbluser WHERE username = ? AND type = 'Zone_Leader' AND
                                deleted = 0 LIMIT 1";
                                    $stmt = $conn->prepare($query);
                                    $stmt->bind_param("s", $username);
                                    $stmt->execute();
                                    $stmt->bind_result($barangay);
                                    if ($stmt->fetch()) {
                                        $all_barangay = [$barangay]; // Zone Leader has one barangay
                                        $_SESSION['barangay'] = $barangay; // Store in session for later use
                                    }
                                    $stmt->close();
                                } else {
                                    // Static barangays for other users
                                    $all_barangay = [
                                        "Kangwayan",
                                        "Kodia",
                                        "Pili",
                                        "Bunakan",
                                        "Tabagak",
                                        "Maalat",
                                        "Tarong",
                                        "Malbago",
                                        "Mancilang",
                                        "Kaongkod",
                                        "San Agustin",
                                        "Poblacion",
                                        "Tugas",
                                        "Talangnan"
                                    ];
                                }
                                ?>

                                <div class="form-group">
                                    <select name="txt_brgy" class="form-control input-sm" required="">
                                        <option selected="" disabled="">-Select Barangay-</option>
                                        <?php
                                        if ($isZoneLeader) {
                                            if (!empty($all_barangay)) {
                                                foreach ($all_barangay as $brgy) {
                                                    echo "<option value=\"$brgy\" selected>$brgy</option>";
                                                }
                                            } else {
                                                echo "<option disabled>No barangay available</option>";
                                            }
                                        } else {
                                            foreach ($all_barangay as $brgy) {
                                                $selected = (isset($_SESSION['barangay']) && $_SESSION['barangay'] == $brgy) ? 'selected' : '';
                                                echo "<option value=\"$brgy\" $selected>$brgy</option>";
                                            }
                                        }
                                        ?>
                                    </select>
                                </div>



                                <div class="form-group">
                                    <!--  <label class="control-label">Household #:</label>-->
                                    <input name="txt_householdnum" class="form-control input-sm input-size"
                                        type="number" min="1" placeholder="Household #" required="" />
                                </div>

                                <div class="form-group">
                                    <!--<label class="control-label">Civil Status:</label>-->
                                    <select name="txt_cstatus" class="form-control input-sm" required="">
                                        <option selected="" disabled="">-Select Civil Status-</option>
                                        <option value="Single">Single</option>
                                        <option value="Married">Married</option>
                                        <option value="Widow">Widow</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <!--<label class="control-label">Region:</label>-->
                                    <input name="txt_region" class="form-control input-sm input-size" type="text"
                                        placeholder="Region" required="" />
                                </div>
                                <div class="form-group">
                                    <!--<label class="control-label">Educational Attainment:</label>-->
                                    <select name="ddl_eattain" class="form-control input-sm input-size" required="">
                                        <option selected="" disabled="">-Select Educational Attainment -</option>
                                        <option value="No schooling completed">No schooling completed</option>
                                        <option value="Elementary">Elementary</option>
                                        <option value="High school, undergrad">High school, undergrad</option>
                                        <option value="High school graduate">High school graduate</option>
                                        <option value="College, undergrad">College, undergrad</option>
                                        <option value="Vocational">Vocational</option>
                                        <option value="Bachelor’s degree">Bachelor’s degree</option>
                                        <option value="Master’s degree">Master’s degree</option>
                                        <option value="Doctorate degree">Doctorate degree</option>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <!--<label class="control-label">Municipality:</label>-->
                                    <input value="Madridejos" name="txt_Municipality"
                                        class="form-control input-sm input-size" type="text" placeholder="Municipality"
                                        required="" />
                                </div>

                                <div class="form-group">
                                    <!-- <label class="control-label">Civil Status:</label>-->
                                    <select name="status" class="form-control input-sm input-size" required>
                                        <option value="" selected disabled>-Select Status -</option>
                                        <option value="New Resident">New Resident</option>
                                        <option value="PWD">PWD</option>
                                        <option value="Senior">Senior</option>
                                        <option value="Pregnant">Pregnant</option>
                                        <option value="InActive">InActive</option>
                                        <option value="Active">Active</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Date Moved In:</label>
                                    <input id="txt_date_of_transfer" name="datemove" class="form-control input-sm"
                                        type="date" placeholder="Date Moved In" required="" />
                                    <span id="length_of_stay"></span>
                                    <!-- This span will display the calculated length of stay -->
                                </div>

                                <div class="form-group">
                                    <!-- <label class="control-label">Username:</label>
                                        <input name="txt_uname" id="username" class="form-control input-sm input-size" type="text" placeholder="Username" required="" />
                                        <label id="user_msg" style="color:#CC0000;" ></label>-->
                                </div>

                            </div>

                            <div class="col-md-6 col-sm-12">

                                <div class="form-group">
                                    <!--<label class="control-label">Gender:</label>-->
                                    <select name="ddl_gender" class="form-control input-sm" required="">
                                        <option selected="" disabled="">-Select Gender-</option>
                                        <option value="Male">Male</option>
                                        <option value="Female">Female</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <!--  <label class="control-label">Birthplace:</label>-->
                                    <input name="txt_bplace" class="form-control input-sm" type="text"
                                        placeholder="Birthplace" required="" />
                                </div>

                                <div class="form-group">
                                    <!-- <label class="control-label">Province:</label>-->
                                    <input name="txt_province" class="form-control input-sm" type="text"
                                        placeholder="Province" required="" />
                                </div>

                                <div class="form-group">
                                    <!-- <label class="control-label">Purok/Zone #:</label>-->

                                    <select name="txt_zone" class="form-control input-sm">
                                        <option selected="" disabled="">-- Select Zone/Purok -- </option>
                                        <option value="Rosas"> Rosas</option>
                                        <option value="Bombil"> Bombil</option>
                                        <option value="Santan"> Santan</option>
                                        <option value="Kumintang"> Kumintang</option>
                                    </select>
                                </div>

                                <div class="form-group">
                                    <!-- <label class="control-label">Total Household Member:</label>-->
                                    <input name="txt_householdmem" class="form-control input-sm" type="number" min="1"
                                        placeholder="Total Household Member" required="" />
                                </div>

                                <div class="form-group">
                                    <!-- <label class="control-label">Occupation:</label>-->
                                    <input name="txt_occp" class="form-control input-sm" type="text"
                                        placeholder="Occupation" required="" />
                                </div>
                                <div class="form-group">
                                    <!--<label class="control-label">Citizenship:</label>-->
                                    <input name="txt_Citizenship" class="form-control input-sm" type="text"
                                        placeholder="Citizenship" required="" />
                                </div>
                                <div class="form-group">
                                    <!--<label class="control-label">Former Address:</label>-->
                                    <input name="txt_faddress" class="form-control input-sm" type="text"
                                        placeholder="Former Address" required="" />
                                </div>


                                <div class="form-group">
                                    <!--<label class="control-label">Password:</label>
                                        <input name="txt_upass" class="form-control input-sm" type="password" placeholder="Password" required="" />-->
                                </div>

                                <div class="form-group">
                                    <label class="control-label">Image:</label>
                                    <input name="txt_image" class="form-control input-sm" type="file" required="" />
                                </div>



                            </div>

                        </div>
                    </div>

                </div>
                <div class="modal-footer">
                    <input type="button" class="btn btn-default btn-sm" data-dismiss="modal" value="Cancel" />
                    <input type="submit" class="btn btn-primary btn-sm" name="btn_add" id="btn_add"
                        value="Add Resident" />
                </div>
            </div>
        </div>
    </form>
</div>

<script type="text/javascript">
    $(document).ready(function () {

        var timeOut = null; // this used for hold few seconds to made ajax request

        var loading_html = '<img src="../../img/ajax-loader.gif" style="height: 20px; width: 20px;"/>'; // just an loading image or we can put any texts here

        //when button is clicked
        $('#username').keyup(function (e) {

            // when press the following key we need not to make any ajax request, you can customize it with your own way
            switch (e.keyCode) {
                //case 8:   //backspace
                case 9: //tab
                case 13: //enter
                case 16: //shift
                case 17: //ctrl
                case 18: //alt
                case 19: //pause/break
                case 20: //caps lock
                case 27: //escape
                case 33: //page up
                case 34: //page down
                case 35: //end
                case 36: //home
                case 37: //left arrow
                case 38: //up arrow
                case 39: //right arrow
                case 40: //down arrow
                case 45: //insert
                    //case 46:  //delete
                    return;
            }
            if (timeOut != null)
                clearTimeout(timeOut);
            timeOut = setTimeout(is_available, 500); // delay delay ajax request for 1000 milliseconds
            $('#user_msg').html(loading_html); // adding the loading text or image
        });
    });

    function is_available() {
        //get the username
        var username = $('#username').val();

        //make the ajax request to check is username available or not
        $.post("check_username.php", {
            username: username
        },
            function (result) {
                console.log(result);
                if (result != 0) {
                    $('#user_msg').html('Not Available');
                    document.getElementById("btn_add").disabled = true;
                } else {
                    $('#user_msg').html('<span style="color:#006600;">Available</span>');
                    document.getElementById("btn_add").disabled = false;
                }
            });

    }
</script>