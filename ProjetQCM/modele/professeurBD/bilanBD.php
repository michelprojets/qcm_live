<?php 
	
	function getEtuGroupe($numGroupe){
		require("connect.php");	
		
		$select = "select * from etudiant where num_grpe='%s'";
		$req = sprintf($select,$numGroupe);
		
		$res = mysqli_query($link, $req)
			or die (utf8_encode("erreur de requête : ") . $req); 
			
		if (mysqli_num_rows ($res) == 0) {
			return false; // pas d'étudiants
		}
		
		else {
			$etudiants = array();
			while ($etudiant = mysqli_fetch_assoc($res) and isset($etudiant)) {
				$etudiants[] = $etudiant; 
			}			
			return $etudiants;
		}
	}
	
	function getBilanEtu($nomSess, $idetu){
		require("connect.php");	
		
		$select = "select b.* from bilan b, sessio s where b.id_session=s.id_session and s.titre_sess='%s' and b.id_etu='%s'";
		$req = sprintf($select,$nomSess,$idetu);
		
		$res = mysqli_query($link, $req)
			or die (utf8_encode("erreur de requête : ") . $req); 
			
		if (mysqli_num_rows ($res) == 0) {
			return false; // pas de bilans
		}
		else {
			$bilans = array();
			while ($bilan = mysqli_fetch_assoc($res) and isset($bilan)) {
				$bilans[] = $bilan; 
			}			
			return $bilans;
		}
	}

?>