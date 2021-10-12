<?php
	//database info
	$db_host = "localhost";
	$db_username = "phpcart";
	$db_password = "koo12992";
	$db_name = "phpcart";
	// link to  database
	$db_link = @new mysqli($db_host, $db_username, $db_password, $db_name);
	//debug
	if ($db_link->connect_error != "") {
		echo "資料庫連結失敗！";
	}else{
		//設定字元集與編碼
		$db_link->query("SET NAMES 'utf8'");
	}
?>