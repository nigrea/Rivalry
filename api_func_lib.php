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
function update_user_stats($user_id) {
	include 'config.php';
	$summoner = get_summoner ( $user_id );
	$matches = get_table ( $config_match, "user_id = $user_id" );
	$matches_saved = count ( $matches );
	
	$json = file_get_contents ( $config_api_recent_games.$summoner [0] ['api_id']."/recent?".$config_url_api_key );
	$obj = json_decode ( $json );
	
	$games = $obj->games;
	$games = array_reverse ( $games );
	
	if ($matches_saved == 0) {
		
		foreach ( $games as $game ) {			
			$new_date = $game->createDate;
			$new_date = $new_date / 1000;
			
			$match_id = $game->gameId;
			$new_date = date ( 'Y-m-d H:i:s', $new_date );
			$win = $game->stats->win;
			
			add_row ( $config_match, "match_id, date, win, user_id", "'$match_id', '$new_date' , '$win', '$user_id'" );
		}
	} else {
		
		$date = $matches [$matches_saved - 1] ['date'];
		$save_game_id = $matches [$matches_saved - 1] ['match_id'];
		
		foreach ( $games as $game ) {
			$new_date = $game->createDate;
			$new_date = $new_date / 1000;
			
			if (strtotime ( $date ) < $new_date && $save_game_id != $game->gameId) {
				
				$match_id = $game->gameId;
				$new_date = date ( 'Y-m-d H:i:s', $new_date );
				$win = $game->stats->win;
				
				add_row ( $config_match, "match_id, date, win, user_id", "'$match_id', '$new_date' , '$win', '$user_id'" );
			}
		}
	}
}

?>