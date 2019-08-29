<section class='content-header'>
    <h1>
        MASTER EQUIPMENT
        <small>List of Master Equipment</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Equipment</a></li>
        <li class='active'>Master Equipment</li>
    </ol>
</section>        
<section class='content'>
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <h3 class='box-title'><?php echo anchor('master_product/create/', '<i class="glyphicon glyphicon-plus"></i>Add Data', array('class' => 'btn btn-primary btn-sm')); ?>
                        <?php echo anchor(site_url('master_product/excel'), ' <i class="fa fa-file-excel-o"></i> Excel', 'class="btn btn-primary btn-sm"'); ?></h3>
                </div><!-- /.box-header -->
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="80px">No</th>
                                <th>Category</th>
                                <th>Product Category</th>
                                <th>End User</th>
                                <th>Manufacture</th>
                                <th>Serial #</th>
                                <th>Asset #</th>
                                <th>Date of Service</th>
                                <th>Unit</th>
                                <th>Schedule</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            foreach ($master_product_data as $r){                        
                                echo "
                                    <tr>
                                    <td>$no</td>
                                    <td>".$r->category."</td>
                                    <td>".$r->product_category."</td>
                                    <td>".$r->end_user."</td>
                                    <td>".$r->manufacture_name."</td>
                                    <td>".$r->serial_number."</td>
                                    <td>".$r->asset_number."</td>
                                    <td>".$r->service_date."</td>
                                    <td>".$r->unit_system."</td>
                                    <td>".$r->schedule."</td>
                                    <td>" . anchor('master_product/update/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></i>') . " ".
                                    anchor('master_product/add_detail/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-list-alt" data-toggle="tooltip" title="Add Detail"></i>') . " ".
                                    anchor('master_product/delete/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Product Category will delete?')")) . "</td>
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
