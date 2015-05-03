<?php
function get_summoner_by_name($name) {
	include 'config.php';
	$json = file_get_contents ( $config_api_summoner_by_name.$name."?".$config_url_api_key );
	$obj = json_decode ( $json );
	return $obj;
}
function get_summoner_rankstats($id) {
	include 'config.php';
	$json = file_get_contents ( $config_api_rankstats.$id.$config_api_season."&".$config_url_api_key );
	$obj = json_decode ( $json );
	return $obj;
}
function get_summoner_statsummary($id) {
	include 'config.php';
	$json = file_get_contents ( $config_api_rankstats.$id.$config_api_statsummary."&".$config_url_api_key );
	$obj = json_decode ( $json );
	return $obj;
}
function get_challengertier() {
	include 'config.php';
	$json = file_get_contents ( $config_api_challengertier.$config_url_api_key );
	$obj = json_decode ( $json );
	return $obj;
}

function get_leagueentry($id){
	include 'config.php';
	$json = file_get_contents($config_api_leagueentry.$id."/entry?".$config_url_api_key);
	$obj = json_decode($json);
	return $obj;
}

function save_match($game, $user_id, $summoner_id) {
	include 'config.php';
	$date = $game->createDate;
	$date = $date / 1000;
	$date = date ( 'Y-m-d H:i:s', $date );
	$match_id = $game->gameId;
	$win = $game->stats->win;
	$champion_id = $game->championId;
	$game_mode = $game->gameMode;
	$game_type = $game->gameType;
	$ip_earned = $game->ipEarned;
	$sub_type = $game->subType;

	$matches = get_table($config_match, "id ='".$match_id."'");
	
	if(empty($matches)){
		add_row ( $config_match, "id, date, game_mode, game_type, ip_earned, sub_type", "'$match_id', '$date' , '$game_mode' , '$game_type', '$ip_earned' , '$sub_type'" );
	}
	
	if(isset ($game->stats->assists)){
		$assists = $game->stats->assists;
	}else{
		$assists = 0;
	}
	 
	if(isset ($game->stats->goldEarned)){
		$gold_earned = $game->stats->goldEarned;
	}else{
		$gold_earned = 0;
	}
	
	if(isset ($game->stats->championsKilled)){
		$kills = $game->stats->championsKilled;
	}else{
		$kills = 0;
	}
	
	if(isset ($game->stats->totalDamageDealtToChampions)){
		$total_damage_to_champions = $game->stats->totalDamageDealtToChampions;
	}else{
		$total_damage_to_champions = 0;
	}		
	
	if(isset ($game->stats->minionsKilled)){
		$minions_killed = $game->stats->minionsKilled;
	}else{
		$minions_killed = 0;
	}
	
	if(isset ($game->stats->numDeaths)){
		$deaths = $game->stats->numDeaths;
	}else{
		$deaths = 0;
	}
	
	if(isset ($game->stats->wardPlaced)){
		$ward_placed = $game->stats->wardPlaced;
	}else{
		$ward_placed = 0;
	}
	
	if(isset ($game->stats->wardKilled)){
		$ward_killed = $game->stats->wardKilled;
	}else{
		$ward_killed = 0;
	}
	
	
	
	add_row( $config_raw_match_stats, "match_id, assists, gold_earned, kills, total_damage_to_champions, minions_killed, deaths, ward_placed, ward_killed, summoner_id, champion_id , win", 
			"'$match_id', '$assists', '$gold_earned', '$kills', '$total_damage_to_champions', '$minions_killed', '$deaths', '$ward_placed', '$ward_killed', '$summoner_id', '$champion_id', '$win'");
	
}

function update_user_stats($user_id) {
	include 'config.php';
	$summoner = get_summoner ( $user_id );
	$matches = get_table_with_inner_join($config_match, $config_raw_match_stats, $config_match.".id = ".$config_raw_match_stats.".match_id and ".$config_raw_match_stats.".summoner_id = ".$summoner[0]['api_id']);
	$matches_saved = count ( $matches );
	
	$json = file_get_contents ( $config_api_recent_games.$summoner [0] ['api_id']."/recent?".$config_url_api_key );
	$obj = json_decode ( $json );
	
	$games = $obj->games;
	$games = array_reverse ( $games );
	
	if ($matches_saved == 0) {
		
		foreach ( $games as $game ) {
			save_match ( $game, $user_id , $summoner [0] ['api_id']);
		}
	} else {
		$date = $matches [$matches_saved - 1] ['date'];
		$save_game_id = $matches [$matches_saved - 1] ['match_id'];
		foreach ( $games as $game ) {
			$new_date = $game->createDate;
			$new_date = $new_date / 1000;
			
			if (strtotime ( $date ) < $new_date && $save_game_id != $game->gameId) {
				save_match ( $game, $user_id , $summoner [0] ['api_id'] );
			}
		}
	}
	
}

?>