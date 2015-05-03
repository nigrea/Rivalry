<?php
include 'header.php';
function html_match_generator($match, $result) {
	?>
<div class="panel panel-default">
	<div class="panel-heading">
		<h4 class="panel-title">
			<a data-toggle="collapse" data-parent="#accordion"
				href="#collapse<?php echo $match['id']?>"><?php echo round ( $result['total'] )?></a>
		</h4>
	</div>
	<div id="collapse<?php echo $match['id']?>"
		class="panel-collapse collapse">
		<div class="panel-body">
			<p>
								<?php
	
	echo "Win: " . $result ['win'] . "<br>
											Kills: " . round ( $result ['kills'] ) . "<br>
											Assists: " . round ( $result ['assists'] ) . "<br>
											Deaths: " . round ( $result ['deaths'] ) . "<br>
											CS: " . round ( $result ['minions'] ) . "<br>
											Total Damage to Champions: " . round ( $result ['damage_to_champions'] ) . "<br>
											Wards Placed: " . round ( $result ['ward_placed'] ) . "<br>
											Ward Killed " . round ( $result ['ward_killed'] ) . "<br>"?>
							</p>
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
echo $user_one_points;
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
echo $user_two_points;
?>

</div>
	</div>
</div>

