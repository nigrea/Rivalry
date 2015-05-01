<?php

function get_summoner_by_name($name){
	include 'config.php';
	$json = file_get_contents($config_api_summoner_by_name.$name."?".$config_url_api_key);
	$obj = json_decode($json);
	return $obj;
}

function get_summoner_rankstats($id){
	include 'config.php';
	$json = file_get_contents($config_api_rankstats.$id.$config_api_season."&".$config_url_api_key);
	$obj = json_decode($json);
	return $obj;
}

function get_summoner_statsummary($id){
	include 'config.php';
	$json = file_get_contents($config_api_rankstats.$id.$config_api_statsummary."&".$config_url_api_key);
	$obj = json_decode($json);
	return $obj;
}

function get_challengertier(){
	include 'config.php';
	$json = file_get_contents($config_api_challengertier.$config_url_api_key);
	$obj = json_decode($json);
	return $obj;
}
?>