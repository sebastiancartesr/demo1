<?php
include 'conexion.php';
header("Access-Control-Allow-origin: *");


$consultar=$connect->query("SELECT bitacora.FechaHora FROM bitacora  WHERE IdPaciente= 112"  );
$resultado=array();

while($extraerDatos=$consultar->fetch_assoc()){
	$resultado[]=$extraerDatos;
}

echo json_encode($resultado);

?>
