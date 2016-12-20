<?php 

	function getReponses($idquest){
		require("connect.php");
		
		$select = "select * from reponse where id_quest='%s'";
		$req = sprintf($select,$idquest);
		
		$res = mysqli_query($link, $req)
			or die (utf8_encode("erreur de requête : ") . $req); 

		if (mysqli_num_rows ($res) == 0) {
			return false; // pas de réponses
		}
		else {
			$reponses = array();
			while ($reponse = mysqli_fetch_assoc($res) and isset($reponse)) {
				$reponses[] = $reponse; 
			}			
			return $reponses;
		}
	}
	
	function compterNbEtuRep($nomSess, $idquest, $idrep){
		require("connect.php");
		
		$select = "select r.* from resultat r, sessio s where s.id_session=r.id_session and s.titre_sess='%s' and r.id_quest='%s' and r.id_rep='%s'";
		$req = sprintf($select,$nomSess,$idquest,$idrep);
		
		$res = mysqli_query($link, $req)
			or die (utf8_encode("erreur de requête : ") . $req); 

		$nb = mysqli_num_rows ($res);
		
		return $nb;
	}
	
?>