
<?php
include 'header.php';

$id_one = $_SESSION ['user_id'];

if (isset ( $_POST ['submit'] )) {	
	
	$sub_types = implode ( ",", $_POST ['game_types'] );
	
	if($_POST['startDate'] != ""){
		$start_time = strtotime($_POST['startDate']);
	}else{
		$start_time = strtotime(date ( 'Y-m-d H:i:s' ));
	}
	
	if($_POST['endDate'] != ""){
		$end_time = strtotime($_POST['endDate']);
	}else{
		$end_time = strtotime ( "+2 weeks" , $start_time);
	}

	$start_time = date('Y-m-d h:i:s',$start_time);
	$end_time = date('Y-m-d h:i:s',$end_time);
	
	$summoner_name = $_POST ['leagueName'];
	
	$challanged_user = get_user_by_summoner ( $summoner_name );
	
	$id_two = $challanged_user [0] ['id'];
	
	add_row ( $config_challange, "user_one_id , user_two_id , accepted , sub_types , start_date , end_date", "'$id_one','$id_two',0,'$sub_types','$start_time','$end_time'" );
	
	header ( "Location: profile.php" );
	die ( "Redirecting to: profile.php" );
}

if (isset ( $_POST ['accept'] )) {
	$id = $_GET ['id'];
	update_table ( $config_challange, 'accepted = 1', 'id = "' . $id . '"' );
	$challange = get_challange ( $id );
	$id_one = $challange [0] ['user_one_id'];
	$id_two = $challange [0] ['user_two_id'];
	$sub_types = $challange [0] ['sub_types'];
	$start_time = $challange [0] ['start_date'];
	$end_time = $challange [0] ['end_date'];
	
	
	add_row ( $config_rivalry, "user_one_id , user_two_id , start_date , end_date, sub_types", "'$id_one','$id_two','$start_time','$end_time', '$sub_types'" );
}

if (isset ( $_POST ['decline'] )) {
	$id = $_GET ['id'];
	delete_row ( $config_challange, 'id = "' . $id . '"' );
}

$received_challanges = get_table ( $config_challange, "user_two_id ='" . $id_one . "' AND accepted = 0" );
$send_challanges = get_table ( $config_challange, "user_one_id ='" . $id_one . "' AND accepted = 0" );

$rivalrys = array_merge ( get_table ( $config_rivalry, "user_one_id ='" . $id_one . "'" ), get_table ( $config_rivalry, "user_two_id ='" . $id_one . "'" ) );
?>

<div class="jumbotron">

	<div class="container">

		<form class="form-signin" role="form" method="post"
			action="challange.php">
			<h2 class="form-signin-heading">Challange someone!</h2>




			<label class="checkbox-inline"> <input type="checkbox" value="NONE"
				name='game_types[]'>Custom games
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name='game_types[]' value="NORMAL">Normal
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name='game_types[]' value="BOT">Coop vs AI
			</label> <label class="checkbox-inline"> <input type="checkbox"
				name='game_types[]' value="RANKED_SOLO_5x5">Ranked Solo Queue
			</label><label class="checkbox-inline"> <input type="checkbox"
				name='game_types[]' value="CAP_5x5">Team Builder
			</label><label for="leagueName" class="sr-only">Main League Account</label>
			<input type="text" id="leagueName" name="leagueName"
				class="form-control" placeholder="Main League Account" required
				autofocus> <input type="text" id="startDate" name="startDate"
				class="form-control" placeholder="Start Date"> <input type="text"
				id="endDate" name="endDate" class="form-control"
				placeholder="End Date">
			<button class="btn btn-lg btn-primary btn-block" type="submit"
				name="submit">Challange</button>
		</form>

	</div>

</div>

<div class="row">

	<div class="col-xs-6">
		<div class="jumbotron">

			<h2>Received Challanges</h2>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Name</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
				<?php
				foreach ( $received_challanges as $challange ) {
					
					$user_one_id = $challange ['user_one_id'];
					$user_two_id = $challange ['user_two_id'];
					
					$user_one = get_table ( $config_summoner, "user_id ='" . $user_one_id . "'" );
					$user_two = get_table ( $config_summoner, "user_id ='" . $user_two_id . "'" );
					
					?>
					<tr>
							<td><?php print $user_one[0]['name']."   vs   ".$user_two[0]['name']; ?></td>
							<td><form class="form-signin" role="form" method="post"
									action="challange.php<?php print "?id=".$challange['id'];?>">
									<button class="btn btn-lg btn-primary btn-block" type="submit"
										name="accept">Accept</button>
								</form></td>
							<td><form class="form-signin" role="form" method="post"
									action="challange.php<?php print "?id=".$challange['id'];?>">
									<button class="btn btn-lg btn-primary btn-block" type="submit"
										name="decline">Decline</button>
								</form></td>
						</tr>
					<?php
				}
				?>										
			</tbody>
				</table>
			</div>
		</div>
	</div>
	<div class="col-xs-6">
		<div class="jumbotron">

			<h2>Active rivalrys</h2>
			<div class="table-responsive">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>Name</th>
							<th></th>
						</tr>
					</thead>
					<tbody>
				<?php
				foreach ( $rivalrys as $rivalry ) {
					
					$user_one_id = $rivalry ['user_one_id'];
					$user_two_id = $rivalry ['user_two_id'];
					
					$user_one = get_table ( $config_summoner, "user_id ='" . $user_one_id . "'" );
					$user_two = get_table ( $config_summoner, "user_id ='" . $user_two_id . "'" );
					
					?>
					<tr>
							<td><?php print $user_one[0]['name']."   vs   ".$user_two[0]['name']; ?></td>
							<td><form class="form-signin" role="form" method="post"
									action="rivalry.php<?php print "?id=".$rivalry['id'];?>">
									<button class="btn btn-lg btn-primary btn-block" type="submit"
										name="accept">View</button>
								</form></td>
						</tr>
					<?php
				}
				?>										
			</tbody>
				</table>
			</div>
		</div>




	</div>
</div>


