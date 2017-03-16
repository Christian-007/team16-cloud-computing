<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">UPLOAD APPLICATION</h4>
      </div>
      <form action="upload" method="POST" enctype="multipart/form-data"> 
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-6">
              <p>File Upload: </p>
            </div>
            <div class="col-sm-6">
              <div class="form-group">
                <input type="file" name="file" id="upload" size="60">
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" class="btn btn-primary">Upload</button> 
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->