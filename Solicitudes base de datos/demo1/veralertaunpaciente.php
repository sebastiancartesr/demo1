<?php
include 'conexion.php';
header("Access-Control-Allow-origin: *");
$IdPaciente = $_POST['IdPaciente'];

$consultar=$connect->query("SELECT * FROM notificacion WHERE IdPaciente='".$IdPaciente."' AND TipoNotificacion=2 ORDER BY `FechaNotificacion` DESC"  );
$resultado=array();

while($extraerDatos=$consultar->fetch_assoc()){
	$resultado[]=$extraerDatos;
}

echo json_encode($resultado);

?>
