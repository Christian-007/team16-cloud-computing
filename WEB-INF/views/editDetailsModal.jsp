<div class="modal fade" id="editDetailsModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">EDIT DETAILS</h4>
      </div>
      <form action="editDetails" method="POST" enctype="multipart/form-data"> 
        <div class="modal-body">
          <div class="form-group">
            <label for="email">Email Address</label>
            <input name="email" type="email" class="form-control" id="email" required>
          </div>
          <div class="row">
            <div class="col-xs-6">
              <div class="form-group">
                <label for="fname">First Name</label>
                <input name="fname" type="text" class="form-control" id="fname" required>
              </div>
            </div>
            <div class="col-xs-6">
              <div class="form-group">
                <label for="lname">Last Name</label>
                <input name="lname" type="text" class="form-control" id="lname" required>
              </div>
            </div>
          </div>
          <div class="form-group">
            <label for="phone">Phone Number</label>
            <input name="phone" type="number" class="form-control" id="phone" required>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
          <button type="submit" id="editUser_btn" class="btn btn-primary">Submit</button> 
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->