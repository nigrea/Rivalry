<?php
include 'header.php';

?>

<div class="jumbotron">
	<h1><?php print $_SESSION['main_summoner_name']?></h1>
	
	<?php 
	$challengertier = get_challengertier();
	?>	
	
	
	<p><?php
	var_dump ( $challengertier );

	
	?></p>

</div>
</div>