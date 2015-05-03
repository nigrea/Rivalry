<?php
include 'header.php';
function html_match_generator($match, $result) {
	include 'config.php';
	$champion_id = $match ['champion_id'];
	$champion = get_table ( $config_champion, "id = " . $champion_id . "" );
	if($match ['win'] == 1){
		$match_win_string = "True";
	}else{
		$match_win_string = "False";
	}
	
	$duration = gmdate("H:i:s", $match['time_played']);
	
	?>
<div class="panel panel-default">
	<div  class="panel-heading">
		<h4 class="panel-title">
			<a data-toggle="collapse" data-parent="#accordion"
				href="#collapse<?php echo $match['id']?>"><h3><?php echo $champion[0]['name'].":      ".round ( $result['total'] )?></h3></a>
		</h4>
	</div>
	<div id="collapse<?php echo $match['id']?>"
		class="panel-collapse collapse">
		<div class="panel-body">
		
		<h3> Game Duration: <?php echo $duration;?></h3>
		
			<table class="table table-striped">
				<tr>
					<th>Source</th>
					<th>Number</th>
					<th>Points</th>
				</tr>
				<tr>
					<td>Win</td>
					<td><?php echo $match_win_string?></td>
					<td><?php echo $result ['win']?></td>
				</tr>
				<tr>
					<td>Kills</td>
					<td><?php echo $match ['kills']?></td>
					<td><?php echo round ( $result ['kills'] )?></td>
				</tr>
				<tr>
					<td>Assists</td>
					<td><?php echo $match ['assists']?></td>
					<td><?php echo round ( $result ['assists'] )?></td>
				</tr>
				<tr>
					<td>Deaths</td>
					<td><?php echo $match ['deaths']?></td>
					<td><?php echo round ( $result ['deaths'] )?></td>
				</tr>
				<tr>
					<td>CS</td>
					<td><?php echo $match ['minions_killed']?></td>
					<td><?php echo round ( $result ['minions'] )?></td>
				</tr>
				<tr>
					<td>Total Damage to	Champions</td>
					<td><?php echo $match ['total_damage_to_champions']?></td>
					<td><?php echo round ( $result ['damage_to_champions'] )?></td>
				</tr>
				<tr>
					<td>Wards Placed</td>
					<td><?php echo $match ['ward_placed']?></td>
					<td><?php echo round ( $result ['ward_placed'] )?></td>
				</tr>
				<tr>
					<td>Ward Killed</td>
					<td><?php echo $match ['ward_killed']?></td>
					<td><?php echo round ( $result ['ward_killed'] )?></td>
				</tr>
			</table>

		</div>
	</div>
</div>

<?php
}

$id = $_GET ['id'];

$rivalry = get_rivalry ( $id );

$user_one_id = $rivalry [0] ['user_one_id'];
$user_two_id = $rivalry [0] ['user_two_id'];

$summoner_one = get_main_summoner ( $user_one_id );
$summoner_two = get_main_summoner ( $user_two_id );

$matches_one = get_table_with_inner_join ( $config_match, $config_raw_match_stats, $config_match . ".id = " . $config_raw_match_stats . ".match_id and " . $config_raw_match_stats . ".summoner_id = " . $summoner_one [0] ['api_id'] );
$matches_two = get_table_with_inner_join ( $config_match, $config_raw_match_stats, $config_match . ".id = " . $config_raw_match_stats . ".match_id and " . $config_raw_match_stats . ".summoner_id = " . $summoner_two [0] ['api_id'] );

$user_one_points = 0;
$user_two_points = 0;

?>

<div class="jumbotron">
	<h1><?php echo $summoner_one[0]['name']?></h1>
	<div class="bs-example">
		<div class="panel-group" id="accordion">
<?php

foreach ( $matches_one as $match ) {
	if ($match ['date'] > $rivalry [0] ['start_date'] && $match ['date'] < $rivalry [0] ['end_date']) {
		$result = get_match_points ( $match );
		
		html_match_generator ( $match, $result );
		
		$user_one_points = $user_one_points + $result ['total'];
	}
}
$user_one_points = round ( $user_one_points );
echo "<h2>Total Score: " . $user_one_points . "</h2>";
?>
		</div>
	</div>
</div>

<div class="jumbotron">
	<h1><?php echo $summoner_two[0]['name']?></h1>
	<div class="bs-example">
		<div class="panel-group" id="accordion">
<?php
foreach ( $matches_two as $match ) {
	if ($match ['date'] > $rivalry [0] ['start_date'] && $match ['date'] < $rivalry [0] ['end_date']) {
		$result = get_match_points ( $match );
		
		html_match_generator ( $match, $result );
		
		$user_two_points = $user_two_points + $result ['total'];
	}
}

$user_two_points = round ( $user_two_points );
echo "<h2>Total Score: " . $user_two_points . "</h2>";

?>

</div>
	</div>
</div>

