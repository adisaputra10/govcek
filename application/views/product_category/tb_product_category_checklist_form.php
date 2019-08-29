<section class='content-header'>
    <h1>
        PRODUCT CATEGORY
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Product</a></li>
        <li class='active'>Product with checklist</li>
    </ol>
</section>        
<section class='content'>
    <div class='row'>
        <!-- left column -->
        <div class='col-md-12'>
            <!-- general form elements -->
            <div class='box box-primary'>
                <div class='box-header'>
                    <div class='col-md-5'>                                         
                        <div class='box-body'>
                            <div class='form-group'>Product Category <?php echo form_error('category') ?>
                                <input type="hidden" name="id" id="id" value="<?php echo $id ?>" />
                                <input type="text" class="form-control" name="product_category" id="product_category" value="<?php echo $product_category; ?>" disabled/>
                            </div>                            
                        </div>                           
                    </div><!-- /.box-body -->                    
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <h3 class='box-title'>
                        <div class="form-group text-right">
                            <a data-toggle="modal" data-target="#tambah-data" class="btn btn-primary">Add Checklist</a>
                            <a class="btn btn-warning" href="<?php echo base_url('product_category'); ?>">Back</a>
                        </div>                
                    </h3>
                </div><!-- /.box-header -->
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="80px">No</th>
                                <th>Checklist Name</th>
                                <th>Active</th>                      
                                <th>Action</th>                      
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            //echo '<pre>';print_r($checklist_data);die();
                            $no = 1; $segment= $this->uri->segment(3);
                            foreach ($checklist_data as $r){                        
                                echo "
                                    <tr>
                                    <td>$no</td>
                                    <td>".$r->checklist_name."</td>
                                    <td>".$r->active."</td>
                                    <td><i class='btn-sm btn-info glyphicon glyphicon-edit' 
                                        data-segment=\"$segment\" 
                                        data-checklist_name=\"$r->checklist_name\" 
                                        data-checklist=\"$r->checklist_id\" 
                                        data-id=\"$r->id\" 
                                        data-detail_id=\"$r->detail_id\" 
                                        data-toggle='modal' 
                                        data-target='#edit-data' 
                                        title='Edit Checklist'></i>".
                                    anchor('product_category/delete_checklist/'.$this->uri->segment(3).'/'. $r->detail_id, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Checklist for category will delete?')")) . "</td>
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
    
    <!-- Modal Tambah -->
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="tambah-data" class="modal fade">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
	                <h4 class="modal-title">Add Checklist for category</h4>
	            </div>
	            <!--<form class="form-horizontal" action="<?php //echo base_url('master_product_detail/save_add')?>" method="post" enctype="multipart/form-data" role="form">-->
	            <form class="form-horizontal" action="<?php echo $action ?>" method="post" enctype="multipart/form-data" role="form">
		            <div class="modal-body">
		                    <div class='form-group'>
                                <label class="col-lg-2 col-sm-2 control-label">Checklist <?php echo form_error('master_checklist') ?></label>
                                <div class="col-lg-10">
                                    <input type="hidden" name="id" id="id" value="<?php echo $id ?>" />
                                    <select name="checklist_id" id="checklist_id" class="form-control" > 
                                        <option value="">- Select Checklist Name -</option>                               
                                        <?php                                        
                                        if (!empty($master_checklist)) {
                                            foreach ($master_checklist as $row) {
                                                echo "<option value='$row->id'>" . $row->checklist_name  . "</option>";                                                
                                            }
                                        }
                                        ?>
                                    </select>  
                                </div>                                  
                            </div>
                            
		                <div class="modal-footer">
		                    <button class="btn btn-info" type="submit"> Save Checklist&nbsp;</button>
		                    <button type="button" class="btn btn-warning" data-dismiss="modal"> Cancel</button>
		                </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>


    <!-- Modal EditTambah -->
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="edit-data" class="modal fade">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
	                <h4 class="modal-title">Edit Checklist for category</h4>
	            </div>	            
	            <form class="form-horizontal" action="<?php echo base_url('index.php/product_category/update_checklist_action') ?>" method="post" enctype="multipart/form-data" role="form">
		            <div class="modal-body">
		                    <div class='form-group'>
                                <label class="col-lg-2 col-sm-2 control-label">Checklist <?php echo form_error('master_checklist') ?></label>
                                <div class="col-lg-10">
                                    <input type="hidden" id="edit_id" name="edit_id">
                                    <input type="hidden" id="segment_id" name="segment_id">
                                    <select name="checklist_id" id="checklist_id" class="form-control" > 
                                        <option value="">- Select Checklist Name -</option>                               
                                        <?php                                        
                                        if (!empty($master_checklist)) {
                                            foreach ($master_checklist as $row) {                                      
                                                echo "<option value='$row->id'>" . $row->checklist_name  . "</option>";                                                
                                            }
                                        }
                                        ?>
                                    </select>  
                                </div>                                  
                            </div>
                            
		                <div class="modal-footer">
		                    <button class="btn btn-info" type="submit"> Save Checklist&nbsp;</button>
		                    <button type="button" class="btn btn-warning" data-dismiss="modal"> Cancel</button>
		                </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
</section><!-- /.content -->


<script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js') ?>"></script>
<script type="text/javascript">
$(document).ready(function () {
    $("#mytable").dataTable();
});
</script>

<script type="text/javascript">
    $(document).ready(function(){
        $('#mytable').on('show.bs.modal', function (e) {
            var row_id = $(e.relatedTarget).data('id');
            var row_category = $(e.relatedTarget).data('category');
            //menggunakan fungsi ajax untuk pengambilan data
            $.ajax({
                type : 'post',
                url : 'product_category/update_detail_checklist.php',
                data :  'rowid='+ row_id,
                success : function(data){
                    $('.fetched-data').html(data);//menampilkan data ke dalam modal
                }
            });
         });

         // Untuk sunting
         $('#edit-data').on('show.bs.modal', function (event) {
            var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
            var modal = $(this)

            // Isi nilai pada field
            modal.find('#edit_id').attr("value",div.data('detail_id'));
            modal.find('#segment_id').attr("value",div.data('segment'));
            $('select[name=checklist_id] > option:first-child').text(div.data('checklist_name'));            
        });
    });
  </script>
