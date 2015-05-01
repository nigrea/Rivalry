<?php

// Gotta cut a lot of this out, since it's just reusing old stuff

function mysql_fetch_full_result_array($result){
    $table_result = array();
    $r = 0;
    while($row = mysql_fetch_assoc($result)){
        $arr_row = array();
        $c = 0;
        while ($c < mysql_num_fields($result)) {        
            $col = mysql_fetch_field($result, $c);    
            $arr_row[$col -> name] = $row[$col -> name];            
            $c++;
        }    
        $table_result[$r] = $arr_row;
        $r++;
    }    
    return $table_result;
}
//this function returns all the data from a row that is decided by $limit
//example of syntax: $temp_user_table = get_table($config_user, 'user_id = "'.$user_id.'"');
function get_table($table_name, $limit){
	include 'config.php';
	
	$query_table = "SELECT * FROM $table_name WHERE $limit";

	$sql_table = mysql_query($query_table) OR die(mysql_error());
	
	$return_data = mysql_fetch_full_result_array($sql_table);
		
	return $return_data; //since the data you return is in an arrey you need to manually get the desired row and data.
				//example of this: $user_name = $temp_user_table[0]['user_name']; 
}

function get_entire_table($table_name){
	include 'config.php';
	$query_table = "SELECT * FROM $table_name";

	$sql_table = mysql_query($query_table) OR die(mysql_error());
	
	$return_data = mysql_fetch_full_result_array($sql_table);
		
	return $return_data;
}

//this function updates a row with the desired, name, name of the columms you want the desired data to appear ($set). where the condition for the desired row is ($condition)
// example of syntax for use: update_table($config_user, 'user_password = "'.$password.'"', 'user_id = "'.$user_id.'"');
function update_table($table_name, $set, $condition){
	include 'config.php';
	$query_update = "UPDATE $table_name SET $set WHERE $condition";
	
	$sql_update = mysql_query($query_update) OR die(mysql_error());

	return $sql_update;
}
//this function adds a row with the desired, name, name of the columns you want the desired data to appear.
// syntax for use: add_table("table_name", "column name", "'new data'")
function add_row($table_name, $columns, $data){
	$query_add = "INSERT INTO $table_name ($columns) VALUES ($data)";
	
	$sql_add = mysql_query($query_add) OR die(mysql_error());

	return $sql_add;
}

function delete_row($table_name, $condition){
	include 'config.php';
	
	$query_delete = "DELETE FROM $table_name WHERE $condition";
	
	$sql_delete = mysql_query($query_delete) OR die(mysql_error());
	
	return $sql_delete;	
}

function login(){
	
}

// function for getting users name from user id
// syntax for use: $username = get_username("user_id");
function get_username($user_id){
	include 'config.php';
	$user = get_table($config_user, "user_id ='".$user_id."'");
	$user_name = $user[0]['user_name'];
	return $user_name;  //returns the username for the user.
}

function get_summoner($user_id){
	include 'config.php';
	$summoner = get_table($config_summoner, "user_id ='".$user_id."'");
	return $summoner;  //returns the summoner
}

function get_main_summoner($user_id){
	include 'config.php';
	$summoner = get_table($config_summoner, "user_id ='".$user_id."' AND main = 1");
	return $summoner;  //returns the summoner
}

function get_challange($challange_id){
	include 'config.php';
	$challange = get_table($config_challange, "id ='".$challange_id."'");
	return $challange;  //returns the challange
}

function get_rivalry($rivalry_id){	
	include 'config.php';
	$rivalry = get_table($config_rivalry, "id ='".$rivalry_id."'");
	return $rivalry;  //returns the rivalry
}

function get_user_by_summoner($summoner_name){
	include 'config.php';
	$summoner = get_table($config_summoner, "name ='".$summoner_name."' AND main = 1");
	$id = $summoner[0]['user_id'];
	$user = get_table($config_user, "id ='".$id."'");
	return $user;
}

function get_email($user_id){
	include 'config.php';
	$email = get_table($config_user, "user_id ='".$user_id."'");
	$user_email = $email[0]['user_email'];
	return $user_email;  //returns the realname for the user.
}


// function for getting userid from username
// syntax for use: $userid = get_userid("user_name");
function get_userid($user_name){
	include 'config.php';
	$id = get_table($config_user, "user_name ='".$user_name."'");
	$user_id = $id[0]['user_id'];
	return $user_id;
}

function get_userbio($user_id){
	include 'config.php';
	$bio = get_table($config_user, "user_id ='".$user_id."'");
	$user_bio = $bio[0]['user_bio'];
	return $user_bio;
}

function get_useravatar($user_id){
	include 'config.php';
	$avatar = get_table($config_user, "user_id ='".$user_id."'");
	$user_avatar = $avatar[0]['user_avatar'];
	return $user_avatar;
}

function validate_password($user_id, $password){
	include 'config.php';
	$encry_password = hash('sha256', htmlentities(mysql_real_escape_string($password.$config_salt)));
	$query_id = "SELECT user_password FROM $config_user WHERE user_id = '$user_id'" ;  //selects user_id from the table "$config user" that refers to the table name. 
	
	$sql_id = mysql_query($query_id) OR die(mysql_error());
	
	while($row_user_id = mysql_fetch_array($sql_id)){
		$user_password = $row_user_id['user_password'];
	}
	//print "$user_password <br>";    //<---- to test if it works
	//print "$encry_password <br>";	 //<---- to test if it works
	if($user_password == $encry_password){
		return 1;
	}
	else {
		return 2;
	}
}

function succes_msg($headline, $msg){
	?>
	<div class="ui-widget" style="width: 500px;">
	<div class="ui-state-highlight ui-corner-all" style="margin-top: 20px; padding: 0 .7em; background: #99FF66;"> 
	<p><span class="ui-icon ui-icon-check" style="float: left; margin-right: .3em;"></span>
	<strong><?php print $headline ?></strong> <?php print $msg  ?> </p>
	</div>
	</div>
	<br><br>
	<?php
}

function error_msg($headline, $msg){
	?>
	<div class="ui-widget" style="width: 500px">
	<div class="ui-state-error ui-corner-all" style="padding: 0 .7em;"> 
	<p><span class="ui-icon ui-icon-alert" style="float: left; margin-right: .3em;"></span> 
	<strong><?php print $headline ?></strong> <?php print $msg  ?></p>
	</div>
	</div>
	<br><br>
	<?php
}						

function not_logged_in(){
	include 'lang.php';
	print "<div class=\"center_content\" align=\"center\"><br><br>";
	error_msg("Error!<br>", $lang_not_logged_in);
	print "</div>"
	?><meta http-equiv="REFRESH" content="2;url=login.php"><?php
}

function force_download($file) 
{ 
    $dir = "files/"; 
    if((isset($file))&&(file_exists($dir.$file))) { 
       header("Content-type: application/force-download"); 
       header('Content-Disposition: inline; filename="'. $dir.$file . '"'); 
       header("Content-Transfer-Encoding: Binary"); 
       header("Content-length: ".filesize($dir.$file)); 
       header('Content-Type: application/octet-stream'); 
       header('Content-Disposition: attachment; filename="' . $file . '"'); 
       readfile("$dir$file"); 
    } else { 
       echo "No file selected"; 
    }
}

function rot13encrypt($str){
	return str_rot13(base64_encode($str));
}

function rot13decrypt($str){
    return base64_decode(str_rot13($str));
}

function editor($msg, $x, $y){
	require_once "includes/init.inc.php"; //Delete this no?
	
	if($x == "" || $y == ""){
		$x = "800";
		$y = "300";
	}
	?>
	<script type="text/javascript" src="ckeditor/ckeditor.js"></script>
		<textarea cols="10" id="editor1" name="concept_description" rows="5" noresize>
			<?php print $msg ?>
		</textarea>

		<script type="text/javascript">
			var sBasePath = document.location.pathname.substring(0,document.location.pathname.lastIndexOf('plugins')) ;
			var CKeditor = CKEDITOR.replace( 'concept_description', { 
					customConfig : sBasePath + 'lammer/lammer.config.js',
			<?php print "width: '".$x."px',
						height: '".$y."px'"; ?>
				}  );
		</script>			
	<?php
}

function is_admin($li_user_id){
	
}

function validate_email($email){
	if(!preg_match( '/^[^\W][a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*\@[a-zA-Z0-9_]+(\.[a-zA-Z0-9_]+)*\.[a-zA-Z]{2,4}$/', $email)) {
		return 1;
	} else {
		return 0;
	}
}

function get_run_name($run_id){
	include 'config.php';
	
	$run = get_table($config_run, "run_id ='".$run_id."'");
	$run_name = $run[0]['run_name'];
	
	return $run_name;  //returns the username for the user.
}

function get_course_name($course_id){
	include 'config.php';
	
	$course = get_table($config_course, "course_id ='".$course_id."'");
	$course_name = $course[0]['course_name'];
	
	return $course_name;  //returns the username for the user.
}

function update_run_time($run_id){
    include 'config.php';
    
    $timestamp = date('U');
    update_table($config_run, "last_updated = '$timestamp'", "run_id = '$run_id'");
    
    return 1;
}

function date_convert($time){
    return date("d-m-Y - H:i:s", $time);
}

function get_run_update($run_id){
    include 'config.php';
    $run = get_table($config_run, "run_id = '$run_id'");
    
    return $run[0]['last_updated'];
}

function update_login_time($user_id){
    include 'config.php';
    
    $timestamp = date('U');
    update_table($config_user, "last_login = '$timestamp'", "user_id = '$user_id'");
    
    return 1;
}

function get_login_time($user_id){
    include 'config.php';
    $user = get_table($config_user, "user_id = '$user_id'");
    
    return $user[0]['last_login'];
}

function make_calendar_xml($user_id){
    include 'config.php';

    $send_user_id = $user_id * $config_prime;
    $file = "xml/$send_user_id.xml";
    $fh = fopen($file, "w") OR DIE('ERROR! XML file not found or created!');
    fwrite($fh, "<data>");    
    $user_runs = get_table($config_run_teacher, "user_id = '1'");
    $user_run_count = count($user_runs);
    
    for($i = 0; $i < $user_run_count; $i++){
            $run = get_table($config_run, "run_id = '".$user_runs[$i]['run_id']."'");
            $start_date = date("Y-m-d H:i:s", $run[0]['run_start_date']);
            $end_date = date("Y-m-d H:i:s", $run[0]['run_end_date']);
            $run_name = $run[0]['run_name'];
            
            $print = "<event id='".$run[0]['run_id'] * $config_prime."'><start_date><![CDATA[".$start_date."]]></start_date><end_date><![CDATA[".$end_date."]]></end_date><text><![CDATA[".$run_name."]]></text><details><![CDATA[Philippe-Chatrier Court Paris, FRA]]></details></event>";
            fwrite($fh, $print);  
        }
        fwrite($fh, "</data>");
        fclose($fh);
        
        return 1;
}

?>
