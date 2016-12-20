<?php 

	function selectSession(){
		if (count($_POST)==0){
			
			require("./modele/professeurBD/sessionBD.php");
			
			if (afficherThemes() <> false){
				$themes = afficherThemes();
			}
			
			if (afficherGroupes() <> false){
				$groupes = afficherGroupes();
			}
			
			require("./vue/professeur/selectsession.tpl");
		}
		else {
			$_SESSION['theme'] = isset($_POST['selected_theme'])?($_POST['selected_theme']):"";
			$_SESSION['groupe'] = isset($_POST['selected_groupe'])?($_POST['selected_groupe']):"";
			$_SESSION['session'] = isset($_POST['titre_session'])?($_POST['titre_session']):"";
			
			require("./modele/professeurBD/sessionBD.php");
				
			creationSession($_SESSION['groupe'], $_SESSION['session']);
			
			$controle = "professeur";
			$action = "selectQuestions";
			$param = "";
			$nexturl = "index.php?controle=" . $controle . "&action=" . $action . "&param=" . $param;
			header ("Location:" . $nexturl);
		}
	}

	function selectQuestions($idQuestionChoisie){ // $param sert à stocker l'id de la question qui a été sélectionnée en cliquant sur le bouton

		require("./modele/professeurBD/questionsBD.php");

		if ($idQuestionChoisie <> "" && !testPresent($_SESSION['session'], $idQuestionChoisie)){
			creationTest($_SESSION['session'], $idQuestionChoisie);
		}
			
		if (afficherQuestions($_SESSION['theme']) <> false){
			$questions = afficherQuestions($_SESSION['theme']);
				
		}
			
		$_SESSION['reste'] = afficherNbElevesGroupe($_SESSION['groupe']); // à chaque fois qu'un élève répond, on doit décrémenter 'reste'

		// déclarer ici pour ne les déclarer qu'une fois pour éviter error
		require("./controle/afficherUneQuestionProfesseur.php"); // contient la fonction afficherQuestion($q) // $q = une question
		require("./modele/professeurBD/questionmultipleBD.php"); // contient la fonction estMultiple($idquestion)
		require("./modele/professeurBD/reponsesBD.php");
		
		require("./vue/professeur/selectquestion.tpl"); // la vue d'ensemble
		
	}
	
	function bilans(){
		require("./modele/professeurBD/bilanBD.php");
			
		if (getEtuGroupe($_SESSION['groupe']) <> false) {
			$etudiants = getEtuGroupe($_SESSION['groupe']);
		}
		
		require("./vue/professeur/bilans.tpl");
	}
	
	function bilan($idetu){
		$note="";
		
		if (getBilanEtu($_SESSION['session'],$idetu) <> false){
			$bilan = getBilanEtu($_SESSION['session'],$idetu);
			$note = $bilan[0]['note']; // {0] pour n'afficher qu'un bilan au cas où il y aurait un bilan dupliqué chez l'élève pour une même question d'un même session (cf partie élève)
		}
		else {
			$note="Absent";
		}
		
		require("./vue/professeur/bilan.tpl");
	}

?>