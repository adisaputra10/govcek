<section class='content-header'>
    <h1>
        CERTIFICATE OF THOROUGH EXAMINATION
        <small>Reporting</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Reporting</a></li>
        <li class='active'>Certificate TE</li>
    </ol>
</section>        
<section class='content'>
    <div class='row'>
        <div class='col-xs-12'>
            <div class='box box-primary'>  
                <div class='box-header with-border'>
                    <div class='col-md-5'>
                        <form action="<?php echo $action; ?>" method="post">
                            <div class='form-group'><strong>Customer Name :</strong>
                                <select name="customer" id="customer" class="form-control" > 
                                    <option value="">- Select Customer -</option>                               
                                    <?php                                                                        
                                    if (!empty($end_user)) {
                                        foreach ($end_user as $row) {
                                            echo "<option value='$row->id'>" . $row->company . "</option>";           
                                        }
                                    }
                                    ?>
                                </select>
                            </div>     
                            <div class='form-group'><strong>Category Name :</strong>
                                <select name="category_id" id="category_id" class="form-control" > 
                                    <option value="">- Select Category -</option>                               
                                    <?php                                                                        
                                    if (!empty($category)) {
                                        foreach ($category as $row) {
                                            echo "<option value='$row->id'>" . $row->category . "</option>";           
                                        }
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class='form-group'><strong>Equipment Category :</strong>
                                <select name="product_category_id" id="product_category_id" class="form-control" > 
                                    <option value="">- Select Equipment Category -</option>                               
                                    <?php                                                                        
                                    if (!empty($eq_category)) {
                                        foreach ($eq_category as $row) {
                                            echo "<option value='$row->id'>" . $row->product_category . "</option>";           
                                        }
                                    }
                                    ?>
                                </select>
                            </div>
                            <div class='box-footer'>
                                <input type='hidden' id='xls_param' name='xls_param' value=<?php echo $xls_param;?>>
                                <button type="submit" class="btn btn-primary" id='btn_proses' value='proses'><?php echo 'Process' ?></button>       
                                <h3 id="excel" class='box-title'><?php echo anchor(site_url('certificate_te/excel/'.$xls_param.'/'.$xls_param1.'/'.$xls_param2), ' <i class="fa fa-file-excel-o"></i> Excel', 'class="btn btn-primary btn-sm" id="xls'); ?></h3>                          
                            </div>                   
                        </form>
                    </div>                    
                </div><!-- /.box-header -->
                <div>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Customer : <strong><font color='#FF0000'><?php echo $selected_user; ?>
                </font></strong>&nbsp;&nbsp;|&nbsp;&nbsp;Category : <strong><font color='#FF0000'><?php echo $category_name; ?></font></strong>
                &nbsp;&nbsp;|&nbsp;&nbsp;Equipment Category : <strong><font color='#FF0000'><?php echo $eq_name; ?></font></strong></div>
                <div class='box-body table-responsive'>
                    <table class="table table-bordered table-striped" id="mytable">
                        <thead>
                            <tr>
                                <th width="60px">ID No</th>
                                <th>Description</th>
                                <th>Category</th>
                                <th>WLL or SWL</th>
                                <th>Service Date</th>
                                <th>Last Inspection Date</th>
                                <th>Expire Date</th>
                                <th>Details of My Test</th>                     
                                <th>Status</th>
                                <!--<th>Safe to Use</th>-->
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            if($customer){
                                //echo '<pre>';print_r($customer); //die();   
                                //<td>".$r->date_last_te."</td>
                                foreach ($customer as $r){      
                                    //if($r->date_this_te){
                                        echo "
                                        <tr>
                                        <td>".$r->serial_number."</td>
                                        <td>".$r->product_category."</td>
                                        <td>".$r->category."</td>
                                        <td>".$r->capacity.' '.$r->unit_name."</td>
                                        <td>".$r->service_date."</td>
                                        <td>".$r->last_inspection_date."</td>     
                                        <td>".$r->expire_date."</td>     
                                        <td>".$r->comment."</td>                 
                                        <td>".$r->status_name."</td>
                                        </tr>";
                                    //}
                                }
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
        //alert($('#customer').val());
        //$("#mytable").dataTable();
        $p_val = $('#xls_param').val();
        if($p_val == 0 ){
            $('#excel').hide();
        }

        var dataTable =  $('#myTable').DataTable( {
            processing:true,
            serverSide: true,
            "ajax": {
                "url": "<?php echo base_url('Certificate_te/ajax'); ?>",
                "type": "POST",
                "data":function(data) {
                    data.from = $('#customer').val();                    
                    data.<?php echo $this->security->get_csrf_token_name(); ?> = "<?php echo $this->security->get_csrf_hash(); ?>";
                },
            },
            
        } );

        $('#search').on( 'click change', function (event) {            
            var cid = $('#customer :selected').val();
            //alert('kode: ' + cid);

            event.preventDefault();

            $.ajax({
                type: "POST",
                url: "Certificate_te/hasil",
                data: { id: cid }
            }).done(function( msg ) {
                //alert( "Data Saved: " + msg );
            }); 

        } );


        $('.btn btn-primary btn-sm ').click(function() {            
            var p = $('#xls_param').val();
            alert(p);
             
        });    
        
        $("#btn_proses").click(function(){
            var pilih = $('#customer').val();
            var cat = $('#category_id').val();
            var eq = $('#product_category_id').val();
            
            if(pilih == ""){
                alert("Select customer, please!");
                return false;
            }
            if(cat == ""){
                alert("Select category, please!");
                return false;
            }
            if(eq == ""){
                alert("Select equipment category, please!");
                return false;
            }
            
            
            $('#excel').show();
        }); 
        
        $("#xls").click(function(){
            //alert('xls');
            var pilih = $('#customer').val();
            if(pilih == ""){
                alert("Select customer, please!");
                return false;
            }
        });
        
        /*$( "h3" ).click(function() {
            var pilih = $('#customer').val();
            if(pilih == ""){
                alert("Select customer, please!");
                return false;
            }else{
                alert(pilih);
                $.ajax({
            		//Alamat url harap disesuaikan dengan lokasi script pada komputer anda
            		url	     : 'certificate_te/excel',
            		type     : 'POST',
            		dataType : 'html',
            		data     : 'id='+pilih,
            		success  : function(respons){
            			//$('#pesan_kirim').html(respons);
            		},
            	})
            }
            
        });
        */

    });
</script>


