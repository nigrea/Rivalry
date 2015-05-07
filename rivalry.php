<?php
include 'header.php';

$id = $_GET ['id'];

$rivalry = get_rivalry ( $id );

$user_one_id = $rivalry [0] ['user_one_id'];
$user_two_id = $rivalry [0] ['user_two_id'];

if($user_one_id != $_SESSION['user_id'] && $user_two_id != $_SESSION['user_id']){
	header ( "Location: profile.php" );
	die ( "Redirecting to: profile.php" );
}

update_user_stats ( $user_one_id );
update_user_stats ( $user_two_id );

$summoner_one = get_main_summoner ( $user_one_id );
$summoner_two = get_main_summoner ( $user_two_id );

$matches_one = get_table_with_inner_join ( $config_match, $config_raw_match_stats, $config_match . ".id = " . $config_raw_match_stats . ".match_id and " . $config_raw_match_stats . ".summoner_id = " . $summoner_one [0] ['api_id'] );
$matches_two = get_table_with_inner_join ( $config_match, $config_raw_match_stats, $config_match . ".id = " . $config_raw_match_stats . ".match_id and " . $config_raw_match_stats . ".summoner_id = " . $summoner_two [0] ['api_id'] );

$user_one_points = 0;
$user_two_points = 0;

$user_one_count = 0;
$user_two_count = 0;

?>

<div class="container">
	<div class="row">

		<div class="col-xs-6">
			<div class="jumbotron">
				<h1>
					<center><?php echo $summoner_one[0]['name']?></center>
				</h1>
				<div class="bs-example">
					<div class="panel-group" id="accordion">
						<div class="panel-group" id="accordion">

							<div class="panel panel-default">
								<div class="panel-heading">
									<h4 class="panel-title">
										<a data-toggle="collapse" data-parent="#accordion"
											href="#collapse<?php echo $user_one_id?>"><center><h3>Show Matches</h3></center></a>
									</h4>
								</div>
								<div id="collapse<?php echo $user_one_id?>"
									class="panel-collapse collapse">
									<div class="panel-body">
						
<?php

foreach ( $matches_one as $match ) {
	if ($match ['date'] > $rivalry [0] ['start_date'] && $match ['date'] < $rivalry [0] ['end_date']) {
		if ($match ['sub_type'] == "NORMAL" || $match ['sub_type'] == "RANKED_SOLO_5x5" || $match ['sub_type'] == "RANKED_TEAM_5x5" || $match ['sub_type'] == "CAP_5x5") {
			$result = get_match_points ( $match );
			
			html_match_generator ( $match, $result );
			
			$user_one_points = $user_one_points + $result ['total'];
			$user_one_count ++;
		}
	}
}
?>
</div>
								</div>
							</div>
						</div>
						<?php
						$user_one_points = round ( $user_one_points );
						if ($user_one_count != 0) {
							echo "<h3>Average Score: " . round ( $user_one_points / $user_one_count ) . "</h3>";
							echo "<h2>Total Score: " . $user_one_points . "</h2>";
						} else {
							echo "<h2> No Valid Games Played in Rivalry timeframe </h2>";
						}
						?>

					</div>
				</div>
			</div>
		</div>


	<div class="col-xs-6">
		<div class="jumbotron">
			<h1>
				<center><?php echo $summoner_two[0]['name']?></center>
			</h1>
			<div class="bs-example">
				<div class="panel-group" id="accordion">
					<div class="panel-group" id="accordion">

						<div class="panel panel-default">
							<div class="panel-heading">
								<h4 class="panel-title">
									<a data-toggle="collapse" data-parent="#accordion"
										href="#collapse<?php echo $user_two_id?>"><center><h3>Show Matches</h3></center></a>
								</h4>
							</div>
							<div id="collapse<?php echo $user_two_id?>"
								class="panel-collapse collapse">
								<div class="panel-body">
<?php
foreach ( $matches_two as $match ) {
	if ($match ['date'] > $rivalry [0] ['start_date'] && $match ['date'] < $rivalry [0] ['end_date']) {
		if ($match ['sub_type'] == "NORMAL" || $match ['sub_type'] == "RANKED_SOLO_5x5" || $match ['sub_type'] == "RANKED_TEAM_5x5" || $match ['sub_type'] == "CAP_5x5") {
			$result = get_match_points ( $match );
			
			html_match_generator ( $match, $result );
			
			$user_two_points = $user_two_points + $result ['total'];
			$user_two_count ++;
		}
	}
}
?>
</div>
							</div>
						</div>
					</div>
						<?php
						$user_two_points = round ( $user_two_points );
						if ($user_two_count != 0) {
							echo "<h3>Average Score: " . round ( $user_two_points / $user_two_count ) . "</h3>";
							echo "<h2>Total Score: " . $user_two_points . "</h2>";
						} else {
							echo "<h2> No Valid Games Played in Rivalry timeframe </h2>";
						}
						
						?>
						</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>