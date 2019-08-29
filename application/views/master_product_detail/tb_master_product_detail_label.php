<section class='content-header'>
    <h1>
        MASTER PRODUCT
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Product</a></li>
        <li class='active'>Master & Details Product Form</li>
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
                        <div class='box-body'>
                            <div class='form-group'>Category <?php echo form_error('category') ?>
                                <input type="text" class="form-control" name="category" id="category" value="<?php echo $category; ?>" disabled/>
                            </div>
                            <div class='form-group'>Product Category <?php echo form_error('product_category') ?>
                                <input type="text" class="form-control" name="product_category" id="product_category" value="<?php echo $product_category; ?>" disabled/>
                            </div>
                            
                        </div>                           
                    </div><!-- /.box-body -->
                    <div class='box-body table-responsive'>
                        <!-- kanan -->  
                        <div class='form-group'>End User <?php echo form_error('end_user') ?>
                            <input type="text" class="form-control" name="end_user" id="end_user" value="<?php echo $end_user; ?>" disabled/>
                        </div>
                        <div class='form-group'>Manufacture Name <?php echo form_error('manufacture_name') ?>
                            <input type="text" class="form-control" name="manufacture_name" id="manufacture_name" value="<?php echo $manufacture_name; ?>" disabled/>
                        </div>              
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>


    <!-- bawah -->
    <h3>DETAILS PRODUCT</h3>       
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <h3 class='box-title'>
                        <div class="form-group text-right">
                            <?php if ($caption == 'Add Detail') { ?>
                                <a data-toggle="modal" data-target="#tambah-data" class="btn btn-primary"><?php echo $caption; ?></a>
                                <a class="btn btn-warning" href="<?php echo base_url('master_product'); ?>">Back</a>
                            <?php }else{ ?>
                                <a data-toggle="modal" data-target="#update-data" class="btn btn-primary"><?php echo $caption; ?></a>
                                <a class="btn btn-warning" href="<?php echo base_url('master_product'); ?>">Back</a>
                            <?php } ?>
                        </div>                
                    </h3>
                </div><!-- /.box-header -->
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="80px">No</th>
                                <?php                               
                                foreach ($cek_label as $r)
                                {                                
                                    echo "<th>".$r->label_name."</th>";
                                }?>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1; //echo '<pre>';print_r($product_detail_data);die();
                            $uri = $this->uri->segment(3);
                            echo "<tr><td>$no</td>";
                            foreach ($label_data as $r){                        
                                echo "<td>".$r->label_value."</td>";                                
                            }
                            echo "</tr>";
                            $no++;
                            ?>
                        </tbody>
                    </table>                    
                </div><!-- /.box-body -->
            </div><!-- /.box -->
        </div><!-- /.col -->
    </div><!-- /.row -->
    
    <!-- Modal Tambah -->
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="tambah-data" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                    <h4 class="modal-title">Add Detail Product</h4>
                </div>
                <form class="form-horizontal" action="<?php echo base_url('index.php/master_product_detail/save_update_label')?>" method="post" role="form">
                <!--<form class="form-horizontal" action="<?php //echo $action ?>" method="post" enctype="multipart/form-data" role="form">-->
                    <div class="modal-body">
                        <?php
                        foreach ($cek_label as $r){                                                   
                            echo '
                            <div class="form-group">
                                <label class="col-lg-2 col-sm-2 control-label">'.$r->label_name.'</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="'.$r->label_name.'" name="'.$r->label_name.'" placeholder="Type of '.$r->label_name.'">
                                    <input type="hidden" class="form-control" name="id" id="id" value="'.$id.'">
                                    <input type="hidden" class="form-control" name="parent_id" id="parent_id" value="'.$parent_id.'">
                                    <input type="hidden" class="form-control" name="procat_id" id="procat_id" value="'.$procat_id.'">
                                </div>
                            </div>';                                                   
                        }?>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-info" type="submit"> Save Detail&nbsp;</button>
                        <button type="button" class="btn btn-warning" data-dismiss="modal"> Cancel</button>
                    </div>
                </form>
                </div>
            </div>
        </div>
    </div>
    <!-- END Modal Tambah -->

    <!-- Modal Update Tambah -->
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="update-data" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                    <h4 class="modal-title">Update Detail Product</h4>
                </div>
                <form class="form-horizontal" action="<?php echo base_url('index.php/master_product_detail/simpan_update_label')?>" method="post" role="form">
                <!--<form class="form-horizontal" action="<?php //echo $action ?>" method="post" enctype="multipart/form-data" role="form">-->
                    <div class="modal-body">
                        <?php
                        //echo '<pre>';print_r($cek_label); //die();
                        foreach ($cek_label as $r){                                                   
                            echo '
                            <div class="form-group">
                                <label class="col-lg-2 col-sm-2 control-label">'.$r->label_name.'</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" id="'.$r->label_name.'" name="'.$r->label_name.'" value = "'.$r->label_value.'">
                                    <input type="hidden" class="form-control" name="id" id="id" value="'.$id.'">
                                    <input type="hidden" class="form-control" name="parent_id" id="parent_id" value="'.$parent_id.'">
                                    <input type="hidden" class="form-control" name="procat_id" id="procat_id" value="'.$procat_id.'">                            
                                </div>
                            </div>';                                                   
                        }?>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-info" type="submit"> Save Detail&nbsp;</button>
                        <button type="button" class="btn btn-warning" data-dismiss="modal"> Cancel</button>
                    </div>
                </form>
                </div>
            </div>
        </div>
    </div>
    <!-- END Modal edit-data -->

</section><!-- /.content -->

<script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js') ?>"></script>
<script type="text/javascript">
    $(document).ready(function () {
        $("#mytable").dataTable();        
    });
</script>

<script type="text/javascript">
    $(document).on("click", "#edit_detail_product", function () {
        //alert('tes');
        var mIdp = $(this).data('id_parent'); 
        var mId = $(this).data('id_detail'); 
        var mSize = $(this).data('size');
        var mAdjustable = $(this).data('deskripsi'); 
        var mAdjustable_id = $(this).data('adjustable_id'); 
        var mLegs = $(this).data('legs_name');  
        var mLegs_id = $(this).data('legs_id');  
        var mBasic_type = $(this).data('type_description'); 
        var mBasic_type_id = $(this).data('basic_type_id'); 
        var mGrade = $(this).data('grade_name'); 
        var mGrade_id = $(this).data('grade_id'); 
        var mConstruction = $(this).data('construction_name'); 
        var mConstruction_id = $(this).data('construction_id'); 
        var mReach0 = $(this).data('reach0');
        var mReach1 = $(this).data('reach1');
        var mReach2 = $(this).data('reach2');
        var mProof_tested = $(this).data('proof_tested');  //alert(mProof_tested);
        //$(".modal-body #adjustable_id").val(mAdjustable_id);

        var radios = $('input:radio[name=proof_tested]');         
        if(mProof_tested == 'Y'){                        
            radios.filter('[value=Y]').prop('checked', true);            
        }else{                        
            radios.filter('[value=N]').prop('checked', true);
        }
        
        $(".modal-body #id_parent").val(mIdp);
        $(".modal-body #id_detail").val(mId);
        $(".modal-body #size").val(mSize);
        $(".modal-body #reach0").val(mReach0);
        $(".modal-body #reach1").val(mReach1);
        $(".modal-body #reach2").val(mReach2);
        $('select[name=adjustable_id] > option:first-child').text(mAdjustable);                 
        $(".modal-body #adjustable_id").val(mAdjustable_id);
        $('select[name=legs_id] > option:first-child').text(mLegs); 
        $(".modal-body #legs_id").val(mLegs_id);
        $('select[name=basic_type_id] > option:first-child').text(mBasic_type); 
        $(".modal-body #basic_type_id").val(mBasic_type_id);
        $('select[name=grade_id] > option:first-child').text(mGrade); 
        $(".modal-body #grade_id").val(mGrade_id); 
        $('select[name=construction_id] > option:first-child').text(mConstruction); 
        $(".modal-body #construction_id").val(mConstruction_id); 
        $(".modal-body #proof_tested").val(mProof_tested);

    }); 
</script>

<!--
data-size=\"$r->size\" 
data-deskripsi=\"$r->deskripsi\" 
data-legs_name=\"$r->legs_name\" 
data-type_description=\"$r->type_description\" 
data-grade_name=\"$r->grade_name\" 
data-construction_name=\"$r->construction_name\" 
data-reach0=\"$r->reach0\" 
data-reach1=\"$r->reach1\" 
data-reach2=\"$r->reach2\" 
data-proof_tested=\"$r->proof_tested\"
->