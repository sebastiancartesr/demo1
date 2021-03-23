<?php

	include 'conexion.php';
	header("Access-Control-Allow-origin: *");
	$IdPersona = $_POST['IdPersona'];
	$IdRol = $_POST['IdRol'];

	
	$connect->query("INSERT INTO trabajador (IdPersona,IdRol) VALUES ('".$IdPersona."','".$IdRol."')")
 
?>