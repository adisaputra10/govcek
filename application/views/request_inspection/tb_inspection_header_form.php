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
                        <form class="form-horizontal" action="<?php echo $action ?>" method="post" role="form">
                            <input type="hidden" name="id" id="id" value="<?php echo $id ?>"></input>
                            <div class='box-body'>
                                <div class='form-group'>Category <?php echo form_error('product_category') ?>
                                    <select name="product_category_id" id="product_category_id" class="form-control" > 
                                        <option value="">- Select Category -</option>                               
                                        <?php                                        
                                        if (!empty($product_category)) {
                                            foreach ($product_category as $row) {
                                                if($category_id == $row->id){
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
                                <div class='form-group'>Product <?php echo form_error('product') ?>
                                    <select name="mst_product_id" id="mst_product_id" class="form-control" > 
                                        <option value="">- Select Product -</option>                                                                   
                                        <?php                                        
                                        if (!empty($product)) {
                                            foreach ($product as $row) {
                                                if($product_id == $row->id){
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

                            
                            <div class='box-footer'>
                                <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
                                <a href="<?php echo site_url('inspection_task') ?>" class="btn btn-default">Cancel</a>
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
       

    });
</script>
