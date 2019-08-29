<section class='content-header'>
    <h1>
        INSPECTOR
        <small>Inspector Form Entry</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Master</a></li>
        <li class='active'>Inspector Form</li>
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
                                <div class='form-group'>Inspector Name <?php echo form_error('inspector_name') ?>
                                    <input type="text" class="form-control" name="inspector_name" id="inspector_name" placeholder="Please type of Inspector Name" value="<?php echo $inspector_name; ?>" />
                                </div>
                                <?php //echo $manufacture_name; ?>                                
                                <div class='form-group'>End User <?php echo form_error('manufacture_name') ?>
                                    <select name="manufacture_id" id="manufacture_id" class="form-control" > 
                                        <option value="">- Select End User -</option>                               
                                        <?php                                        
                                        if (!empty($manufacture)) {
                                            foreach ($manufacture as $row) {
                                                if($manufacture_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . strtoupper($row->manufacture_name) . "</option>";
                                                }else{
                                                    echo "<option value='$row->id'>" . strtoupper($row->manufacture_name) . "</option>";
                                                }
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                                <div class='form-group'>Link to User <?php echo form_error('username') ?>
                                    <select name="tb_users_id" id="tb_users_id" class="form-control" > 
                                        <option value="">- Select User -</option>                               
                                        <?php                                        
                                        if (!empty($end_user)) {
                                            foreach ($end_user as $row) {
                                                if($tb_users_id == $row->id){
                                                    echo "<option selected='selected' value='$row->id'>" . strtoupper($row->company) . "</option>";
                                                }else{
                                                    echo "<option value='$row->id'>" . strtoupper($row->username) . "</option>";
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
                                <a href="<?php echo site_url('inspector') ?>" class="btn btn-default">Cancel</a>
                            </div>
                        </form>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</section><!-- /.content -->