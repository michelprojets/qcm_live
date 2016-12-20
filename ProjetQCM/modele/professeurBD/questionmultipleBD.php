<?php 
	
	function estMultiple($idquestion){
		require("connect.php");	
		
		$select = "select id_quest from question where id_quest='%s' and bmultiple='1'";
		$req = sprintf($select, $idquestion);
		$res = mysqli_query($link, $req)
					or die (utf8_encode("erreur de requête : ") . $req); 
		if (mysqli_num_rows($res) > 0){
			return true;
		}
		else {
			return false;
		}
	}

?>