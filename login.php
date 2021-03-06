
<?php
@session_destroy ();
session_unset ();
session_start ();
$_SESSION ['loggedin'] = false;

include 'db_mysql.php';
include 'config.php';
include 'func_lib.php';

if (isset ( $_POST ['submit'] )) {
	$email = $_POST ['inputEmail'];
	$password = $_POST ['inputPassword'];
	$safe_password = md5($password.$config_salt);
	$login_arr = get_table ( $config_user, "email = '$email' AND password = '$safe_password'" );
	if (@$login_arr [0] ['email'] == $email && @$login_arr [0] ['password'] == $safe_password) {
		$_SESSION ['user_id'] = $login_arr [0] ['id'];
		$_SESSION ['user_loggedin'] = "1";
		$summoner = get_main_summoner($login_arr [0] ['id']);
		$_SESSION ['main_summoner_name'] = $summoner [0] ['name'];
		$_SESSION ['main_summoner_api_id'] = $summoner [0] ['api_id'];
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

		<form class="form-signin" role="form" method="post" action="login.php">
			<h2 class="form-signin-heading">Please sign init</h2>
			<label for="inputEmail" class="sr-only">Email address</label> <input
				type="email" id="inputEmail" name="inputEmail" class="form-control"
				placeholder="Email address" required autofocus> <label
				for="inputPassword" class="sr-only">Password</label> <input
				type="password" id="inputPassword" name="inputPassword"
				class="form-control" placeholder="Password" required>
			<div class="checkbox">
				<label> <input type="checkbox" value="remember-me"> Remember me
				</label>
			</div>
			<button class="btn btn-lg btn-primary btn-block" type="submit"
				name="submit">Sign in</button>
		</form>

		<form class="form-signin" action="register.php">
			<button class="btn btn-lg btn-primary btn-block" type="submit"
				name="submit">Register</button>
		</form>

	</div>
	<!-- /container -->


	<!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
	<script src="../../assets/js/ie10-viewport-bug-workaround.js"></script>
</body>
</html>


