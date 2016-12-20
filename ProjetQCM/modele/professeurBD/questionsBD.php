<?php 

	function afficherQuestions($theme){ // nom du thème
		require("connect.php");	
		
		$select = "select q.* from question q, theme t where t.descr_theme='%s' and t.id_theme=q.id_theme";
		$req = sprintf($select,$theme);
		
		$res = mysqli_query($link, $req)
			or die (utf8_encode("erreur de requête : ") . $req); 
			
		if (mysqli_num_rows ($res) == 0) {
			return false; // pas de questions
		}
		else {
			$questions = array();
			while ($question = mysqli_fetch_assoc($res) and isset($question)) {
				$questions[] = $question; 
			}			
			return $questions;
		}
	}

	function afficherNbElevesGroupe($groupe){ // num du groupe
											  // pour pouvoir savoir le nombre d'étudiants ayant pas encore répondu (res - 1 à chaque réponse)
		require("connect.php");
		
		$select = "select * from etudiant where num_grpe='%s'";
		$req = sprintf($select,$groupe);
		
		$res = mysqli_query($link, $req)
			or die (utf8_encode("erreur de requête : ") . $req); 

		$nb = mysqli_num_rows($res);
	
		return $nb;
	}
	
	function creationTest($titresession, $idquestion){
		require("connect.php");	

		$insert = "insert into test(id_session, id_quest, bAutorise) values((select id_session from sessio where titre_sess='%s'),'%s', '1')";
		$req = sprintf($insert, $titresession, $idquestion);
		$res = mysqli_query($link, $req)
					or die (utf8_encode("erreur de requête : ") . $req); 
	}

	function testPresent($titresession, $idquestion){
		require("connect.php");	
		
		$select = "select id_test from test where id_session=(select id_session from sessio where titre_sess='%s') and id_quest='%s'";
		$req = sprintf($select, $titresession, $idquestion);
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