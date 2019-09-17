<section class='content-header'>
    <h1>
        MASTER EQUIPMENT
        <small>List of Master Equipment</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Equipment</a></li>
        <li class='active'>Master Equipment</li>
    </ol>
</section>        
<section class='content'>
    <?php if ($this->session->flashdata('error')) { ?>
        <div class="alert alert-danger"> <?= $this->session->flashdata('error') ?> </div>
    <?php } ?>
    <?php if ($this->session->flashdata('success')) { ?>
        <div class="alert alert-success"> <?= $this->session->flashdata('success') ?> </div>
    <?php } ?>
    <?php if ($this->session->flashdata('checklist')) { ?>
        <div class="alert alert-danger"> <?= $this->session->flashdata('checklist') ?> </div>
    <?php } ?>
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <h3 class='box-title'><?php echo anchor('master_product/create/', '<i class="glyphicon glyphicon-plus"></i>Add Data', array('class' => 'btn btn-primary btn-sm')); ?>
                    <?php echo anchor('master_product/form_excel/', '<i class="glyphicon glyphicon-plus"></i>Import Excel', array('class' => 'btn btn-primary btn-sm')); ?>
                        <?php echo anchor(site_url('master_product/excel'), ' <i class="fa fa-file-excel-o"></i> Excel', 'class="btn btn-primary btn-sm"'); ?></h3>
                </div><!-- /.box-header -->
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="40px">No</th>
                                <th>Category</th>
                                <th>Product Category</th>
                                <th>End User</th>                                
                                <th>Serial #</th>
                                <th>Asset #</th>
                                <!--<th>Service Date</th>-->
                                <th>Last Insp. Date</th>
                                <th>Exp. Date</th>
                                <th>Caps</th>
                                <th>Unit</th>  
                                 <th>Description</th> 
                                <th>Status</th>                 
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            $today = date('Y-m-d');
                            $today_dt = new DateTime($today);                            
                            //echo '<pre>';print_r($master_product_data);die();
                            foreach ($master_product_data as $r){ 
                                $dos_out = base64_encode($r->service_date);
                                $exp_out = base64_encode($r->expire_date);                          
                                $service_dt = new DateTime($r->expire_date);                             
                                echo "
                                    <tr>
                                    <td>$no</td>
                                    <td>".$r->category."</td>
                                    <td>".$r->product_category."</td>
                                    <td>".$r->end_user."</td>                                    
                                    <td>".$r->serial_number."</td>
                                    <td>".$r->asset_number."</td>";
                                    

                                    //echo $r->service_date.'/'.$today;
                                    if ($service_dt >= $today_dt){
                                        //echo "<td>".$r->service_date."</td>";  
                                        echo "
                                            <td>".$r->last_inspection."</td>                     
                                            <td>".$r->expire_date."</td>                            
                                            <td>".$r->capacity."</td>
                                            <td>" .$r->unit_system."</td>
                                          
                                            <td>" .$r->description."</td>
                                            <td>" .$r->status_name."</td>
                                            <td>". 
                                            anchor('master_product/update/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></i>') . " ".
                                            anchor('master_product_detail/add_detail/' . $r->id.'/'.$r->product_category_id, '<i class="btn-sm btn-info glyphicon glyphicon-list-alt" data-toggle="tooltip" title="Add Detail"></i>') . " ".
                                            anchor('inspection_task/create_header/' . $r->id.'/'.$dos_out.'/'.$r->product_category_id, '<i class="btn-sm btn-info glyphicon glyphicon-list-alt" data-toggle="tooltip" title="Inspection Detail"></i>') . " ".
                                            /*
                                            anchor('master_product_detail/generate_inspection/' . $r->id.'/'.$dos_out.'/'.$r->inspection_schedule_id, '<i class="btn-sm btn-info glyphicon glyphicon-list-alt" data-toggle="tooltip" title="Generate Inspection Schedule"></i>') . " ".*/
                                            anchor('master_product/delete/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Product Category will delete?')")) . "</td>
                                            </tr>";
                                    }else{ 
                                        //echo "<td>".$r->service_date."</td>";
                                        echo "
                                            <td>".$r->last_inspection."</td>
                                            <td bgcolor='#FF0000'><font color='#FFFFFF'><strong>".$r->expire_date."</strong></font></td>
                                            <td>".$r->capacity."</td>
                                            <td>".$r->unit_system."</td>
                                      
                                            <td>" .$r->description."</td>
                                            <td>".$r->status_name."</td>
                                            <td>". 
                                            anchor('master_product/update/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-edit" data-toggle="tooltip" title="Edit"></i>') . " ".
                                            anchor('master_product_detail/add_detail/' . $r->id.'/'.$r->product_category_id, '<i class="btn-sm btn-info glyphicon glyphicon-list-alt" data-toggle="tooltip" title="Add Detail"></i>') . " ".
                                            anchor('inspection_task/create_header/' . $r->id.'/'.$dos_out.'/'.$r->product_category_id, '<i class="btn-sm btn-danger glyphicon glyphicon-list-alt" data-toggle="tooltip" title="Need Inspection"></i>') . " ".
                                            /*
                                            anchor('master_product_detail/generate_inspection/' . $r->id.'/'.$dos_out.'/'.$r->inspection_schedule_id, '<i class="btn-sm btn-info glyphicon glyphicon-list-alt" data-toggle="tooltip" title="Generate Inspection Schedule"></i>') . " ".*/
                                            anchor('master_product/delete/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('Product Category will delete?')")) . "</td>
                                            </tr>";
                                    }

                                
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
