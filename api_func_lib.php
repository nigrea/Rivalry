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

function update_user_stats($user_id){
	include 'config.php';
	$summoner = get_summoner($user_id);
	$matches = get_table($config_match, 'user_id = "'.$user_id.'"');
	$matches_saved = count($matches);
	$date = $matches[$matches_saved-1]['date'];

	$json = file_get_contents($config_api_summoner_by_name.$name.$config_url_api_key);
	https://na.api.pvp.net/api/lol/na/v1.3/game/by-summoner/24570013/recent?api_key=52e4e3eb-5dd4-4d67-9f6f-df9cb2d78d15
}

?>