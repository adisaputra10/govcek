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
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <h3 class='box-title'><?php echo anchor('inspection_task/request_inspection/', '<i class="glyphicon glyphicon-plus"></i>Add Data', array('class' => 'btn btn-primary btn-sm')); ?>
                        <?php echo anchor(site_url('inspection_task/excel'), ' <i class="fa fa-file-excel-o"></i> Excel', 'class="btn btn-primary btn-sm"'); ?></h3>
                </div><!-- /.box-header -->
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="60px">No</th>
                                <th>Category</th>
                                <th>Product</th>                                                              
                                <th>Serial #</th>                                                              
                                <th>Asset #</th>                                                              
                                <th>Company Name</th>                                                              
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1; //echo '<pre>';print_r($begin_inspection);die();
                            foreach ($header_inspection as $r){                        
                                echo "
                                    <tr>
                                    <td>$no</td>
                                    <td>".$r->category_name."</td>
                                    <td>".$r->product_name."</td>
                                    <td>".$r->serial_number."</td>
                                    <td>".$r->asset_number."</td>
                                    <td>".$r->company."</td>
                                    <td>" . anchor('inspection_task/update/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></i>') . " ".
                                    anchor('inspection_task/add_inspection/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-list-alt" data-toggle="tooltip" title="Add Inspection"></i>') . " ".
                                    anchor('inspection_task/delete/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('This inspection schedule will delete?')")) . "</td>
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
