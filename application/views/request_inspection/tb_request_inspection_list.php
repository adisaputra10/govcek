<section class='content-header'>
    <h1>
        REQUEST INSPECTION
        <small>List of Request Inspection</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Inspection</a></li>
        <li class='active'>Request</li>
    </ol>
</section>        
<section class='content'>
    <?php if ($this->session->flashdata('success')) { ?>
        <div class="alert alert-success"> <?= $this->session->flashdata('success') ?> </div>
    <?php } ?>
    <?php if ($this->session->flashdata('message')) { ?>
        <div class="alert alert-warning"> <?= $this->session->flashdata('message') ?> </div>
    <?php } ?>
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <h3 class='box-title'><?php echo anchor('request_inspection/add_request/', '<i class="glyphicon glyphicon-plus"></i>Add Data', array('class' => 'btn btn-primary btn-sm')); ?>
                        <?php echo anchor(site_url('request_inspection/excel'), ' <i class="fa fa-file-excel-o"></i> Excel', 'class="btn btn-primary btn-sm"'); ?></h3>
                </div><!-- /.box-header -->
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="60px">No</th>
                                <th>End User</th>
                                <th>Inspector Name</th> 
                                <th>Category</th>
                                <th>Equipment</th>
                                <th>Schedule</th>
                                <th>Inspection</th>
                                <th>Rep. No.</th>
                                <th>Status</th>
                                <th>Remark</th>
                                <th>Invoice No.</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1; //echo '<pre>';print_r($begin_inspection);die();
                            foreach ($request_inspection as $r){                        
                                echo "
                                    <tr>
                                    <td>$no</td>
                                    <td>".$r->company."</td>
                                    <td>".$r->inspector_name."</td>
                                    <td>".$r->product_category."</td>
                                    <td>".$r->category_name."</td>
                                    <td>".$r->schedule_date."</td>
                                    <td>".$r->inspection_date."</td>
                                    <td>".$r->rep_no."</td>
                                    <td>".$r->status_name."</td>
                                    <td>".$r->remark."</td>
                                    <td>".$r->invoice_no."</td>
                                    <td>" . anchor('request_inspection/update/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></i>') . " ".
                                    anchor('request_inspection/detail_request_inspection/'. $r->id.'/'.$r->product_category_id, '<i class="btn-sm btn-info glyphicon glyphicon-list-alt" data-toggle="tooltip" title="Add Request Inspection"></i>') . " ".
                                    anchor('request_inspection/delete/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('This request schedule will delete?')")) . "</td>
                                    </tr>";
                                $no++;
                            }
                            ?>
                        </tbody>
                    </table>					
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->
<script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js') ?>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#mytable").dataTable();
    });
</script>
