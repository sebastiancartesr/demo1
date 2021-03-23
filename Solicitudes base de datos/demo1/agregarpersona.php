<?php

	include 'conexion.php';
	header("Access-Control-Allow-origin: *");
	$Rut = $_POST['Rut'];
	$Correo = $_POST['Correo'];
	$Clave = $_POST['Clave'];
	$PrimerNombre = $_POST['PrimerNombre'];
	$SegundoNombre = $_POST['SegundoNombre'];
	$PrimerApellido = $_POST['PrimerApellido'];
	$SegundoApellido = $_POST['SegundoApellido'];
	$Telefono = $_POST['Telefono'];
	$Direccion = $_POST['Direccion'];
	$IdCetrooncologico = $_POST['IdCetrooncologico'];
	
	$connect->query("INSERT INTO persona (Rut,Correo,Clave,PrimerNombre,SegundoNombre,PrimerApellido,SegundoApellido,Telefono,Direccion,IdCetrooncologico) VALUES ('".$Rut."','".$Correo."','".$Clave."','".$PrimerNombre."','".$SegundoNombre."','".$PrimerApellido."','".$SegundoApellido."','".$Telefono."','".$Direccion."','".$IdCetrooncologico."')")
 
?>