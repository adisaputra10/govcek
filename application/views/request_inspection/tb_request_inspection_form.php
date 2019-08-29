<section class='content-header'>
    <h1>
        REQUEST INSPECTION
        <small>Request Inspection Form Entry</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Inspection</a></li>
        <li class='active'>Form Request Inspection Form</li>
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
                        <form action="<?php echo $action; ?>" method="post">
                            <div class='box-body'>
                                <div class='form-group'><strong>End User / Third Party</strong> <?php echo form_error('end_user_id') ?>
                                    <select name="end_user_id" id="end_user_id" class="form-control" > 
                                        <option value="">- Select End User -</option>
                                        <?php                                        
                                        if (!empty($end_user)) {
                                            foreach ($end_user as $row) {
                                                if($end_user_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . $row->company . "</option>"; 
                                                }else{
                                                    echo "<option value='$row->id'>" . $row->company . "</option>";                                            
                                                }
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>  
                                <!--
                                <div class='form-group'><strong>Equipment</strong> <?php echo form_error('equipment_id') ?>
                                    <select name="equipment_id" id="equipment_id" class="form-control" > 
                                        <option value="">- Select Equipment -</option>
                                        <?php               
                                        //echo '<pre>';print_r($equipment);die();
                                        if (!empty($equipment)) {
                                            foreach ($equipment as $row) {
                                                if($equipment_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>".$row->product_category.' -> '.$row->category.' ['.$row->end_user.'] - Serial: '.$row->serial_number. "</option>"; 
                                                }else{
                                                    echo "<option value='$row->id'>".$row->product_category.'->'.$row->category.' ['.$row->end_user.'] - Serial: '.$row->serial_number."</option>";                                            
                                                }
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                                -->
                                <div class='form-group'><strong>Inspector</strong> <?php echo form_error('inspector') ?>
                                    <select name="inspector_id" id="inspector_id" class="form-control" > 
                                        <option value="">- Select Inspector -</option>
                                        <?php                                        
                                        if (!empty($inspector)) {
                                            foreach ($inspector as $row) {
                                                if($inspector_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . $row->inspector_name . "</option>"; 
                                                }else{
                                                    echo "<option value='$row->id'>" . $row->inspector_name . "</option>";                                            
                                                }
                                            }
                                        }
                                        ?>                                                       
                                    </select>                                    
                                </div>      
                                <div class='form-group'><strong>Product Category</strong> <?php echo form_error('product_category') ?>
                                    <select name="product_category_id" id="product_category_id" class="form-control" > 
                                        <option value="">- Select Product Category -</option>
                                        <?php                                        
                                        if (!empty($product_category)) {
                                            foreach ($product_category as $row) {
                                                if($product_category_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . $row->product_category . "</option>"; 
                                                }else{
                                                    echo "<option value='$row->id'>" . $row->product_category . "</option>";                                            
                                                }
                                            }
                                        }
                                        ?>                                                           
                                    </select>                                    
                                </div>      
                                <div class='form-group'><strong>Schedule Date</strong> <?php echo form_error('service_date') ?>
                                    <input type="date" class="form-control datepicker" name="schedule_date" data-date-format="yyyy-mm-dd" id="schedule_datepicker" placeholder="yyyy-mm-dd" value="<?php echo $schedule_date ?>" />
                                </div>  
                                <div class='form-group'><strong>Inspection Date</strong> <?php echo form_error('inspection_date') ?>
                                    <input type="date" class="form-control datepicker" name="inspection_date" data-date-format="yyyy-mm-dd" id="inspection_datepicker" placeholder="yyyy-mm-dd" value="<?php echo $inspection_date ?>" />
                                </div>  
                                <div class='form-group'><strong>Rep No.</strong> <?php echo form_error('rep_no') ?>
                                    <input type="text" class="form-control" name="rep_no" id="rep_no" placeholder="Please type of Rep No." value="<?php echo $rep_no; ?>" />
                                </div>       
                                <div class='form-group'><strong>Status</strong> <?php echo form_error('status') ?>
                                    <select name="status_id" id="status_id" class="form-control" > 
                                        <option value="">- Select Status -</option>
                                         <?php                                        
                                        if (!empty($status)) {
                                            foreach ($status as $row) {
                                                if($status_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . $row->status_name . "</option>"; 
                                                }else{
                                                    echo "<option value='$row->id'>" . $row->status_name . "</option>";                                            
                                                }
                                            }
                                        }
                                        ?>  
                                    </select>                                    
                                </div>
                                <div class='form-group'><strong>Remark</strong> <?php echo form_error('remark') ?>
                                    <textarea class="form-control" id="remark" name="remark" placeholder="Please type of remark" rows="3"><?php echo $remark; ?></textarea>
                                </div>
                                <div class='form-group'><strong>Invoice No.</strong> <?php echo form_error('invoice_no') ?>
                                    <input type="text" class="form-control" name="invoice_no" id="invoice_no" placeholder="Please type of Invoice No." value="<?php echo $invoice_no; ?>" />
                                </div> 
                            </div>

                            <div class='box-footer'>
                                <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
                                <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
                                <a href="<?php echo site_url('request_inspection') ?>" class="btn btn-default">Cancel</a>
                            </div>
                                                       
                        </form>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>

    



    

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

        $("form").on('submit',function(e){
            var category_value = $('#product_category_id').val();
            var inspector_value = $('#inspector_id').val();
            var schedule_value = $('#schedule_date').val();
            var inspection_value = $('#inspection_date').val();
            var invoice_value = $('#invoice_no').val();

            if(category_value == "" || schedule_value == "" ){
                alert("Product Category, Schedule Date must be fill");
                return false;
            }
            
        });
       

    });
</script>
