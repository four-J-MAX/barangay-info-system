<!-- ========================= MODAL ======================= -->
            <div id="addCourseModal" class="modal fade">
            <form class="form-horizontal" method="post" enctype="multipart/form-data">
              <div class="modal-dialog modal-lg" >
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
                                            <input name="txt_lname" class="form-control input-sm" type="text" placeholder="Lastname" required="" />
                                        </div>
                                        <div class="col-sm-4">
                                            <input name="txt_fname" class="form-control input-sm col-sm-4" type="text" placeholder="Firstname" required="" />
                                        </div>
                                        <div class="col-sm-4">
                                            <input name="txt_mname" class="form-control input-sm col-sm-4" type="text" placeholder="Middlename" required="" />
                                        </div>
                                    </div>

                                    <div class="form-group">
                                        <!-- <label class="control-label">Birthdate:</label>-->
                                        <input name="txt_bdate" class="form-control input-sm input-size" type="date" placeholder="Birthdate" required="" />
                                    </div>
                                    <!--
                                    <div class="form-group">
                                        <label class="control-label">Age:</label>
                                        <input name="txt_age" class="form-control input-sm input-size" type="number" placeholder="Age"/>
                                    </div> -->


                                    <div class="form-group">
                                        <!-- <label class="control-label">Barangay:</label>-->
                                        <input name="txt_brgy" class="form-control input-sm input-size" type="text" placeholder="Barangay" required="" />
                                    </div>

                                    <div class="form-group">
                                       <!--  <label class="control-label">Household #:</label>-->
                                        <input name="txt_householdnum" class="form-control input-sm input-size" type="number" min="1" placeholder="Household #" required="" />
                                    </div>

                                    <div class="form-group">     
                                         <!--<label class="control-label">Civil Status:</label>-->
                                        <select name="ddl_gender" class="form-control input-sm" required=""/>
                                            <option selected="" disabled="">-Select Civil Status-</option>
                                            <option value="sigle">single</option>
                                            <option value="married">married</option>
                                            <option value="widow">widow</option>   
                                        </select>
                                    </div>
                                
                                    <div class="form-group">
                                         <!--<label class="control-label">Region:</label>-->
                                        <input name="txt_region" class="form-control input-sm input-size" type="text" placeholder="Region" required="" />
                                    </div>
                                    <div class="form-group">
                                         <!--<label class="control-label">Educational Attainment:</label>-->
                                        <select name="ddl_eattain" class="form-control input-sm input-size">
                                            <option>No schooling completed</option>
                                            <option>Elementary</option>
                                            <option>High school, undergrad</option>
                                            <option>High school graduate</option>
                                            <option>College, undergrad</option>
                                            <option>Vocational</option>
                                            <option>Bachelor’s degree</option>
                                            <option>Master’s degree</option>
                                            <option>Doctorate degree</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                         <!--<label class="control-label">Municipality:</label>-->
                                        <input name="txt_Municipality" class="form-control input-sm input-size" type="text" placeholder="Municipality" required="" />
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
                                        <select name="ddl_gender" class="form-control input-sm" required=""/>
                                            <option selected="" disabled="">-Select Gender-</option>
                                            <option value="Male">Male</option>
                                            <option value="Female">Female</option>
                                        </select>
                                    </div>

                                    <div class="form-group">
                                       <!--  <label class="control-label">Birthplace:</label>-->
                                        <input name="txt_bplace" class="form-control input-sm" type="text" placeholder="Birthplace" required="" />
                                    </div> 

                                    <div class="form-group">
                                        <!-- <label class="control-label">Province:</label>-->
                                        <input name="txt_province" class="form-control input-sm" type="text" placeholder="Province" required="" />
                                    </div> 

                                    <div class="form-group">
                                        <!-- <label class="control-label">Purok/Zone #:</label>-->
        
                                        <select name="txt_zone" class="form-control input-sm"  />
                                    <option selected="" disabled="">-- Select Zone/Purok -- </option>
                                    <option value="Rosas"> Rosas</option>
                                    <option value="Bombil"> Bombil</option>
                                    <option value="Santan"> Santan</option>
                                     <option value="Kumintang"> Kumintang</option>
                                    </select>
                                    </div>

                                    <div class="form-group">
                                        <!-- <label class="control-label">Total Household Member:</label>-->
                                        <input name="txt_householdmem" class="form-control input-sm" type="number" min="1" placeholder="Total Household Member" required="" />
                                    </div>

                                    <div class="form-group">
                                        <!-- <label class="control-label">Occupation:</label>-->
                                        <input name="txt_occp" class="form-control input-sm" type="text" placeholder="Occupation" required="" />
                                    </div>
                                    <div class="form-group">
                                         <!--<label class="control-label">Citizenship:</label>-->
                                        <input name="txt_Citizenship" class="form-control input-sm" type="text" placeholder="Citizenship" required="" />
                                    </div>
                                    <div class="form-group">
                                         <!--<label class="control-label">Former Address:</label>-->
                                        <input name="txt_faddress" class="form-control input-sm" type="text" placeholder="Former Address" required="" />
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
                        <input type="button" class="btn btn-default btn-sm" data-dismiss="modal" value="Cancel"/>
                        <input type="submit" class="btn btn-primary btn-sm" name="btn_add" id="btn_add" value="Add Resident"/>
                    </div>
                </div>
              </div>
              </form>
            </div>

<script type="text/javascript">
    $(document).ready(function() {
 
        var timeOut = null; // this used for hold few seconds to made ajax request
 
        var loading_html = '<img src="../../img/ajax-loader.gif" style="height: 20px; width: 20px;"/>'; // just an loading image or we can put any texts here
 
        //when button is clicked
        $('#username').keyup(function(e){
 
            // when press the following key we need not to make any ajax request, you can customize it with your own way
            switch(e.keyCode)
            {
                //case 8:   //backspace
                case 9:     //tab
                case 13:    //enter
                case 16:    //shift
                case 17:    //ctrl
                case 18:    //alt
                case 19:    //pause/break
                case 20:    //caps lock
                case 27:    //escape
                case 33:    //page up
                case 34:    //page down
                case 35:    //end
                case 36:    //home
                case 37:    //left arrow
                case 38:    //up arrow
                case 39:    //right arrow
                case 40:    //down arrow
                case 45:    //insert
                //case 46:  //delete
                    return;
            }
            if (timeOut != null)
                clearTimeout(timeOut);
            timeOut = setTimeout(is_available, 500);  // delay delay ajax request for 1000 milliseconds
            $('#user_msg').html(loading_html); // adding the loading text or image
        });
  });
function is_available(){
    //get the username
    var username = $('#username').val();
 
    //make the ajax request to check is username available or not
    $.post("check_username.php", { username: username },
    function(result)
    {
        console.log(result);
        if(result != 0)
        {
            $('#user_msg').html('Not Available');
            document.getElementById("btn_add").disabled = true;
        }
        else
        {
            $('#user_msg').html('<span style="color:#006600;">Available</span>');
            document.getElementById("btn_add").disabled = false;
        }
    });
 
}
</script>