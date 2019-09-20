<?php 
include "koneksi.php";
include "excel_reader2.php";
?>

<?php


//// Function

function getDataTable($table,$kolom,$val,$id) {

	include "koneksi.php";
	$data = mysqli_query($koneksi,"select $id from $table where $kolom like '$val' ");
	//echo "select $id from $table where $kolom='$val'";
	$d = mysqli_fetch_array($data);
	//print_r($d['$id']);die();
	$id_r=$d[0];
	//$data="hasil";
	return $id_r;

}

$csvMimes = array('text/x-comma-separated-values', 'text/comma-separated-values', 'application/octet-stream', 'application/vnd.ms-excel', 'application/x-csv', 'text/x-csv', 'text/csv', 'application/csv', 'application/excel', 'application/vnd.msexcel', 'text/plain');


if(!empty($_FILES['filepegawai']['name']) && in_array($_FILES['filepegawai']['type'], $csvMimes)){
        
	// If the file is uploaded
	if(is_uploaded_file($_FILES['filepegawai']['tmp_name'])){
		
		// Open uploaded CSV file with read-only mode
		$csvFile = fopen($_FILES['filepegawai']['tmp_name'], 'r');
		
		// Skip the first line
		fgetcsv($csvFile);
		
		// Parse data from CSV file line by line
		while(($line = fgetcsv($csvFile)) !== FALSE){
			// Get row data
		 


			$category = $line[0];	
			$product_category= $line[1];
			$end_user	= $line[2];
			$manufacture= $line[3];	
			$serial	= $line[4];
			$asset	= $line[5];
			$service_date = $line[6];	
			$expire_date = $line[7];if(empty($expire_date)){ $expire_date="0000-00-00"; }	
			$unit_system = $line[8];
			$inspection_schedule = $line[9]	;
			$capacity = $line[10];	
			$quick_check = $line[11];	
			$status = $line[12];
			$description = $line[13];

			echo "$category $product_category $end_user $manufacture $status";
			
			$id_category=getDataTable("category","category",$category,"id");
			$id_product_category=getDataTable("product_category","product_category",$product_category,"id");
			$id_end_user=getDataTable("end_user","company",$end_user,"id");
			$id_manufacture=getDataTable("manufacture","manufacture_name",$manufacture,"id");
			$id_unit_system=getDataTable("hp_unit","description",$unit_system,"id");
			$id_status=getDataTable("status","status_name",$status,"id");
			$id_inspection_schedule=getDataTable("inspection_schedule","inspection_name",$inspection_schedule,"id");
			$uid="1";




			//echo "$name $email $phone $name1 $email1 $phone1 $name2 $email2 $phone2";



			if($category != "" && $product_category != "" && $end_user != ""){
				// input data ke database (table data_pegawai)
				$sql="INSERT INTO `mst_product` (`id`, `category_id`, `product_category_id`, `end_user_id`, `manufacture_id`, `serial_number`, `asset_number`, `service_date`, `expire_date`, `capacity`, `unit_system_id`, `inspection_schedule_id`, `quick_check_no`, `status`, `uid`,description) VALUES (NULL, '$id_category', '$id_product_category', '$id_end_user', '$id_manufacture', '$serial', '$asset', '$service_date', '$expire_date', '$capacity', '$id_unit_system', '$id_inspection_schedule', '$quick_check', '$id_status', '$uid','$description');";
				echo "$sql $id_unit_system $unit_system,<br> ";
				mysqli_query($koneksi,$sql);
				//$berhasil++;
			}



		}

	}

}













 
?>


<script type="text/javascript">
 
 
    window.location = "../index.php/master_product";
 
  </script>