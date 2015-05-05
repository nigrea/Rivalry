<?php
include 'header.php';


$id = $_GET ['id'];

$rivalry = get_rivalry ( $id );

$user_one_id = $rivalry [0] ['user_one_id'];
$user_two_id = $rivalry [0] ['user_two_id'];

update_user_stats ( $user_one_id );
update_user_stats ( $user_two_id );


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

