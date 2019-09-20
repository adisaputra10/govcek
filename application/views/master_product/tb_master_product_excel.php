<section class='content-header'>
    <h1>
        MASTER EQUIPMENT
        <small>Upload Master Equipment Form Entry</small>
    </h1>
    <ol class='breadcrumb'>
        <li><a href='#'><i class='fa fa-suitcase'></i>Equipment</a></li>
        <li class='active'>Master Equipment Form</li>
    </ol>
</section>        
<section class='content'>    
    <div class='row'>
        <!-- left column -->
        <div class='col-md-12'>
      
          
            <div class='box box-primary'>
              <!-- general form elements -->
              <br><br>
                <div class='box-header'>
                    <div class='col-md-5'>
                       
                       <form action="../../upload/master.php"   method="post" enctype="multipart/form-data"> 
                     

                                Choose File : 
                                <input name="filepegawai" type="file" required="required"> 
                               

                              <!-- general form elements -->
                            <br>
                            
                            <div class='box-footer'> 
                               
                                <input name="upload" class="btn btn-primary" type="submit" value="Import">
                                <a href="<?php echo site_url('master_product') ?>" class="btn btn-default">Cancel</a>
                            </div>                            
                        </form>
                    </div><!-- /.box-body -->
                </div><!-- /.box -->
            </div><!-- /.col -->
        </div><!-- /.row -->
    </div>
</section><!-- /.content -->