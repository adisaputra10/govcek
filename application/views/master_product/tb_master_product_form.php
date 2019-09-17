<section class='content-header'>
    <h1>
        MASTER EQUIPMENT
        <small>Master Equipment Form Entry</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Equipment</a></li>
        <li class='active'>Master Equipment Form</li>
    </ol>
</section>        
<section class='content'>    
    <div class='row'>
        <!-- left column -->
        <div class='col-md-12'>
            <?php echo $this->session->flashdata('message');?>
            <!-- general form elements -->
            <div class='box box-primary'>
                <div class='box-header'>
                    <div class='col-md-5'>
                        <?php echo $message;?>  
                        <form action="<?php echo $action; ?>" method="post">    
                            <div class='box-body'>      
                                <div class='form-group'>Category <?php echo form_error('category_id') ?>
                                    <select name="category_id" id="category_id" class="form-control" > 
                                        <option value="">- Select Category -</option>                               
                                        <?php                                        
                                        if (!empty($category)) {
                                            foreach ($category as $row) {
                                                if($category_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . $row->category . "</option>"; 
                                                }else{
                                                    echo "<option value='$row->id'>" . $row->category . "</option>";                                            
                                                }
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>    
                            </div>
                            <div class='box-body'>  
                                <div class='form-group'>Product Category <?php echo form_error('product_category_id') ?>
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
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>End User <?php echo form_error('end_user_id') ?>
                                    <select name="end_user_id" id="end_user_id" class="form-control" > 
                                        <option value="">- Select Category -</option>                               
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
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Manufacture <?php echo form_error('manufacture_id') ?>
                                    <select name="manufacture_id" id="manufacture_id" class="form-control" > 
                                        <option value="">- Select Manufacture -</option>                               
                                        <?php                                        
                                        if (!empty($manufacture)) {
                                            foreach ($manufacture as $row) {
                                                if($manufacture_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . $row->manufacture_name . "</option>";  
                                                }else{                                         
                                                    echo "<option value='$row->id'>" . $row->manufacture_name . "</option>";     
                                                }                                       
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Serial # <?php echo form_error('serial_number') ?>
                                    <input type="text" class="form-control" name="serial_number" id="serial_number" placeholder="Please type of serial number" value="<?php echo $serial_number; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Asset # <?php echo form_error('asset_number') ?>
                                    <input type="text" class="form-control" name="asset_number" id="asset_number" placeholder="Please type of asset number" value="<?php echo $asset_number; ?>" />
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Service Date <?php echo form_error('service_date') ?>
                                    <input type="date" class="form-control datepicker" name="service_date" data-date-format="yyyy-mm-dd" id="datepicker" placeholder="yyyy-mm-dd" value="<?php echo $service_date ?>" />
                                </div>  
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>Expire Date <?php echo form_error('expire_date') ?>
                                    <input type="date" class="form-control datepicker" name="expire_date" data-date-format="yyyy-mm-dd" id="datepicker" placeholder="yyyy-mm-dd" value="<?php echo $expire_date ?>" />
                                </div>  
                            </div>      
                            <div class='box-body'>
                                <div class='form-group'>Unit System <?php echo form_error('unit_system_id') ?>
                                    <select name="unit_system_id" id="unit_system_id" class="form-control" > 
                                        <option value="">- Select Category -</option>                               
                                        <?php                                        
                                        if (!empty($unit_system)) {
                                            foreach ($unit_system as $row) {
                                                if($unit_system_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . $row->description . "</option>";    
                                                }else{                                        
                                                    echo "<option value='$row->id'>" . $row->description . "</option>";   
                                                }                                         
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                            </div>                            
                            <div class='box-body'>
                                <div class='form-group'>Inspection Schedule <?php echo form_error('inspection_schedule_id') ?>
                                    <select name="inspection_schedule_id" id="inspection_schedule_id" class="form-control" > 
                                        <option value="">- Select Schedule -</option>                               
                                        <?php                                        
                                        if (!empty($inspection_schedule)) {
                                            foreach ($inspection_schedule as $row) {
                                                if($inspection_schedule_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . $row->schedule . "</option>";                                            
                                                }else{
                                                    echo "<option value='$row->id'>" . $row->schedule . "</option>"; 
                                                }                                           
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                            </div>             
                            <div class='box-body'>
                                <div class='form-group'>Capacity # <?php echo form_error('capacity') ?>
                                    <input type="text" class="form-control" name="capacity" id="capacity" placeholder="Please type capacity" value="<?php echo $capacity; ?>" />
                                </div>
                            </div>      
                            <div class='box-body'>
                                <div class='form-group'>Quick Check # <?php echo form_error('quick_check_no') ?>
                                    <input type="text" class="form-control" name="quick_check_no" id="quick_check_no" placeholder="Please type quick check #" value="<?php echo $quick_check_no; ?>" />
                                </div>
                            </div> 


                            <div class='box-body'>
                                <div class='form-group'>Description  #   
                                    <input type="text" class="form-control" name="description" id="descriptions" placeholder=" " />
                                </div>
                            </div>   


                            <div class='form-group'>Status<?php echo form_error('status') ?>
                                <select name="status_id" id="status_id" class="form-control" > 
                                    <option value="">- Select Status -</option>
                                     <?php 
                                     //print_r($status_product);                      
                                    if (!empty($status_product)) {
                                        foreach ($status_product as $row) {
                                            if($status == $row->id){
                                                echo "<option selected='selected' value='$row->id'>" . $row->status_name . "</option>"; 
                                            }else{
                                                echo "<option value='$row->id'>" . $row->status_name . "</option>";                                            
                                            }
                                        }
                                    }
                                    ?>  
                                </select>                                    
                            </div>
                            <div class='box-footer'>
                                <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
                                <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
                                <a href="<?php echo site_url('master_product') ?>" class="btn btn-default">Cancel</a>
                            </div>                            
                        </form>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</section><!-- /.content -->