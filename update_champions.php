<?php
include 'header.php';

$champions = get_champion ( $_SESSION ['champ_counter_derp'] );

foreach ( $champions as $champion ) {
	
	$id = $champion->id;
	$name = addslashes ( $champion->name );
	$title = addslashes ( $champion->title );
	
	$check = get_table ( $config_champion, "id = " . $id . "" );
	if (empty ( $check )) {
		var_dump($champion);
		add_row ( $config_champion, "id, name, title", "'$id', '$name', '$title'" );
	}
}

?>