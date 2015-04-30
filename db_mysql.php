<?php
$server_var = $_SERVER['SERVER_NAME'];

if($server_var == "127.0.0.1" || $server_var == "localhost"){
	@$mysql_open = mysql_connect('localhost', 'root', '')or die('Could not connect: ' . mysql_error());
	mysql_select_db('rivalry') or die('Could not select database - should be on Localhost');
} 
?>