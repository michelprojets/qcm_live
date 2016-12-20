<?php 

	function afficherThemes(){
		
		require("connect.php");	
		
		$select = "select * from theme";
		$res = mysqli_query($link, $select)
			or die (utf8_encode("erreur de requête : ") . $req); 
		if (mysqli_num_rows ($res) == 0) {
			return false; // pas de themes
		}
		else {
			$themes = array();
			while ($theme = mysqli_fetch_assoc($res) and isset($theme)) {
				$themes[] = $theme; 
			}			
			return $themes;
		}
		
	}
	
	function afficherGroupes(){
		
		require("connect.php");	
		
		$select = "select * from groupe";
		$res = mysqli_query($link, $select)
			or die (utf8_encode("erreur de requête : ") . $req); 
		if (mysqli_num_rows ($res) == 0) {
			return false; // pas de groupes
		}
		else {
			$groupes = array();
			while ($groupe = mysqli_fetch_assoc($res) and isset($groupe)) {
				$groupes[] = $groupe; 
			}			
			return $groupes;
		}
	}
	
	function creationSession($groupe, $titresession){
		require("connect.php");	
		
		$insert = "insert into sessio(num_grpe, titre_sess, date_sess) values('%s','%s', sysdate())";
		$req = sprintf($insert, $groupe, $titresession);
		$res = mysqli_query($link, $req)
			or die (utf8_encode("erreur de requête : ") . $req); 
	}

?>