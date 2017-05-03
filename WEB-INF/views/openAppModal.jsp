<div class="modal fade" id="openAppModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">OPEN APPLICATION</h4>
      </div>
      <form action="pay" method="POST"> 
        <div class="modal-body">
          <p>This service will cost <strong>100 Peanuts</strong>. Are you sure you want to open this application?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
          <button type="submit" id="openapp_btn" class="btn btn-primary">Continue</button> 
        </div>
      </form>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->