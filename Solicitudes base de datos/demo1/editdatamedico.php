<?php
	header("Access-Control-Allow-origin: *");
	include 'conexion.php';
	
	$IdPersona = $_POST['IdPersona'];
	$Telefono = $_POST['Telefono'];
	$Clave = $_POST['Clave'];

	
	$connect->query("UPDATE persona SET Telefono='".$Telefono."', Clave='".$Clave."' WHERE IdPersona='".$IdPersona."'");

?>