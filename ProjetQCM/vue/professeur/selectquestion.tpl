<!doctype html>

<!-- http://www.w3schools.com/TAGS/att_select_form.asp -->

<html lang="fr">
	<head>
		<meta charset="utf-8">
		<title>Sélection des questions</title>
		<link rel="stylesheet" type="text/css" href="./vue/css/style.css">
		<!--
		<script src="script.js"></script>
		-->
	</head>
	
	<body>
		<header>
		</header>
		
		<h2> Sélection des questions par le professeur : </h2>
		
		<div id="milieu">
			<table>
			<tr><th class="colonne1">Sélectionner :</th> <th>Etat :</th> <th>Numéro (id_quest) :</th> <th>Questions :</th> <th>Réponses :</th></tr>
			<?php 
				foreach ($questions as $q) {
					afficherQuestion($q); // affichage des questions une par une indépendamment
				}
			?>
			</table>
		</div>
		
		<h2><?php echo($_SESSION['reste']) ?> réponse(s) restante(s)</h2>
		
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
			<div class="infos">			
				<input id="boutonbilan" type="button" name="bilan" value="BILAN" onclick="self.location.href='index.php?controle=professeur&action=bilans'" />
			</div>
		</div>
		
		<footer>
		</footer>
	</body>
</html>		