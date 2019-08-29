<section class="content-header">
<h1>
    D A Y S
    <small>List of Days</small>
</h1>
<ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-suitcase"></i>Master</a></li>
    <li class="active">Days</li>
</ol>
</section>
<section class="content">   

<div class="row">
    <div class="col-md-12">
        <div class="box box-primary">
            <div class='box-header with-border'>
                <h3 class='box-title'><a href="<?php echo base_url('days/create'); ?>" class="btn btn-primary btn-small">
                        <i class="glyphicon glyphicon-plus"></i> Add Data</a></h3>
                        <label calss='control-label' ></label>
            </div>
            <div class="box-body table-responsive">
                <table id="mytable" class="table table-bordered table-striped" cellspacing="0" width="100%">
                    <thead>
                        <tr>
                            <th>No.</th>
                            <th>Description</th>
                            <th>Actions</th>                                                         
                        </tr>
                    </thead>
                   <?php
                   $no=1;
                   foreach ($days_data as $r){                        
                       echo "
                           <tr>
                           <td>$no</td>
                           <td>".$r->days_desc."</td>
                           <td>" . anchor('days/update/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></i>') . " ".
                           anchor('days/delete/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Data days will delete?')")) . "</td>
                           </tr>";
                       $no++;
                   }
                   ?>
                </Table> 
            </div><!-- /.box-body -->
        </div><!-- /.box -->
    </div>
</div>
</section><!-- /.content -->
<script src="<?php echo base_url('assets/js/jquery-1.12.0.min.js') ?>"></script>
<script src="<?php echo base_url('assets/js/plugins/datatables/jquery.dataTables.min.js'); ?>"></script>
<script type="text/javascript">
$(document).ready(function () {
    $("#mytable").dataTable();
});
</script>