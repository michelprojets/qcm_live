
<!doctype html>

<!-- http://www.w3schools.com/TAGS/att_select_form.asp -->

<html lang="fr">
	<head>
		<meta charset="utf-8">
		<title>Connexion</title>
		<link rel="stylesheet" type="text/css" href="./vue/css/style.css">
		<!--
		<link rel="stylesheet" href="style.css">
		<script src="script.js"></script>
		-->
	</head>
	
	<body>
		<header>
		</header>
		<h2> Connexion : </h2>
		<div id="milieu">
			<form name="formulaireConnexion" action= "index.php?controle=connexion&action=ident" method= "post">
				<fieldset>
					<legend> Connectez vous : </legend><br/>
					<label  for="pseudo" > Login : </label> 
					<input class="input" name="pseudo" maxlength="20" tabindex="1" placeholder="Login" value="<?php echo $pseudo ?>" required="required"/> 
					<label  for="mdp" >Mot de passe :</label>
					<input type="password" class="input" name="mdp" maxlength="20" tabindex="2" placeholder="Mot de passe" required="required"/>
					<input type="submit" value="Connexion" />
					<input type="reset" value="Annuler"/> 
				</fieldset>
			</form>	
			<h3> <?php echo($msg); ?> </h3>
		</div>
		<footer>
		</footer>
	</body>
	
</html>		