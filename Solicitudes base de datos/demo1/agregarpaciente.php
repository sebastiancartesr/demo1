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
	$IdMedico = $_POST['IdMedico'];
	
	$connect->query("INSERT INTO paciente (Rut,Correo,Clave,PrimerNombre,SegundoNombre,PrimerApellido,SegundoApellido,Telefono,Direccion,IdMedico) VALUES ('".$Rut."','".$Correo."','".$Clave."','".$PrimerNombre."','".$SegundoNombre."','".$PrimerApellido."','".$SegundoApellido."','".$Telefono."','".$Direccion."','".$IdMedico."')")
 
?>