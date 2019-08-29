<section class='content-header'>
    <h1>
        REQUEST NSPECTION
        <small>Req. Inspection Detail</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Inspection</a></li>
        <li class='active'>Req. Inspection Detail</li>
    </ol>
</section>        
<section class='content'>
    <h4>Header Information: <strong><?php echo $company_name.' | '.$product_category_name.' | '.$inspector_name;?></strong></h4>
    <div class='row'>        
        <div class='col-xs-12'>
            <?php if ($this->session->flashdata('message')) { ?>
            <div class="alert alert-success"> <?= $this->session->flashdata('message') ?> </div>
        <?php } ?>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <h3 class='box-title'>
                        <div class="form-group text-right">
                            <a  id="add_inspection" data-toggle="modal" data-target="#tambah-inspection" class="btn btn-primary">Add Requset Inspection</a>
                            <a class="btn btn-warning" href="<?php echo base_url('index.php/request_inspection'); ?>">Back</a>
                        </div>                
                    </h3>
                </div><!-- /.box-header -->
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="80px">No</th>
                                <th width="80px">Equipment</th>                                
                                <?php       
                                //echo '<pre>';print_r($header_col);die();
                                if($header_col){                    
                                    foreach($header_col as $key => $r){
                                        echo "<th>$header_col[$key]</th>";
                                    }
                                }
                                ?>
                                <th>Location</th>       
                                <th>Comment</th>
                                <th>Status</th>                  
                                <th>Actions</th>                  
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1; 
                            //echo '<pre>';print_r($begin_inspection);die();                           
                            foreach ($request_inspection as $r){                        
                                echo "
                                    <tr>
                                    <td>$no</td>
                                    <td>".$r->product_name."</td>";
                                                                                                    
                                $temp  = explode('|',$r->checklist_name); 
                                $i = 1; $n = count($temp); 
                                $value_col = array();                                
                                while($i < $n){                            
                                    $value_col[] = $temp[$i];                
                                    echo "<td>$temp[$i]</td>";
                                    $i=$i+2;                                                                                                 
                                }    

                                echo "
                                    <td>".$r->location_name."</td>
                                    <td>".$r->comment."</td>
                                    <td>".$r->status."</td>
                                    <td><i id='edit_inspection' class='btn-sm btn-info glyphicon glyphicon-edit' 
                                            data-toggle='modal' 
                                            data-target='#tambah-inspection' 
                                            data-detail_id='$r->id'
                                            data-parent_id='$r->parent_id'
                                            data-mst_product_id='$r->mst_product_id'
                                            data-procat_id='$procat_id'
                                            data-checklist_name='$r->checklist_name'
                                            data-comment='$r->comment'
                                            data-status_inspection='$r->status'
                                            data-location_id='$r->location_id'
                                            data-uid='$r->uid'
                                            data-location_name='$r->location_name'
                                            data-toggle='tooltip' 
                                            title='Edit Inspection'>
                                        </i> ".
                                        anchor('request_inspection/delete_inspection/' . $r->id.'/'.$this->uri->segment(3).'/'.$this->uri->segment(4).'/'.$this->uri->segment(5).'/'.$this->uri->segment(6), '<i class="btn-sm btn-info glyphicon glyphicon-trash" data-toggle="tooltip" title="Delete"></i>', array('onclick' => "return confirm('This inspection schedule will delete?')")). 
                                    "</td>
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

    <!-- add inspectio  detil -->
    <div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="tambah-inspection" class="modal fade">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
                    <h4 class="modal-title">Request Detail Inspection</h4>
                </div>
                <form id="form_modal" class="form-horizontal" action="<?php echo $action ?>" method="post" role="form">   
                    <input type="hidden" name="parent_id" id="parent_id" value="<?php echo $this->uri->segment(3); ?>"></input>                    
                    <div class="modal-body" id="view-info">
                            <input type="hidden" name="detail_id" id="detail_id" value="0"></input>
                            <input type="hidden" name="procat_id" id="procat_id" value="<?php echo $product_id;?>"></input>
                            <input type="hidden" name="parent_id" id="parent_id" value="<?php echo $parent_id; ?>"></input>
                            <div class='box-body'>       
                                <div class='form-group'>Equipment <?php echo form_error('mst_product_id') ?>
                                    <select name="mst_product_id" id="mst_product_id" class="form-control" > 
                                        <option value="">- Select Equipment -</option>
                                        <?php                                        
                                        if (!empty($category)) {
                                            foreach ($category as $row) {
                                                echo "<option value='$row->id'>".$row->category."</option>";                                                
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>                      
                                <div class='form-group'>Location <?php echo form_error('location_name') ?>
                                    <select name="location_id" id="location_id" class="form-control" > 
                                        <option value="">- Select Location -</option>                               
                                        <?php                                        
                                        if (!empty($location)) {
                                            foreach ($location as $row) {
                                                echo "<option value='$row->id'>" . $row->location_name . "</option>";                                                
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                                                                            
                                <div id='checklist'>tes</div>
                            
                                <div class='form-group'>Comment <?php echo form_error('comment') ?>
                                    <textarea class="form-control" id="comment" name="comment" placeholder="Please type of comment" rows="3"><?php echo $comment; ?></textarea>
                                </div>
                                <div class='form-group'>Status <?php echo form_error('status') ?>
                                    <select name="status_inspection" id="status_inspection" class="form-control" > 
                                        <option value="">- Select Status -</option>
                                        <?php                                        
                                        if (!empty($status)) {
                                            foreach ($status as $row) {
                                                echo "<option value='$row->status_name'>" . $row->status_name. "</option>";
                                            }
                                        }
                                        ?>
                                    </select>                                    
                                </div>
                            </div>
                   
                        </div>
                        <div class="modal-footer">                        
                            <button class="btn btn-info" type="submit" id="save_inspection"> Save&nbsp;</button>
                            <button type="button" class="btn btn-warning" data-dismiss="modal"> Cancel</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <!-- End of add inspection detil -->

</section><!-- /.content -->


<script src="<?php echo base_url('assets/js/jquery-1.11.2.min.js') ?>"></script>
<script type="text/javascript">
    $(document).ready(function () {   
        $('#info-product').hide();                               

        $("#product_category_id").change(function(){ 
            var value = $(this).val();   
            $('#cat_id').val(value);

            $.ajaxSetup({
                type:"POST",
                url: "<?php echo base_url('inspection_task/ambil_data') ?>",
                cache: false,
            });
                  
            if(value > 0){
                $.ajax({
                    data:{modul:'inspection_task/ambil_data',id:value},
                    success: function(respond){                                               
                        $("#mst_product_id").html(respond);
                    }
                })
            }
        });

        $("#add_inspection").click(function(){    
            var procat_id = $('#procat_id').val();
            //alert(procat_id);

            $.ajaxSetup({
                type:"POST",
                url: "<?php echo base_url('index.php/request_inspection/get_checklist_per_product') ?>",
                cache: false,
            });

            if(procat_id){
                //alert('masuk');
                $.ajax({ 
                    data:{modul:'index.php/request_inspection/get_checklist_per_product',procat_id:procat_id},
                    success: function(respond){
                        $("#checklist").html(respond);                                              
                    }
                })
            }
            
        });

        $('select[name="mst_product_id"]').change(function(){
            var product_value = $('#mst_product_id').val(); 
            //alert(product_value);
            $('#prod_id').val(product_value);

            $.ajaxSetup({
                type:"POST",
                url: "<?php echo base_url('inspection_task/get_detail') ?>",
                cache: false,
            });

            var value = $(this).val();            
            if(value > 0){                
                $.ajax({
                data:{modul:'inspection_task/get_detail',id:value},
                    success: function(respond){
                        //alert('ok mst_produk nih');                      
                        //$("#view-info").html(respond);
                    }
                })
            }
        });        
       

    });
</script>

<script type="text/javascript">
    $(document).on("click", "#edit_inspection", function () {                
        var mId = $(this).data('detail_id'); 
        var mParentId = $(this).data('parent_id'); 
        var mMstProductId = $(this).data('mst_product_id'); 
        var mProcatId = $(this).data('procat_id');         
        var mComment = $(this).data('comment'); 
        var mStatusInspection = $(this).data('status_inspection'); 
        var mLocationId = $(this).data('location_id'); 
        var mLocationName = $(this).data('location_name'); 
        var mChecklist_name = $(this).data('checklist_name'); 
        
        var hasil = mChecklist_name.split('|');
        var n = hasil.length; 
        var result = $('#checklist');
        result.html('');

        for (var i = 0; i < n; i=i+2) {
            var st = 'status' + i;         
            var cn = 'checklist_name' +i;
            result.append(
                '<input type="hidden" id="' + cn +'" name="' + cn + '" value="'+ hasil[i] + '"></input>' + 
                '<label>'+hasil[i] + '</label><br>'+
                '<input type="radio" id="'+ st + '" name="' + st +'" class=\'form-check-input\' value="Y" > Yes&nbsp;&nbsp;'+
                '<input type="radio" id="' + st +'" name="' + st +'" class=\'form-check-input\' value="N" > No'+'<br><br>'
            );
        }     


        for (var i = 0; i < n; i=i+2) {
            var st = 'status' + i;
            var radios = $('input:radio[name=' + st + ']'); //alert(st);
            var mStatus = hasil[i+1]; //alert(mStatus);
            if(mStatus == 'Y'){                        
                radios.filter('[value=Y]').prop('checked', true);            
            }else{                        
                radios.filter('[value=N]').prop('checked', true);
            }
        }   

        $(".modal-body #detail_id").val(mId);         
        $(".modal-body #parent_id").val(mParentId);
        $(".modal-body #mst_product_id").val(mMstProductId);
        $(".modal-body #procat_id").val(mProcatId);
        $('select[name=mLocation_id] > option:first-child').text(mLocationName);                 
        $(".modal-body #location_id").val(mLocationId);        
        $('select[name=mStatusInspection] > option:first-child').text(mStatusInspection);
        $(".modal-body #status_inspection").val(mStatusInspection);
        $(".modal-body #comment").val(mComment);
        $("#form_modal").attr("action", "<?php echo base_url('index.php/request_inspection/save_update_inspection')?>");


        $("#save_inspection").button().click(function(){            
            if($("#status").val() == "") {
                alert('Please select status "Y" or "N"');
                return false;
            }/*else{
                alert('After this process, system will update expire date on current product');
            }*/

        });

    }); 
</script>

<!--<form class="form-horizontal" action="<?php //echo base_url('master_product_detail/save_add')?>" method="post" enctype="multipart/form-data" role="form">-->