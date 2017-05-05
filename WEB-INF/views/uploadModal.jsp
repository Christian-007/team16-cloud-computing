<div class="modal fade" id="uploadModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">UPLOAD APPLICATION</h4>
      </div>
      <form id="uploadForm" action="upload" method="POST" enctype="multipart/form-data"> 
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-4">
              <b><p>Application Name: </p></b>
            </div>
            <div class="col-sm-8">
              <div class="form-group">
                <input type="text" name="app_name" class="form-control" id="app_name">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <b><p>Jar File Upload: </p></b>
            </div>
            <div class="col-sm-8">
              <div class="form-group">
                <input type="file" name="file" id="upload" size="60">
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <b><p>Description: </p></b>
            </div>
            <div class="col-sm-8">
              <div class="form-group">
                <textarea class="form-control" name="description" id="description" rows="3"></textarea>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <b><p>Upload App Icon: </p></b>
            </div>
            <div class="col-sm-8">
              <div class="form-group">
                <input type="file" name="icon" id="icon" size="60">
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" id="upload_btn" class="btn btn-primary">Upload</button> 
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->