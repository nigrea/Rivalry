<?php
include 'header.php';

?>

<div class="jumbotron">
	<h1><?php print $_SESSION['li_username']?></h1>
	<p><?php
	var_dump ( get_summoner_by_name ( $_SESSION['li_username'] ) );
	?></p>

</div>
</div>