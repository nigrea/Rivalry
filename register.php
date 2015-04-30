
<?php
@session_destroy ();
session_unset ();
session_start ();
$_SESSION ['loggedin'] = false;

include 'db_mysql.php';
include 'config.php';
include 'func_lib.php';
include 'api_func_lib.php';

if (isset ( $_POST ['submit'] )) {
	$email = $_POST ['inputEmail'];
	$password = $_POST ['inputPassword'];
	$leagueName = $_POST ['leagueName'];
	
	add_row ( $config_user, "email, password", "'$email','$password'" );
	
	$login_arr = get_table ( $config_user, "email = '$email' AND password = '$password'" );
	
	if (@$login_arr [0] ['email'] == $email && @$login_arr [0] ['password'] == $password) {
		$user_id = $login_arr [0] ['id'];
		
		$_SESSION ['user_id'] = $user_id;
		$_SESSION ['user_loggedin'] = "1";
		
		
		$summoner = get_summoner_by_name ( $leagueName );
		$lower_case_name = strtolower ( $leagueName );
		
		$main_summoner_api_id = $summoner->$lower_case_name->id;
		
		$_SESSION ['main_summoner_name'] = $lower_case_name;
		$_SESSION ['main_summoner_api_id'] = $main_summoner_api_id;
		
		add_row ( $config_summoner, "name, api_id, user_id, main", "'$lower_case_name','$main_summoner_api_id', '$user_id' , 1" );
		
		if (@$_SESSION ['user_loggedin']) {
			header ( "Location: profile.php" );
			die ( "Redirecting to: profile.php" );
		}
	}
}
?>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="../../favicon.ico">

<title>Signin Template for Bootstrap</title>

<!-- Bootstrap core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/signin.css" rel="stylesheet">

</head>

<body>


	<div class="container">

		<form class="form-signin" role="form" method="post"
			action="register.php">
			<h2 class="form-signin-heading">Please sign init</h2>
			<label for="inputEmail" class="sr-only">Email address</label> <input
				type="email" id="inputEmail" name="inputEmail" class="form-control"
				placeholder="Email address" required autofocus> <label
				for="inputPassword" class="sr-only">Password</label> <input
				type="password" id="inputPassword" name="inputPassword"
				class="form-control" placeholder="Password" required> <label
				for="leagueName" class="sr-only">League Name</label> <input
				type="text" id="leagueName" name="leagueName" class="form-control"
				placeholder="League Name" required>
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me"> Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit"
				name="submit">Register</button>
		</form>


	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>

