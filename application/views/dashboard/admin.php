<section class="content-header">
    <h1>
        Dashboard
        <small>Admin</small>
    </h1>
    <ol class="breadcrumb">
        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
        <li class="active">Dashboard</li>
    </ol>
</section>
<!-- Main content -->
<section class="content">
    <!-- Small boxes (Stat box) -->
    <div class="row">
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-aqua">
                <div class="inner">
                    <h3>
                        <?php
                        foreach ($manufacture as $r) {
                            echo $r->count_manufacture;
                        }
                        ?>
                    </h3>
                    <p>Total Equipment</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <!-- <a href="<?php echo base_url('manufacture'); ?>" class="small-box-footer">More Detail <i class="fa fa-arrow-circle-right"></i></a> -->
            </div>
        </div><!-- ./col -->
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-red">
                <div class="inner">
                    <h3>
                        
                    </h3>
                    <p>Inspection Request</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <a href="<?php echo base_url('inspection_task'); ?>" class="small-box-footer">More Detail <i class="fa fa-arrow-circle-right"></i></a>
            </div>
        </div>            
         <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>
                        <?php
                        foreach ($valid as $r) {
                            echo $r->total_valid;
                        }
                        ?>
                    </h3>
                    <p>List Valid Status</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <!-- <a href="<?php echo base_url('product_category'); ?>" class="small-box-footer">More Detail <i class="fa fa-arrow-circle-right"></i></a> -->
            </div>
        </div>
        
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>
                        <?php
                        foreach ($out_of_service as $r) {
                            echo $r->total;
                        }
                        ?>
                    </h3>
                    <p>OUT OF SERVICE</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <!-- <a href="<?php echo base_url('product_category'); ?>" class="small-box-footer">More Detail <i class="fa fa-arrow-circle-right"></i></a> -->
            </div>
        </div>
        
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>
                        <?php
                        foreach ($not_found as $r) {
                            echo $r->total;
                        }
                        ?>
                    </h3>
                    <p>NOT FOUND</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <!-- <a href="<?php echo base_url('product_category'); ?>" class="small-box-footer">More Detail <i class="fa fa-arrow-circle-right"></i></a> -->
            </div>
        </div>
        
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>
                        <?php
                        foreach ($no_defect as $r) {
                            echo $r->total;
                        }
                        ?>
                    </h3>
                    <p>NO DEFECT</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <!-- <a href="<?php echo base_url('product_category'); ?>" class="small-box-footer">More Detail <i class="fa fa-arrow-circle-right"></i></a> -->
            </div>
        </div>
        
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>
                        <?php
                        foreach ($discard as $r) {
                            echo $r->total;
                        }
                        ?>
                    </h3>
                    <p>DISCARD</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <!-- <a href="<?php echo base_url('product_category'); ?>" class="small-box-footer">More Detail <i class="fa fa-arrow-circle-right"></i></a> -->
            </div>
        </div>
        
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>
                        <?php
                        foreach ($repair as $r) {
                            echo $r->total;
                        }
                        ?>
                    </h3>
                    <p>REPAIR</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <!-- <a href="<?php echo base_url('product_category'); ?>" class="small-box-footer">More Detail <i class="fa fa-arrow-circle-right"></i></a> -->
            </div>
        </div>
        
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>
                        <?php
                        foreach ($expired as $r) {
                            echo $r->total;
                        }
                        ?>
                    </h3>
                    <p>EXPIRE</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <!-- <a href="<?php echo base_url('product_category'); ?>" class="small-box-footer">More Detail <i class="fa fa-arrow-circle-right"></i></a> -->
            </div>
        </div>
        
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3>
                        <?php
                        foreach ($due as $r) {
                            echo $r->total;
                        }
                        ?>
                    </h3>
                    <p>DUE</p>
                </div>
                <div class="icon">
                    <i class="ion ion-bag"></i>
                </div>
                <!-- <a href="<?php echo base_url('product_category'); ?>" class="small-box-footer">More Detail <i class="fa fa-arrow-circle-right"></i></a> -->
            </div>
        </div>
        
        <div class="col-lg-3 col-xs-6">
            <!-- small box -->
            <div class="small-box bg-green">
                <div class="inner">
                    <h3> 
                        <?php
                        foreach ($unsafe as $r) {
                            echo $r->total_unsafe;
                        }
                        ?>
                    </h3> 
                    <p>List Unsafe</p>
                </div>
                <div class="icon">
                    <i class="ion ion-person-add"></i>
                </div>
                <!-- <a href="<?php echo base_url('end_user'); ?>" class="small-box-footer">More Deatail <i class="fa fa-arrow-circle-right"></i></a> -->
            </div>
        </div><!-- ./col -->

    </div><!-- /.row -->

    <!-- Left col -->
    <div class="box box-info">
        <div class="box-header with-border">
            <!--<h3 class="box-title">Transaksi Terakhir</h3>-->

            <div class="box-tools pull-right">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
                <button type="button" class="btn btn-box-tool" data-widget="remove"><i class="fa fa-times"></i></button>
            </div>
        </div>
        <!-- /.box-header -->
        <div class="box-body">
            <div class="table-responsive">
                
            </div>
            <!-- /.table-responsive -->
        </div>
        <!-- /.box-body -->
        <div class="box-footer clearfix">
            <!--<a href="<?php //echo site_url('transaksi/create'); ?>" class="btn btn-sm btn-info btn-flat pull-left">Tambah Transaksi Baru</a>
            <a href="<?php //echo site_url('transaksi'); ?>" class="btn btn-sm btn-default btn-flat pull-right">Lihat Semua Transaksi</a>
            -->
        </div>

    </div>
    <!--
    <div style="padding: 10px 0px; text-align: center;">
            <div class="text">Excuse the ads! We need some help to keep our site up.</div>
            <script async src="//pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
               
                <ins class="adsbygoogle"
                     style="display:block"
                     data-ad-client="ca-pub-5746089618495474"
                     data-ad-slot="6145123342"
                     data-ad-format="auto"></ins>
                <script>
                (adsbygoogle = window.adsbygoogle || []).push({});
                </script>
    </div>
    -->
</section>