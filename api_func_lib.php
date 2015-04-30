<?php

function get_summoner_by_name($name){
	include 'config.php';
	$json = file_get_contents($config_api_summoner_by_name.$name.$config_url_api_key);
	$obj = json_decode($json);
	return $obj;
}

?>