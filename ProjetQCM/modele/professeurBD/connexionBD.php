<?php

	function verif_user($pseudo,$mdp,&$profil) {
		
	require("connect.php");	
	
		$select1 = "SELECT * FROM etudiant WHERE login='%s' and pass='%s'";
		$select2 = "SELECT * FROM professeur WHERE login='%s' and pass='%s'";
		$req1 = sprintf($select1,$pseudo,$mdp);
		$req2 = sprintf($select2,$pseudo,$mdp);
		$res1 = mysqli_query($link, $req1)	
				or die (utf8_encode("erreur de requête : ") . $req1); 
		$res2 = mysqli_query($link, $req2)	
				or die (utf8_encode("erreur de requête : ") . $req2); 
		if (mysqli_num_rows ($res1) == 0 and mysqli_num_rows ($res2) == 0) {
			$profil = null;
			return 0; // login ou mdp incorrect
		}
		else {
			if (mysqli_num_rows ($res1) > 0){
				$profil = mysqli_fetch_assoc($res1);
				return 1; // l'étudiant
			}
			else {
				if (mysqli_num_rows ($res2) > 0){
					$profil = mysqli_fetch_assoc($res2);
					return 2; // le professeur
				}
			}
		}
	}















?>