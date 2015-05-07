<?php

function html_match_generator($match, $result) {
	include 'config.php';
	$champion_id = $match ['champion_id'];
	$champion = get_table ( $config_champion, "id = " . $champion_id . "" );
	if($match ['win'] == 1){
		$match_win_string = "True";
	}else{
		$match_win_string = "False";
	}

	$type = "None";
	
	switch ($match['sub_type']) {
		case "CAP_5x5":
			$type = "Team Builder";
			break;
		case "RANKED_SOLO_5x5":
			$type = "Ranked Solo";
			break;
		case "NORMAL":
			$type = "Normal";
			break;
	}
	
	$duration = gmdate("H:i:s", $match['time_played']);

	?>
<div class="panel panel-default">
	<div  class="panel-heading">
		<h4 class="panel-title">
			<a data-toggle="collapse" data-parent="#accordion"
				href="#collapse<?php echo $match['id']?>"><h3><img
			src=<?php print $config_image_champ_square.$champion[0]['name'].".png"  ?> height="42" width="42">  <?php echo $champion[0]['name'].":      ".round ( $result['total'] )."  (". $type.")" ;?></h3></a>
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

function html_match_list_generator($match, $result) {
	
	
}


?>