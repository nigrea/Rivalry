<?php session_start(); ?>
<html>
	<head>
		<title>Nigrea.com</title>
		<link href="css/bootstrap.min.css" rel="stylesheet">
		<link href="css/navbar.css" rel="stylesheet">
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" >
		<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
		
		<?php
		include 'db_mysql.php';
		include 'config.php';
		include 'func_lib.php';
		include 'api_func_lib.php';
		include 'html_generator.php';


		
		if(!@$_SESSION['user_loggedin']){
			header("Location: login.php");
			die("Redirecting to: login.php");			
		}
		
		
		?>
	</head>
	
	<body>
	<div class="container">
	<nav class="navbar navbar-default">
        <div class="container-fluid">
          <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#navbar" aria-expanded="false" aria-controls="navbar">
              <span class="sr-only">Toggle navigation</span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
              <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="profile.php">Rivalry</a>
          </div>
          <div id="navbar" class="navbar-collapse collapse">
            <ul class="nav navbar-nav">
              <li><a href="profile.php">Profile</a></li>
              <li><a href="challange.php">Challange</a></li>
              <li><a href="highelo.php">Top Tier Players</a></li>
              <li><a href="#">Contact</a></li>
              <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu" role="menu">
                  <li><a href="#">Action</a></li>
                  <li><a href="#">Another action</a></li>
                  <li><a href="#">Something else here</a></li>
                  <li class="divider"></li>
                  <li class="dropdown-header">Nav header</li>
                  <li><a href="#">Separated link</a></li>
                  <li><a href="#">One more separated link</a></li>
                </ul>
              </li>
            </ul>
            
          </div><!--/.nav-collapse -->
        </div><!--/.container-fluid -->
      </nav>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
	
	<!-- Let's load teh content-->