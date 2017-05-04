<div class="modal fade" id="passwordModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">CHANGE PASSWORD</h4>
      </div>
      <form action="changePassword" method="POST" enctype="multipart/form-data"> 
        <div class="modal-body">
          <div class="form-group">
            <label for="oldPassword">Old Password</label>
            <input name="oldPassword" type="password" class="form-control" id="oldPassword" required>
          </div>
          <div class="form-group">
            <label for="newPassword">New Password</label>
            <input name="newPassword" type="password" class="form-control" id="newPassword" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
          <button type="submit" id="password_btn" class="btn btn-primary">Submit</button> 
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->