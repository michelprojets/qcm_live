<?php 

	function ident(){
		$pseudo= isset($_POST['pseudo'])?($_POST['pseudo']):'';
		$mdp= isset($_POST['mdp'])?($_POST['mdp']):'';	
		$msg= "";

		
		//$profil =array();
		//on doit verifier si la personne est dans la base
		if (count($_POST)==0){
			require("./vue/connexion.tpl") ;
		}
		
		else{ // vérification d'abord s'il y a erreur de syntaxe
			if (!verif_syntax($pseudo, $mdp, $msg)){
				require("./vue/connexion.tpl") ;
			}
			else { // on regarde s'il existe dans la base
				require("./modele/professeurBD/connexionBD.php");
				$res = verif_user($pseudo,$mdp,$profil);
				
				if ($res == 0) {
					$msg = "Login ou mdp incorrect";
					require("vue/connexion.tpl") ;
				}
				else { //on doit choisir entre afficher etudiant ou prof
					$_SESSION['profil'] = $profil;
					if ($res == 1) {
						$controle = "utilisateurEtudiant";
						$action = "afficherEtudiant";
					}
					if ($res == 2) {
						$controle = "professeur";
						$action = "selectSession";
					}
					$nexturl = "index.php?controle=" . $controle . "&action=" . $action;
					header ("Location:" . $nexturl);
				}
				
			}	
		}				
		
	}
	
	function verif_syntax($pseudo, $mdp, &$msg){
		if (!preg_match("#^[A-Za-z0-9]{3,15}$#", $pseudo)) {
			$msg = 'Erreur de syntaxe sur le pseudo (entre 3 et 15 caractères alphanumériques) !';
			return false;
		}
		if (!preg_match("#^[A-Za-z0-9]{3,8}$#", $mdp)) {
			$msg = 'Erreur de syntaxe sur le mdp (entre 3 et 8 caractères alphanumériques) !';
			return false;
		}
		return true;
	}



?>