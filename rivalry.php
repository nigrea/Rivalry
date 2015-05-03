<?php
include 'header.php';

$id = $_GET ['id'];

$rivalry = get_rivalry ( $id );

$user_one_id = $rivalry [0] ['user_one_id'];
$user_two_id = $rivalry [0] ['user_two_id'];

$summoner_one = get_main_summoner ( $user_one_id );
$summoner_two = get_main_summoner ( $user_two_id );


$matches_one = get_table_with_inner_join($config_match, $config_raw_match_stats, $config_match.".id = ".$config_raw_match_stats.".match_id and ".$config_raw_match_stats.".summoner_id = ".$summoner_one[0]['api_id']);
$matches_two = get_table_with_inner_join($config_match, $config_raw_match_stats, $config_match.".id = ".$config_raw_match_stats.".match_id and ".$config_raw_match_stats.".summoner_id = ".$summoner_two[0]['api_id']);

var_dump($matches_one);

$user_one_points = 0;
$user_two_points = 0;

foreach ( $matches_one as $match ) {
	if ($match ['date'] > $rivalry [0] ['start_date'] && $match ['date'] < $rivalry [0] ['end_date']) {
		if ($match ['win'] == 1) {
			$user_one_points ++;
		} else {
			$user_one_points --;
		}
	}
}

foreach ( $matches_two as $match ) {
	if ($match ['date'] > $rivalry [0] ['start_date'] && $match ['date'] < $rivalry [0] ['end_date']) {
		if ($match ['win'] == 1) {
			$user_two_points ++;
		} else {
			$user_two_points --;
		}
	}
}

?>


<div class="jumbotron">

<?php

echo $summoner_one [0] ['name'] . " has: " . $user_one_points . " points <br>";
echo $summoner_two [0] ['name'] . " has: " . $user_two_points . " points";

?>

</div>