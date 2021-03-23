<?php

	include 'conexion.php';
	
	$TipoNotificacion = $_POST['TipoNotificacion'];
	$FechaNotificacion = $_POST['FechaNotificacion'];
	$Titulo = $_POST['Titulo'];
	$Remitente = $_POST['Remitente'];
	$Mensaje = $_POST['Mensaje'];
	$IdPaciente = $_POST['IdPaciente'];
	
	$connect->query("INSERT INTO notificacion (TipoNotificacion,FechaNotificacion,Titulo,Remitente,Mensaje,IdPaciente) VALUES ('".$TipoNotificacion."','".$FechaNotificacion."','".$Titulo."','".$Remitente."','".$Mensaje."','".$IdPaciente."')")

?>