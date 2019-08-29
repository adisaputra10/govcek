<section class='content-header'>
    <h1>
        INSPECTION TASK
        <small>Inspection Form Entry</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Inspection</a></li>
        <li class='active'>Inspection Scheduleq Form</li>
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
                        <!--<form action="<?php //echo $action; ?>" method="post">-->
                            <div class='box-body'>
                                <div class='form-group'>Category <?php echo form_error('product_category') ?>
                                    <select name="product_category_id" id="product_category_id" class="form-control" > 
                                        <option value="">- Select Category -</option>                               
                                        <?php                                        
                                        if (!empty($product_category)) {
                                            foreach ($product_category as $row) {
                                                echo "<option value='$row->id'>" . $row->product_category . "</option>";
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>                            
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Product <?php //echo form_error('mst_product') ?>
                                    <select name="mst_product_id" id="mst_product_id" class="form-control" > 
                                        <option value="">- Select Product -</option>                                                                   
                                    </select>                                    
                                </div>                            
                            </div>

                            
                            <div class='box-footer'>
                                <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
                                <!--<button type="submit" class="btn btn-primary"><?php //echo $button ?></button>   -->
                                <a id="info-product" data-toggle="modal" data-target="#info-product" class="btn btn-info">View</a>
                                <!--<a href="<?php echo site_url('inspection_task') ?>" class="btn btn-default">Cancel</a>-->
                            </div>
                        <!--</form>-->
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>

    <!-- bawah -->
    <h4>Details Inspection</h4>       
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <h3 class='box-title'>
                        <div class="form-group text-right">
                            <a  id="add_inspection" data-toggle="modal" data-target="#tambah-inspection" class="btn btn-primary">Add Inspection Schedule</a>
                            <a class="btn btn-warning" href="<?php echo base_url('inspection_task'); ?>">Back</a>
                        </div>                
                    </h3>
                </div><!-- /.box-header -->
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="80px">No</th>
                                <th>Inspection Date</th>
                                <th>Location</th>
                                <th>Inspector</th>
                                <th>Checklist</th>
                                <th>Comment</th>
                                <th>Status</th>                  
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                          
                            ?>
                        </tbody>
                    </table>					
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->

    <!-- info product -->
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="tambah-inspection" class="modal fade">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
	                <h4 class="modal-title">Inspection Schedule</h4>
	            </div>
	            <form class="form-horizontal" action="<?php echo $action_inspection ?>" method="post" role="form">
                    <input type="hidden" id="cat_id" name="cat_id" value=0 />
                    <input type="hidden" id="prod_id" name="prod_id" value=0 />
		            <div class="modal-body" id="view-info">
                            <div class='box-body'>                           
                                <div class='form-group'>Inspection Date                                     
                                    <input type="date" class="form-control datepicker" name="service_date" data-date-format="yyyy-mm-dd" id="datepicker" placeholder="yyyy-mm-dd" value="<?php echo date('Y-m-d') ?>" />
                                </div>
                            </div>       
                            <div class='box-body'>                             
                                <div class='form-group'>Location <?php //echo form_error('location_name') ?>
                                    <select name="location_id" id="location_id" class="form-control" > 
                                        <option value="">- Select Location -</option>                               
                                        <?php                                        
                                        if (!empty($location)) {
                                            foreach ($location as $row) {
                                                if($location_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . strtoupper($row->location_name) . "</option>";
                                                }else{
                                                    echo "<option value='$row->id'>" . strtoupper($row->location_name) . "</option>";
                                                }
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                            </div>                       
                            <div class='box-body'>
                                <div class='form-group'>Inspector <?php //echo form_error('inspector_name') ?>
                                    <select name="inspector_id" id="inspector_id" class="form-control" > 
                                        <option value="">- Select Inspector -</option>                               
                                        <?php                                        
                                        if (!empty($inspector)) {
                                            foreach ($inspector as $row) {
                                                if($inspector_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . strtoupper($row->inspector_name) . "</option>";
                                                }else{
                                                    echo "<option value='$row->id'>" . strtoupper($row->inspector_name) . "</option>";
                                                }
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                            </div>

                            <div id='checklist'></div>

                            <div class='box-body'>
                                <div class='form-group'>Comment <?php echo form_error('comment') ?>
                                    <textarea class="form-control" id="comment" name="comment" placeholder="Please type of comment" rows="3"><?php echo $comment; ?></textarea>
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Status Inspection                                    
                                    <div class=\"col-lg-10\">
                                        <fieldset class=\"form-group\">
                                            <div class=\"form-check\">
                                            <label class=\"form-check-label\">
                                                <input type="radio" class="form-check-input" name='status_inspection' id='status_y' value='Y'> Yes&nbsp;&nbsp;
                                                <input type="radio" class="form-check-input" name='status_inspection' id='status_n' value='N'> No                                    
                                            </label>
                                            </div>    
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
		                </div>
		                <div class="modal-footer">		                  
                            <button class="btn btn-info" type="submit"> Save&nbsp;</button>
		                    <button type="button" class="btn btn-warning" data-dismiss="modal"> Cancel</button>
		                </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- End info product -->



    

</section><!-- /.content -->


<script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js') ?>"></script>
<script type="text/javascript">
    $(document).ready(function () {   
        $('#info-product').hide();                
        $('#add_inspection').hide();
        

        $("#product_category_id").change(function(){ 
            var value = $(this).val();   
            $('#cat_id').val(value);

            $.ajaxSetup({
                type:"POST",
                url: "<?php echo base_url('inspection_task/ambil_data') ?>",
                cache: false,
            });
                  
            if(value > 0){
                $.ajax({
                data:{modul:'inspection_task/ambil_data',id:value},
                success: function(respond){                                               
                        $("#mst_product_id").html(respond);
                    }
                })
            }
        });

        $('select[name="mst_product_id"]').change(function(){
            var product_value = $('#mst_product_id').val(); 
            //alert(product_value);
            $('#prod_id').val(product_value);

            $.ajaxSetup({
                type:"POST",
                url: "<?php echo base_url('inspection_task/get_detail') ?>",
                cache: false,
            });

            var value = $(this).val();            
            if(value > 0){
                //$('#info-product').show(); 
                $('#add_inspection').show();

                $.ajax({
                data:{modul:'inspection_task/get_detail',id:value},
                    success: function(respond){
                        //alert('ok mst_produk nih');                      
                        //$("#view-info").html(respond);
                    }
                })
            }
        });

        $("#add_inspection").click(function() {
            var category_value = $('#product_category_id').val();
            var product_value = $('#mst_product_id').val();            

            $.ajaxSetup({
                type:"POST",
                url: "<?php echo base_url('inspection_task/get_checklist_per_product') ?>",
                cache: false,
            });

            if(category_value){
                //alert('masuk');
                $.ajax({
                    data:{
                        modul:'inspection_task/get_checklist_per_product',cat_id:category_value,prod_id:product_value
                    },
                    success: function(respond){
                        $("#checklist").html(respond);                                              
                    }
                })
            }
            
        });
       

    });
</script>
