<?php
	
	include 'conexion.php';
	header("Access-Control-Allow-origin: *");
	$IdPaciente = $_POST['IdPaciente'];
	$Telefono = $_POST['Telefono'];
	$Clave = $_POST['Clave'];

	
	$connect->query("UPDATE paciente SET Telefono='".$Telefono."', Clave='".$Clave."' WHERE IdPaciente='".$IdPaciente."'");

?>