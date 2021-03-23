<?php
	header("Access-Control-Allow-origin: *");
	include 'conexion.php';
	
	$IdPaciente = $_POST['IdPaciente'];
	$Clave = $_POST['Clave'];
	$Telefono = $_POST['Telefono'];
	$Direccion = $_POST['Direccion'];

	
	$connect->query("UPDATE paciente SET Telefono='".$Telefono."', Clave='".$Clave."', Direccion='".$Direccion."' WHERE IdPaciente='".$IdPaciente."'");

?>