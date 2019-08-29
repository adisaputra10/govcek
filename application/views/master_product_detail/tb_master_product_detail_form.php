<section class='content-header'>
    <h1>
        MASTER EQUIPMENT
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Equipment</a></li>
        <li class='active'>Master & Details Equipment Form</li>
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
    <h3>DETAILS EQUIPMENT</h3>       
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <h3 class='box-title'>
                        <div class="form-group text-right">
                            <a data-toggle="modal" data-target="#tambah-data" class="btn btn-primary">Add Detail</a>
                            <a class="btn btn-warning" href="<?php echo base_url('master_product'); ?>">Back</a>
                        </div>                
                    </h3>
                </div><!-- /.box-header -->
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="80px">No</th>
                                <th>Size</th>
                                <th>Adjustable</th>
                                <th>Legs #</th>
                                <th>Basic Type</th>
                                <th>Grade</th>
                                <th>Construction Type</th>                                
                                <th>Reach 1</th>
                                <th>Reach 2</th>
                                <th>Reach 3</th>          
                                <th>Proof Tested</th>                      
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1; //echo '<pre>';print_r($product_detail_data);die();
                            $uri = $this->uri->segment(3);
                            foreach ($product_detail_data as $r){                        
                                echo "
                                    <tr>
                                    <td>$no</td>
                                    <td>".$r->size."</td>
                                    <td>".$r->deskripsi."</td>
                                    <td>".$r->legs_name."</td>
                                    <td>".$r->type_description."</td>
                                    <td>".$r->grade_name."</td>
                                    <td>".$r->construction_name."</td>                                    
                                    <td>".$r->reach0."</td>                                    
                                    <td>".$r->reach1."</td>                                    
                                    <td>".$r->reach2."</td>           
                                    <td>".$r->proof_tested."</td>                         
                                    <td><td>
                                        <i id ='edit_detail_product' 
                                        class='btn-sm btn-info glyphicon glyphicon-edit' 
                                        data-id_parent = \"$uri\"
                                        data-id_detail = \"$r->id\"
                                        data-size=\"$r->size\" 
                                        data-deskripsi=\"$r->deskripsi\" 
                                        data-adjustable_id=\"$r->adjustable_id\" 
                                        data-legs_name=\"$r->legs_name\" 
                                        data-legs_id=\"$r->legs_id\" 
                                        data-type_description=\"$r->type_description\" 
                                        data-basic_type_id=\"$r->basic_type_id\" 
                                        data-grade_name=\"$r->grade_name\" 
                                        data-grade_id=\"$r->grade_id\" 
                                        data-construction_name=\"$r->construction_name\" 
                                        data-construction_id=\"$r->construction_id\" 
                                        data-reach0=\"$r->reach0\" 
                                        data-reach1=\"$r->reach1\" 
                                        data-reach2=\"$r->reach2\" 
                                        data-proof_tested=\"$r->proof_tested\" 
                                        data-id=\"$r->id\" 
                                        data-toggle='modal' 
                                        data-target='#tambah-data' 
                                        title='Edit Detail Product'></i> ".
                                        anchor('master_product_detail/delete/' . $r->id, '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('This Product detail will delete?')")) . "</td>
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
    
    <!-- Modal Tambah -->
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="tambah-data" class="modal fade">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
	                <h4 class="modal-title">Add Detail Equipment</h4>
	            </div>
	            <form class="form-horizontal" action="<?php echo base_url('master_product_detail/save_update_detail')?>" method="post" enctype="multipart/form-data" role="form">
	            <!--<form class="form-horizontal" action="<?php //echo $action ?>" method="post" enctype="multipart/form-data" role="form">-->
		            <div class="modal-body">
		                    <div class="form-group">
		                        <label class="col-lg-2 col-sm-2 control-label">Size</label>
		                        <div class="col-lg-10">
		                            <input type="text" class="form-control" id="size" name="size" placeholder="Type of product size">
                                    <input type="hidden" class="form-control" name="id_detail" id="id_detail" value="">
                                    <input type="hidden" class="form-control" name="id_parent" id="id_parent" value="">
		                        </div>
		                    </div>
		                    <div class='form-group'>
                                <label class="col-lg-2 col-sm-2 control-label">Adjustable <?php echo form_error('adjustable') ?></label>
                                <div class="col-lg-10">
                                    <select name="adjustable_id" id="adjustable_id" class="form-control" > 
                                        <option value="">- Select Adjustable -</option>                               
                                        <?php                                        
                                        if (!empty($adjustable)) {
                                            foreach ($adjustable as $row) {
                                                 echo "<option value='$row->id'>" . $row->deskripsi . "</option>";                                                
                                            }
                                        }
                                        ?>
                                    </select>  
                                </div>                                  
                            </div>
                            <div class='form-group'>
                                <label class="col-lg-2 col-sm-2 control-label">Legs <?php echo form_error('legs') ?></label>
                                <div class="col-lg-10">
                                    <select name="legs_id" id="legs_id" class="form-control" > 
                                        <option value="">- Select Legs -</option>                               
                                        <?php                                        
                                        if (!empty($legs)) {
                                            foreach ($legs as $row) {
                                                echo "<option value='$row->id'>" . $row->legs_name . "</option>";                                                
                                            }
                                        }
                                        ?>
                                    </select>  
                                </div>                                  
                            </div>
                            <div class='form-group'>
                                <label class="col-lg-2 col-sm-2 control-label">Basic Type <?php echo form_error('basic_type') ?></label>
                                <div class="col-lg-10">
                                    <select name="basic_type_id" id="basic_type_id" class="form-control" > 
                                        <option value="">- Select Basic Type -</option>                               
                                        <?php                                        
                                        if (!empty($basic_type)) {
                                            foreach ($basic_type as $row) {
                                                echo "<option value='$row->id'>" . $row->type_description . "</option>";                                                
                                            }
                                        }
                                        ?>
                                    </select>  
                                </div>                                  
                            </div>
		                    <div class='form-group'>
                                <label class="col-lg-2 col-sm-2 control-label">Grade <?php echo form_error('grade') ?></label>
                                <div class="col-lg-10">
                                    <select name="grade_id" id="grade_id" class="form-control" > 
                                        <option value="">- Select Grade -</option>                               
                                        <?php                                        
                                        if (!empty($grade)) {
                                            foreach ($grade as $row) {
                                                echo "<option value='$row->id'>" . $row->grade_name . "</option>";                                                
                                            }
                                        }
                                        ?>
                                    </select>  
                                </div>                                  
                            </div>
                            <div class='form-group'>
                                <label class="col-lg-2 col-sm-2 control-label">Cons. Type <?php echo form_error('construction') ?></label>
                                <div class="col-lg-10">
                                    <select name="construction_id" id="construction_id" class="form-control" > 
                                        <option value="">- Select Construction -</option>                               
                                        <?php                                        
                                        if (!empty($construction)) {
                                            foreach ($construction as $row) {
                                                echo "<option value='$row->id'>" . $row->construction_name . "</option>";                                               
                                            }
                                        }
                                        ?>
                                    </select>  
                                </div>                                  
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 col-sm-2 control-label">Reach</label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" name="reach0" id="reach0" placeholder="Please type Reach 1" value="<?php echo $reach0; ?>" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 col-sm-2 control-label"></label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" name="reach1" id="reach1" placeholder="Please type Reach 2 " value="<?php echo $reach1; ?>" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 col-sm-2 control-label"></label>
                                <div class="col-lg-10">
                                    <input type="text" class="form-control" name="reach2" id="reach2" placeholder="Please type Reach 3" value="<?php echo $reach2; ?>" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-2 col-sm-2 control-label">Proof Tested</label>
                                <div class="col-lg-10">
                                    <fieldset class="form-group">
                                        <div class="form-check">
                                        <label class="form-check-label">
                                            <input type="radio" class="form-check-input" name="proof_tested" id="proof_tested1" value="Y" checked>
                                            Yes
                                            <input type="radio" class="form-check-input" name="proof_tested" id="proof_tested2" value="N">
                                            No
                                        </label>
                                        </div>    
                                    </fieldset>
                                </div>
                            </div>
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