<section class='content-header'>
    <h1>
        CHECKLIST
        <small>Checklist Form Entry</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Master</a></li>
        <li class='active'>Checklist Form</li>
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
                                <div class="form-group">
                                    <label class="col-lg-2 col-sm-2 control-label">Checklist <?php echo form_error('checklist_name'); ?></label>
                                    <div class="col-lg-10">
                                        <input type="text" class="form-control" name="checklist_name" id="checklist_name" value="<?php echo $checklist_name; ?>" placeholder="Type of checklist name">
                                        <input type="hidden" name="id" id="id" value="<?php echo $id ?>"</input>
                                    </div>
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class="form-group">
                                    <label class="col-lg-2 col-sm-2 control-label">Active</label>
                                    <div class="col-lg-10">
                                        <fieldset class="form-group">
                                            <div class="form-check">
                                            <label class="form-check-label">
                                                <?php if ($active == 'Y'){?>
                                                    <input type="radio" class="form-check-input" name="active" id="active1" value="Y" checked> Yes
                                                    <input type="radio" class="form-check-input" name="active" id="active2" value="N"> No
                                                <?php }else{ ?>
                                                    <input type="radio" class="form-check-input" name="active" id="active1" value="Y"> Yes
                                                    <input type="radio" class="form-check-input" name="active" id="active2" value="N" checked> No
                                                <?php } ?>
                                            </label>
                                            </div>    
                                        </fieldset>
                                    </div>
                                </div>
                            </div>
                            <div class='box-body'>
                                <div class='form-group'>
                                    <div class='box-footer'>
                                        <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
                                        <a href="<?php echo site_url('checklist') ?>" class="btn btn-default">Cancel</a>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</section><!-- /.content -->