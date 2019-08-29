<section class='content-header'>
    <h1>
        PRODUCT CATEGORY
        <small>List of Product Category</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Product</a></li>
        <li class='active'>Product Category</li>
    </ol>
</section>        
<section class='content'>
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <h3 class='box-title'><?php echo anchor('product_category/create/', '<i class="glyphicon glyphicon-plus"></i>Add Data', array('class' => 'btn btn-primary btn-sm')); ?>
                        <?php echo anchor(site_url('product_category/excel'), ' <i class="fa fa-file-excel-o"></i> Excel', 'class="btn btn-primary btn-sm"'); ?></h3>
                </div><!-- /.box-header -->
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="80px">No</th>
                                <th>Product Category</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            foreach ($product_category_data as $r){                        
                                echo "
                                    <tr>
                                    <td>$no</td>
                                    <td>".$r->product_category."</td>
                                    <td>" . anchor('product_category/update/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></i>') . " ".
                                    anchor('product_category/add_detail/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-list-alt" data-toggle="tooltip" title="Add Checklist"></i>') . " ".
                                    anchor('product_category/delete/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Product Category will delete?')")) . "</td>
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
