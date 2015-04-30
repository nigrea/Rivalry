<?php
include 'header.php';

?>

<div class="jumbotron">
	<h1><?php print $_SESSION['li_username']?></h1>
	
	<?php 
	
	$summoner = get_summoner_by_name ( $_SESSION['li_username'] );
	$lower_case_name = strtolower($_SESSION['li_username']);
	
	?>
	
	<img src=<?php print $config_image_summoner_icon.$summoner->$lower_case_name->profileIconId.".png" ?>>
	
	
	
	<p><?php
	var_dump ( $summoner );
	?></p>

</div>
</div>