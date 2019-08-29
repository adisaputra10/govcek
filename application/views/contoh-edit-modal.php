<!DOCTYPE html>
<html>
<head>
	<title>CRUD</title>
	<link rel="stylesheet" type="text/css" href="<?php echo base_url('assets/css/bootstrap.min.css')?>">
	<script src="<?php echo base_url('assets/js/jquery-3.1.1.min.js');?>"></script>
	<script src="<?php echo base_url('assets/js/bootstrap.min.js');?>"></script>
</head>
<body>
	<div class="container">
		<h1 class="text-center">Data Orang</h1>
		<p class="text-center">Selamat Datang, <?php echo $this->session->userdata("username"); ?></p>
		<div class="form-group text-right">
			<a data-toggle="modal" data-target="#tambah-data" class="btn btn-primary">Tambah</a>
			<a class="btn btn-warning" href="<?php echo base_url('index.php/login/logout'); ?>">Logout</a>
		</div>
		<?=$this->session->flashdata('notif')?>
		<table class="table table-striped table-bordered">
			<thead>
				<tr>
					<th>No.</th>
					<th>Nama</th>
					<th>Alamat</th>
					<th>Pekerjaan</th>
					<th>Aksi</th>
				</tr>
			</thead>
			<tbody>
				<?php $no=0; foreach ($data as $dt){ ?>
				<tr>
					<td><?php echo ++$no;?></td>
					<td><?php echo $dt['nama'];?></td>
					<td><?php echo $dt['alamat'];?></td>
					<td><?php echo $dt['pekerjaan'];?></td>
					<td>
						<a 
                            href="javascript:;"
                            data-id="<?php echo $dt['id'] ?>"
                            data-nama="<?php echo $dt['nama'] ?>"
                            data-alamat="<?php echo $dt['alamat'] ?>"
                            data-pekerjaan="<?php echo $dt['pekerjaan'] ?>"
                            data-toggle="modal" data-target="#edit-data">
                            <button  data-toggle="modal" data-target="#ubah-data" class="btn btn-info">Ubah</button>
                        </a>
						<a href="#" class="btn btn-danger">Hapus</a>
					</td>
				</tr>
				<?php } ?>
			</tbody>
		</table>
	</div>
	<!-- Modal Tambah -->
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="tambah-data" class="modal fade">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
	                <h4 class="modal-title">Tambah Data</h4>
	            </div>
	            <form class="form-horizontal" action="<?php echo base_url('admin/tambah')?>" method="post" enctype="multipart/form-data" role="form">
		            <div class="modal-body">
		                    <div class="form-group">
		                        <label class="col-lg-2 col-sm-2 control-label">Nama</label>
		                        <div class="col-lg-10">
		                            <input type="text" class="form-control" name="nama" placeholder="Tuliskan Nama">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-lg-2 col-sm-2 control-label">Alamat</label>
		                        <div class="col-lg-10">
		                        	<textarea class="form-control" name="alamat" placeholder="Tuliskan Alamat"></textarea>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-lg-2 col-sm-2 control-label">Pekerjaan</label>
		                        <div class="col-lg-10">
		                            <input type="text" class="form-control" name="pekerjaan" placeholder="Tuliskan Pekerjaan">
		                        </div>
		                    </div>
		                </div>
		                <div class="modal-footer">
		                    <button class="btn btn-info" type="submit"> Simpan&nbsp;</button>
		                    <button type="button" class="btn btn-warning" data-dismiss="modal"> Batal</button>
		                </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- END Modal Tambah -->
	<!-- Modal Ubah -->
	<div aria-hidden="true" aria-labelledby="myModalLabel" role="dialog" tabindex="-1" id="edit-data" class="modal fade">
	    <div class="modal-dialog">
	        <div class="modal-content">
	            <div class="modal-header">
	                <button aria-hidden="true" data-dismiss="modal" class="close" type="button">×</button>
	                <h4 class="modal-title">Ubah Data</h4>
	            </div>
	            <form class="form-horizontal" action="<?php echo base_url('admin/ubah')?>" method="post" enctype="multipart/form-data" role="form">
		            <div class="modal-body">
		                    <div class="form-group">
		                        <label class="col-lg-2 col-sm-2 control-label">Nama</label>
		                        <div class="col-lg-10">
		                        	<input type="hidden" id="id" name="id">
		                            <input type="text" class="form-control" id="nama" name="nama" placeholder="Tuliskan Nama">
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-lg-2 col-sm-2 control-label">Alamat</label>
		                        <div class="col-lg-10">
		                        	<textarea class="form-control" id="alamat" name="alamat" placeholder="Tuliskan Alamat"></textarea>
		                        </div>
		                    </div>
		                    <div class="form-group">
		                        <label class="col-lg-2 col-sm-2 control-label">Pekerjaan</label>
		                        <div class="col-lg-10">
		                            <input type="text" class="form-control" id="pekerjaan" name="pekerjaan" placeholder="Tuliskan Pekerjaan">
		                        </div>
		                    </div>
		                </div>
		                <div class="modal-footer">
		                    <button class="btn btn-info" type="submit"> Simpan&nbsp;</button>
		                    <button type="button" class="btn btn-warning" data-dismiss="modal"> Batal</button>
		                </div>
	                </form>
	            </div>
	        </div>
	    </div>
	</div>
	<!-- END Modal Ubah -->
	<script>
	    $(document).ready(function() {
	        // Untuk sunting
	        $('#edit-data').on('show.bs.modal', function (event) {
	            var div = $(event.relatedTarget) // Tombol dimana modal di tampilkan
	            var modal          = $(this)

	            // Isi nilai pada field
	            modal.find('#id').attr("value",div.data('id'));
	            modal.find('#nama').attr("value",div.data('nama'));
	            modal.find('#alamat').html(div.data('alamat'));
	            modal.find('#pekerjaan').attr("value",div.data('pekerjaan'));
	        });
	    });
	</script>
</body>
</html>