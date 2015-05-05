<?php
include 'header.php';

$id_one = $_SESSION ['user_id'];

if (isset ( $_POST ['submit'] )) {
	
	$summoner_name = $_POST ['leagueName'];
	
	$challanged_user = get_user_by_summoner ( $summoner_name );
	
	$id_two = $challanged_user [0] ['id'];
	
	add_row ( $config_challange, "user_one_id , user_two_id , accepted", "'$id_one','$id_two',0" );
	
	header ( "Location: profile.php" );
	die ( "Redirecting to: profile.php" );
}

if (isset ( $_POST ['accept'] )) {
	$id = $_GET ['id'];
	update_table ( $config_challange, 'accepted = 1', 'id = "' . $id . '"' );
	$challange = get_challange ( $id );
	$id_one = $challange [0] ['user_one_id'];
	$id_two = $challange [0] ['user_two_id'];
	$start_time = date ( 'Y-m-d H:i:s' );
	$end_time = date ( 'Y-m-d H:i:s', strtotime ( "+2 weeks" ) );
	
	add_row ( $config_rivalry, "user_one_id , user_two_id , start_date , end_date", "'$id_one','$id_two','$start_time','$end_time'" );
}

if (isset ( $_POST ['decline'] )) {
	$id = $_GET ['id'];
	delete_row($config_challange, 'id = "' . $id . '"');
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
			<label for="leagueName" class="sr-only">Main League Account</label> <input
				type="text" id="leagueName" name="leagueName" class="form-control"
				placeholder="Main League Account" required autofocus>
			<button class="btn btn-lg btn-primary btn-block" type="submit"
				name="submit">Challange</button>
		</form>

	</div>

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

	<div>
		<h3>Received Challanges</h3>
		<?php var_dump ( $received_challanges );?>
		<h3>Send Challanges</h3>
		<?php var_dump ( $send_challanges );?>
		<h3>Rivalrys</h3>
		<?php var_dump($rivalrys);?>
	</div>

</div>
</div>