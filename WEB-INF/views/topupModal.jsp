<div class="modal fade" id="topupModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">TOPUP PEANUT</h4>
      </div>
      <form action="topup" method="POST" enctype="multipart/form-data"> 
        <div class="modal-body">
          <div class="row">
            <div class="col-sm-4">
              <b><p>Current Peanut: </p></b>
            </div>
            <div class="col-sm-8">
              <div class="form-group">
                <p class="currentCredit"></p>
              </div>
            </div>
          </div>
          <div class="row">
            <div class="col-sm-4">
              <b><p>Topup Amount: </p></b>
            </div>
            <div class="col-sm-8">
              <div class="form-group">
                <input type="number" name="topupAmount" min="0" class="form-control" id="topupAmount">
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" id="topup_btn" class="btn btn-primary">Submit</button> 
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->