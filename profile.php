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
	?>
	
	<p><img src=<?php print $config_image_summoner_icon.$summoner->$lower_case_name->profileIconId.".png" ?>></p>
	
	<h2>
	
	<?php 
	$wins = ( $statssummary->playerStatSummaries[8]->wins);
	print "Ranked Wins: $wins";
		?>
	</h2>
	
	<p><?php
	
	var_dump ( $summoner );
	var_dump ( $rankstats );
	var_dump ( $statssummary->playerStatSummaries[8]);

	?></p>
	


</div>
</div>