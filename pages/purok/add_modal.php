<!-- ========================= MODAL ======================= -->
            <div id="addModal" class="modal fade">
            <form method="post">
              <div class="modal-dialog modal-sm" style="width:300px !important;">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        <h4 class="modal-title">Manage Purok</h4>
                    </div>
                    <div class="modal-body">
                        
                        <div class="row">
                            <div class="col-md-12">
                                    <div class="form-group">
                                        <label>Barangay:</label>
                                        <input 
                                            name="txt_barangay" 
                                            class="form-control input-sm" 
                                            type="text" 
                                            placeholder="Barangay" 
                                            required="" 
                                            value="<?php echo htmlspecialchars($zone_barangay, ENT_QUOTES, 'UTF-8'); ?>" 
                                        />
                                    </div>
                                <div class="form-group">
                                    <label>Purok:</label>
                                    <input name="txt_purok" class="form-control input-sm" id="purok"  type="text" placeholder="Purok" required="" />
                                </div>
                            </div>
                        </div>
                        
                    </div>
                    <div class="modal-footer">
                        <input type="button" class="btn btn-default btn-sm" data-dismiss="modal" value="Cancel"/>
                        <input type="submit" class="btn btn-primary btn-sm" name="btn_add" id="btn_add" value="Add Purok"/>
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
<script>
//     $(document).ready(function() {
//     var timeOut = null;
//     var loading_html = '<img src="../../img/ajax-loader.gif" style="height: 20px; width: 20px;"/>';

//     $('#username').on('input', function() { // Change from keyup to input
//         if (timeOut != null)
//             clearTimeout(timeOut);
//         timeOut = setTimeout(is_available, 500);
//         $('#user_msg').html(loading_html);
//     });
// });

// function is_available() {
//     var username = $('#username').val();
//     $.post("check_username.php", { username: username },
//         function(result) {
//             console.log(result);
//             if (result != 0) {
//                 $('#user_msg').html('Not Available');
//                 $('#btn_add').prop('disabled', true); // Updated to jQuery method
//             } else {
//                 $('#user_msg').html('<span style="color:#006600;">Available</span>');
//                 $('#btn_add').prop('disabled', false); // Updated to jQuery method
//             }
//         });
// }

    </script>
