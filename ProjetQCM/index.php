<?php 

session_start ();

if (isset($_GET['controle']) & isset($_GET['action'])) {
 	$controle = $_GET['controle'];
	$action= $_GET['action'];
	$param= ISSET($_GET['param'])?$_GET['param']:"";
}
else { //absence de param�tres : pr�voir des valeurs par d�faut
	$controle = "connexion";
	$action= "ident";
	$param="";
}
	
//inclure le fichier php de contr�le 
//et lancer la fonction-action issue de ce fichier.	

	require ('./controle/' . $controle . '.php');   
	$action ($param); 

?>
