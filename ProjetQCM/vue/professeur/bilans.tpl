<!doctype html>

<!-- http://www.w3schools.com/TAGS/att_select_form.asp -->

<html lang="fr">
	<head>
		<meta charset="utf-8">
		<title>Sélection des questions</title>
		<link rel="stylesheet" type="text/css" href="./vue/css/style.css	">
		<!--
		<script src="script.js"></script>
		-->
	</head>
	
	<body>
		<header>
		</header>
		
		<h2> Bilan : </h2>
		
		<div id="milieu">
			<table id="bilan">
			<tr><th class="colonne1">Etudiant :</th> <th>Note :</th>
				<?php
				foreach ($etudiants as $e){
					echo("<tr>");
					echo("<td>" . $e['nom'] . " " . $e['prenom'] . "</td>");
					bilan($e['id_etu']);
					echo("</tr>");
				}
				?>
			</table>
		</div>
		
		
		<div id="bas">
			<div class="infos">
				Nom du professeur connecté : 
				<?php echo($_SESSION['profil']['nom']) ?>
			</div>
			<div class="infos">
				Nom de la session : 
				<?php echo($_SESSION['session']) ?>
			</div>
			<div class="infos">
				Thème choisi : 
				<?php echo($_SESSION['theme']) ?>
			</div>
			<div class="infos">	
				Groupe choisi : 
				<?php echo($_SESSION['groupe']) ?>
			</div>
		</div>
		
		<footer>
		</footer>
	</body>
</html>		