<?php
include 'conexion.php';
header("Access-Control-Allow-origin: *");
$IdPersona = $_POST['IdPersona'];

$consultar=$connect->query("SELECT  noti.IdNotificacion, noti.TipoNotificacion, noti.Titulo, noti.Remitente, noti.Mensaje, noti.FechaNotificacion , noti.IdPaciente, pac.PrimerNombre , pac.PrimerApellido , pac.Rut
FROM persona per 
INNER JOIN trabajador tra ON per.IdPersona=tra.IdPersona 
INNER JOIN equipo eq ON tra.IdTrabajador=eq.IdEspecialista OR tra.IdTrabajador=eq.IdAsistente 
INNER JOIN paciente pac ON eq.IdEspecialista=pac.IdMedico 
INNER JOIN notificacion noti ON pac.IdPaciente=noti.IdPaciente WHERE per.IdPersona='".$IdPersona."' AND noti.TipoNotificacion=2 AND noti.Mensaje='Vaya a servicio de urgencia.'"  );
$resultado=array();

while($extraerDatos=$consultar->fetch_assoc()){
	$resultado[]=$extraerDatos;
}

echo json_encode($resultado);

?>
