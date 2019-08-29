<section class="content-header">
<h1>
    L A B E L
    <small>List of Label</small>
</h1>
<ol class="breadcrumb">
    <li><a href="#"><i class="fa fa-suitcase"></i>Master</a></li>
    <li class="active">Lable</li>
</ol>
</section>

<section class="content">   
    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary">
                <div class='box-header with-border'>
                    <h3 class='box-title'><a href="<?php echo base_url('index.php/label/create'); ?>" class="btn btn-primary btn-small">
                            <i class="glyphicon glyphicon-plus"></i> Add Data</a></h3>
                            <label calss='control-label' ></label>
                </div><!-- /.box-header -->
                <div class="box-body table-responsive">
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th>No.</th>
                                <th>Label Name</th>
                                <th>Product Category</th>
                                <th>Actions</th>                                                         
                            </tr>
                        </thead>
                        <?php
                        $no=1;
                        foreach ($label_data as $r){                        
                           echo "
                               <tr>
                                 <td>$no</td>
                                 <td>".$r->label_name."</td>
                                 <td>".$r->product_category."</td>
                                 <td>" . anchor('label/update/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></i>') . " ".
                                 anchor('label/delete/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Data days will delete?')")) . "</td>
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
<script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js') ?>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#mytable").dataTable();
    });
</script>




