<?php
include 'header.php';

?>

<div class="jumbotron">
	<h1><?php print $_SESSION['main_summoner_name']?></h1>
	
	<?php 
	print $_SESSION ['user_id'];
	$summoner = get_summoner_by_name ( $_SESSION['main_summoner_name'] );
	$lower_case_name = strtolower($_SESSION['main_summoner_name']);
	
	?>
	
	<img src=<?php print $config_image_summoner_icon.$summoner->$lower_case_name->profileIconId.".png" ?>>
	
	
	
	<p><?php
	var_dump ( $summoner );
	?></p>

</div>
</div>