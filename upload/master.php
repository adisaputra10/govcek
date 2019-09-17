<?php 
include "koneksi.php";
include "excel_reader2.php";
?>

<?php


//// Function

function getDataTable($table,$kolom,$val,$id) {

	include "koneksi.php";
	$data = mysqli_query($koneksi,"select $id from $table where $kolom='$val' ");
	$d = mysqli_fetch_array($data);
	//print_r($d['$id']);die();
	$id_r=$d[0];
	//$data="hasil";
	return $id_r;

}



////
// upload file xls
$target = basename($_FILES['filepegawai']['name']) ;
move_uploaded_file($_FILES['filepegawai']['tmp_name'], $target);

// beri permisi agar file xls dapat di baca
chmod($_FILES['filepegawai']['name'],0777);

// mengambil isi file xls
$data = new Spreadsheet_Excel_Reader($_FILES['filepegawai']['name'],false);
// menghitung jumlah baris data yang ada
$jumlah_baris = $data->rowcount($sheet_index=0);

// jumlah default data yang berhasil di import
$berhasil = 0;
for ($i=2; $i<=$jumlah_baris; $i++){

	// menangkap data dan memasukkan ke variabel sesuai dengan kolumnya masing-masing
 
	$category = $data->val($i, 1);	
	$product_category= $data->val($i, 2);	
	$end_user	= $data->val($i, 3);
	$manufacture= $data->val($i, 4);	
	$serial	= $data->val($i, 5);
	$asset	= $data->val($i, 6);
	$service_date = $data->val($i, 7);	
	$expire_date = $data->val($i, 8);	
	$unit_system = $data->val($i, 9);
	$inspection_schedule = $data->val($i, 10);	
	$capacity = $data->val($i, 11);	
	$quick_check = $data->val($i, 12);	
	$status = $data->val($i, 13);
	$description = $data->val($i, 14);
	
	$id_category=getDataTable("category","category",$category,"id");
	$id_product_category=getDataTable("product_category","product_category",$product_category,"id");
	$id_end_user=getDataTable("end_user","company",$end_user,"id");
	$id_manufacture=getDataTable("manufacture","manufacture_name",$manufacture,"id");
	$id_unit_system=getDataTable("hp_unit","description",$unit_system,"id");
	$id_status=getDataTable("status","status_name",$status,"id");
	$id_inspection_schedule=getDataTable("inspection_schedule","inspection_name",$inspection_schedule,"id");
	$uid="1";
   
	echo "<br>category $category <br>product_category $product_category <br>end_user $end_user<br> manufacture $manufacture <br>serial $serial<br>";
	echo "asset $asset <br> service_date $service_date <br> expire_date $expire_date <br>expire_date $expire_date <br>unit_system $unit_system";
	echo "<br>inspection_schedule $inspection_schedule<br> capacity $capacity <br>quick_check $quick_check <br>status $status";

	if($category != "" && $product_category != "" && $end_user != ""){
		// input data ke database (table data_pegawai)
		$sql="INSERT INTO `mst_product` (`id`, `category_id`, `product_category_id`, `end_user_id`, `manufacture_id`, `serial_number`, `asset_number`, `service_date`, `expire_date`, `capacity`, `unit_system_id`, `inspection_schedule_id`, `quick_check_no`, `status`, `uid`,description) VALUES (NULL, '$id_category', '$id_product_category', '$id_end_user', '$id_manufacture', '$serial', '$asset', '$service_date', '$expire_date', '$capacity', '$id_unit_system', '$id_inspection_schedule', '$quick_check', '$id_status', '$uid','$description');";
		//echo "$sql";
		mysqli_query($koneksi,$sql);
		$berhasil++;
	}
}

// hapus kembali file .xls yang di upload tadi
unlink($_FILES['filepegawai']['name']);

// alihkan halaman ke index.php
//header("location:index.php?berhasil=$berhasil");
?>

