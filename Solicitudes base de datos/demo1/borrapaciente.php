<?php
	
	include 'conexion.php';
	header("Access-Control-Allow-origin: *");
	$Rut = $_POST['Rut'];


	
	$connect->query("DELETE FROM paciente WHERE Rut='".$Rut."'");

?>