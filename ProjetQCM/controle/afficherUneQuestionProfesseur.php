<?php 

	function afficherQuestion($q){
		if (estMultiple($q['id_quest'])){ // pour l'afficher en jaune ou non
			require("./vue/professeur/unequestionmultiple.tpl");
		}
		else {
			require("./vue/professeur/unequestionsimple.tpl");
		}
	}
	
	function afficherReponsesEtu($q){
		
		if (getReponses($q['id_quest']) > 0){
			$getRep = getReponses($q['id_quest']);
			
			$i = 0; // juste un compteur de réponses
			
			foreach ($getRep as $r){
				$i++;
				$nbEtuRep = compterNbEtuRep($_SESSION['session'], $q['id_quest'], $r['id_rep']);
				require("./vue/professeur/reponses.tpl");
			}
			
		}
	}

?>