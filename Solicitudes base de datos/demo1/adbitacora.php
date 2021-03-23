<?php

	include 'conexion.php';
	
	$FechaHora = $_POST['FechaHora'];
	$Nauseas = $_POST['Nauseas'];
	$Vomitos = $_POST['Vomitos'];
	$Diarrea = $_POST['Diarrea'];
	$Constipacion = $_POST['Constipacion'];
	$Dolor = $_POST['Dolor'];
	$Fatiga = $_POST['Fatiga'];
	$PerdidaApetito = $_POST['PerdidaApetito'];
	$Fiebre = $_POST['Fiebre'];
	$SintomasResfrio = $_POST['SintomasResfrio'];
	$SintomasUnitarios = $_POST['SintomasUnitarios'];
	$ValorICG = $_POST['ValorICG'];
	$IdPaciente = $_POST['IdPaciente'];
	
	$connect->query("INSERT INTO bitacora (FechaHora,Nauseas,Vomitos,Diarrea,Constipacion,Dolor,Fatiga,PerdidaApetito,Fiebre,SintomasResfrio,SintomasUnitarios,ValorICG,IdPaciente) VALUES ('".$FechaHora."','".$Nauseas."','".$Vomitos."','".$Diarrea."','".$Constipacion."','".$Dolor."','".$Fatiga."','".$PerdidaApetito."','".$Fiebre."','".$SintomasResfrio."','".$SintomasUnitarios."','".$ValorICG."','".$IdPaciente."')")

?>