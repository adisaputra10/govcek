<section class='content-header'>
    <h1>
        END USER
        <small>List of End User</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Master</a></li>
        <li class='active'>End User</li>
    </ol>
</section>        
<section class='content'>
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <h3 class='box-title'><?php echo anchor('end_user/create/', '<i class="glyphicon glyphicon-plus"></i>Add Data', array('class' => 'btn btn-primary btn-sm')); ?>
                        <?php echo anchor(site_url('end_user/excel'), ' <i class="fa fa-file-excel-o"></i> Excel', 'class="btn btn-primary btn-sm"'); ?></h3>
                </div><!-- /.box-header -->
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="30px">No</th>
                                <th>Company</th>
                                <th>Contact Name</th>
                                <th>Division</th>
                                <th>Address</th>
                                <th>City</th>
                                <!--<th width="150px">State Prov.</th>
                                <th width="150px">Postal Code</th>-->
                                <th>Email</th>
                                <!--<th width="150px">Faximile</th>-->
                                <th>Phone #</th>
                                <th>Mobile</th>
                                <!--<th width="150px">Note</th>-->
                                <!--<th>Insp. Schedule</th>
                                <th>Unit</th>-->
                                <th>Major</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            foreach ($end_user_data as $r){                        
                                echo "
                                    <tr>
                                    <td>$no</td>
                                    <td>".$r->company."</td>
                                    <td>".$r->contact_name."</td>
                                    <td>".$r->division."</td>
                                    <td>".$r->address."</td>
                                    <td>".$r->city."</td>                                    
                                    <td>".$r->email."</td>                                    
                                    <td>".$r->phone."</td>                                    
                                    <td>".$r->mobile."</td>                                    
                                    <td>".$r->major_name."</td>
                                    <td>" . anchor('end_user/update/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></i>') . " ".
                                    anchor('end_user/delete/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('This End User will delete?')")) . "</td>
                                    </tr>";
                                $no++;
                            }
                            ?>
                        </tbody>
                    </table>					
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
</section><!-- /.content -->
<script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js') ?>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#mytable").dataTable();
    });
</script>
