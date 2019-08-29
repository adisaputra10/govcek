<section class='content-header'>
    <h1>
        SCHEDULE
        <small>Schedule Form Entry</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Master</a></li>
        <li class='active'>Schedule Form</li>
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
                                <div class='form-group'>Schedule <?php echo form_error('category') ?>
                                    <input type="text" class="form-control" name="schedule" id="schedule" placeholder="Please type of Your Schedule" value="<?php echo $schedule; ?>" />
                                </div>
                                <div class='form-group'>Interval Value <?php echo form_error('interval_value') ?>
                                    <input type="text" class="form-control" name="interval_value" id="interval_value" placeholder="Please type Interval Value" value="<?php echo $interval_value; ?>" />
                                </div>
                                <div class='form-group'>MONTH or DAY <?php echo form_error('interval_label') ?>
                                    <input type="text" class="form-control" name="interval_label" id="interval_label" placeholder="Please type Interval Label" value="<?php echo $interval_label; ?>" />
                                </div>
                            </div>
                            <div class='box-footer'>
                                <input type="hidden" name="id" value="<?php echo $id; ?>" /> 
                                <button type="submit" class="btn btn-primary"><?php echo $button ?></button> 
                                <a href="<?php echo site_url('schedule') ?>" class="btn btn-default">Cancel</a>
                            </div>
                        </form>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</section><!-- /.content -->