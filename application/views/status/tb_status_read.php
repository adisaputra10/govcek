<section class='content-header'>
    <h1>
        STATUS
        <small>List of Status</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Master</a></li>
        <li class='active'>Status</li>
    </ol>
</section>   
<section class='content'>
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>
                <div class='box-header'>
                    <h3 class='box-title'> Status</h3>
                    <table class="table table-bordered">
                        <tr><td>Status Name</td><td><?php echo $status_name; ?></td></tr>
                    </table>
                    <div class='box-footer'>
                        <a href="<?php echo site_url('status') ?>" class="btn btn-primary">Back</a>
                    </div>
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->