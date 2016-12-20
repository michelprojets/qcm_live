<!doctype html>

<!-- http://www.w3schools.com/TAGS/att_select_form.asp -->

<html lang="fr">
	<head>
		<meta charset="utf-8">
		<title>Création de la session</title>
		<link rel="stylesheet" type="text/css" href="./vue/css/style.css">
		<!--
		<script src="script.js"></script>
		-->
	</head>
	
	<body>
		<header>
		</header>
		<h2> Préparation de la session de test par le professeur : </h2>
		
		<div id="milieu">
			<div class="liste">
				Choisissez le thème : 
				<select name="selected_theme" form="2form">
					<?php 
					foreach($themes as $t){
						echo(" <option value=\"" . utf8_encode($t['descr_theme']) . "\"> " . utf8_encode($t['descr_theme']));
					}
				?>
				</select>
			</div>
		
			<div class="liste">
			Choisissez le groupe : 
				<select name="selected_groupe" form="2form">
				<?php 
				foreach($groupes as $g){
					echo(" <option value=\"" . utf8_encode($g['num_grpe']) . "\"> " . utf8_encode($g['num_grpe']));
				}
				?>
				</select>
			</div>
		
			<form action="index.php?controle=professeur&action=selectSession" method="post" id="2form">
				<fieldset>
					<legend> Créer la session : </legend><br/>
					<label for="session" > Nom de la session : </label> 
					<input class="input" name="titre_session"/>
					<input type= "submit" value= "Lancer le test"/>
				</fieldset>
			</form>
		</div>
		
			
		<div id="bas">
			Nom du professeur connecté :
			<?php echo($_SESSION['profil']['nom']) ?>
		</div>
	
		<footer>
		</footer>
		
	</body>
	
</html>		