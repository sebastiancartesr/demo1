<?php
	header("Access-Control-Allow-origin: *");
	include 'conexion.php';
	
	$IdPersona = $_POST['IdPersona'];
	$Clave = $_POST['Clave'];
	$Telefono = $_POST['Telefono'];
	$Direccion = $_POST['Direccion'];

	
	$connect->query("UPDATE persona SET Telefono='".$Telefono."', Clave='".$Clave."', Direccion='".$Direccion."' WHERE IdPersona='".$IdPersona."'");

?>