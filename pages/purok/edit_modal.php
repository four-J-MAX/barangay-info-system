<?php echo '<div id="editModal'.$row['id'].'" class="modal fade">
<form method="post">
  <div class="modal-dialog modal-sm" style="width:300px !important;">
    <div class="modal-content">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            <h4 class="modal-title">Edit Staff Info</h4>
        </div>
        <div class="modal-body">
        <div class="row">
            <div class="col-md-12">
                <input type="hidden" value="'.$row['id'].'" name="hidden_id" id="hidden_id"/>
                <div class="form-group">
                    <label>Barangay:</label>
                    <input name="txt_edit_barangay" class="form-control input-sm" type="text" value="'.$row['barangay'].'"/>
                </div>
                <div class="form-group">
                    <label>Purok: </label>
                    <input name="txt_edit_purok" class="form-control input-sm" type="text" value="'.$row['purok'].'" />
                </div>
            </div>
        </div>
        </div>
        <div class="modal-footer">
            <input type="button" class="btn btn-default btn-sm" data-dismiss="modal" value="Cancel"/>
            <input type="submit" class="btn btn-primary btn-sm" name="btn_save" value="Update"/>
        </div>
    </div>
  </div>
</form>
</div>';?>
