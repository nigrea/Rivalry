<?php
include 'header.php';
update_user_stats($_SESSION['user_id']);

?>

<div class="jumbotron">
	<h1><?php print $_SESSION['main_summoner_name']?></h1>
	

	<?php 
	print $_SESSION ['user_id'];
	$summoner = get_summoner_by_name ( $_SESSION['main_summoner_name'] );
	$lower_case_name = strtolower($_SESSION['main_summoner_name']);
	$rankstats = get_summoner_rankstats($_SESSION ['main_summoner_api_id']);
	$statssummary = get_summoner_statsummary($_SESSION ['main_summoner_api_id']);
	$challengertier = get_challengertier();
	$leagueentry = get_leagueentry($_SESSION ['main_summoner_api_id']);
	$id = strval($_SESSION ['main_summoner_api_id']);
	?>
	
	<p><img src=<?php print $config_image_summoner_icon.$summoner->$lower_case_name->profileIconId.".png" ?>></p>
	
	
	<?php
	$id = strval($_SESSION ['main_summoner_api_id']);
	
	for($i = 0; $i < count($statssummary->playerStatSummaries); $i++){
		if($statssummary->playerStatSummaries[$i]->playerStatSummaryType == 'RankedSolo5x5'){
			$wins = ( $statssummary->playerStatSummaries[$i]->wins);
			$losses = ( $statssummary->playerStatSummaries[$i]->losses);
		}
		elseif($i == count($statssummary->playerStatSummaries) && $statssummary->playerStatSummaries[$i]->playerStatSummaryType == 'RankedSolo5x5'){
			$wins = 'Null';			
		}	
			}
	for($j = 0; $j < count($leagueentry->$id); $j++){
		if($leagueentry->$id[$j]->queue == 'RankedSolo5x5'){
			$tier = ($leagueentry->$id[$j]->tier);
		}
		elseif($i == count($leagueentry->$id) && $leagueentry->$id[$j]->queue == 'RankedSolo5x5'){
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
	
	var_dump ($summoner);
	var_dump ($rankstats);
	var_dump ($statssummary);
	var_dump($leagueentry);
	?></p>
	


</div>
</div>