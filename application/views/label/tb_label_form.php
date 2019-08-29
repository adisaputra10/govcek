<section class='content-header'>
    <h1>
        L A B E L
        <small>Form Entry Label</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Master</a></li>
        <li class='active'>Form Entry Label</li>
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
                                <div class='form-group'>Label Name <?php echo form_error('label_name') ?>
                                    <input type="text" class="form-control" name="label_name" id="label_name" placeholder="example: description" value="<?php echo $label_name; ?>" />
                                </div>                                
                            </div>
                            <div class='box-body'>  
                                <div class='form-group'>For product category <?php echo form_error('product_category_id') ?>
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
                            <div class='box-footer'>
                                <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
                                <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
                                <a href="<?php echo site_url('label') ?>" class="btn btn-default">Cancel</a>
                            </div>
                        </form>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</section><!-- /.content -->