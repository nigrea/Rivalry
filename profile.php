<?php
include 'header.php';
update_user_stats ( $_SESSION ['user_id'] );

?>

<div class="jumbotron">
	<h1><?php print $_SESSION['main_summoner_name']?></h1>
	

	<?php
	print $_SESSION ['user_id'];
	$summoner = get_summoner_by_name ( $_SESSION ['main_summoner_name'] );
	$lower_case_name = strtolower ( $_SESSION ['main_summoner_name'] );
	$rankstats = get_summoner_rankstats ( $_SESSION ['main_summoner_api_id'] );
	$statssummary = get_summoner_statsummary ( $_SESSION ['main_summoner_api_id'] );
	$challengertier = get_challengertier ();
	$leagueentry = get_leagueentry ( $_SESSION ['main_summoner_api_id'] );
	$id = strval ( $_SESSION ['main_summoner_api_id'] );
	?>
	
	<p>
		<img
			src=<?php print $config_image_summoner_icon.$summoner->$lower_case_name->profileIconId.".png" ?>>
	</p>
	
	
	<?php
	$id = strval ( $_SESSION ['main_summoner_api_id'] );
	
	for($i = 0; $i < count ( $statssummary->playerStatSummaries ); $i ++) {
		if ($statssummary->playerStatSummaries [$i]->playerStatSummaryType == 'RankedSolo5x5') {
			$wins = ($statssummary->playerStatSummaries [$i]->wins);
			$losses = ($statssummary->playerStatSummaries [$i]->losses);
		} elseif ($i == count ( $statssummary->playerStatSummaries ) && $statssummary->playerStatSummaries [$i]->playerStatSummaryType == 'RankedSolo5x5') {
			$wins = 'Null';
		}
	}
	
	$tier = "nope";
	
	foreach ($leagueentry->$id as $entry){
		if ($entry->queue == 'RANKED_SOLO_5x5') {
			$tier = ($entry ->tier);
		} 
	}
	
	
	
	?>
	
	
	<h3><?php
	print "Ranked Wins: $wins";
	?></h3>
	<h3><?php
	print "Ranked Losses: $losses";
	?></h3>
	<p><?php
	
	var_dump ( $summoner );
	var_dump ( $rankstats );
	var_dump ( $statssummary );
	var_dump ( $leagueentry );
	var_dump($tier);
	?></p>



</div>
</div>