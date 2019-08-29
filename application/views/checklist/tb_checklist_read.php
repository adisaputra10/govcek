<section class='content-header'>
    <h1>
        CHECKLIST
        <small>List of Checklist</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Master</a></li>
        <li class='active'>Checklist</li>
    </ol>
</section>   
<section class='content'>
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>
                <div class='box-header'>
                    <h3 class='box-title'> Detail Checklist</h3>
                    <table class="table table-bordered">
                        <tr><td>Checklist Name</td><td><?php echo $checklist_name; ?></td></tr>
                        <tr><td>Active</td><td><?php echo $active; ?></td></tr>
                        <tr><td>Uid</td><td><?php echo $uid; ?></td></tr>
                    </table>
                    <div class='box-footer'>
                        <a href="<?php echo site_url('checklist') ?>" class="btn btn-primary">Back</a>
                    </div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->