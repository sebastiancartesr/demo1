<?php
include 'conexion.php';
header("Access-Control-Allow-origin: *");
$IdMedico = $_POST['IdMedico'];
$DataIni = $_POST['DataIni'];
$DataFin = $_POST['DataFin'];

$consultar=$connect->query("SELECT DISTINCT pac.IdPaciente , pac.Rut, pac.Correo,pac.Clave,  pac.PrimerNombre, pac.SegundoNombre, pac.PrimerApellido,pac.SegundoApellido,pac.FechaN,pac.Telefono,pac.Direccion  
FROM persona per  
INNER JOIN trabajador tra ON per.IdPersona=tra.IdPersona  
INNER JOIN rol ON tra.IdRol=rol.IdRol 
INNER JOIN equipo eq ON tra.IdTrabajador=eq.IdEspecialista OR tra.IdTrabajador=eq.IdAsistente  
INNER JOIN paciente pac ON eq.IdEspecialista=pac.IdMedico 
WHERE per.IdPersona='".$IdMedico."' AND pac.IdPaciente NOT IN (SELECT bitacora.IdPaciente FROM bitacora WHERE bitacora.FechaHora BETWEEN '".$DataIni." 00:00:00' AND '".$DataFin." 23:59:59')" );
$resultado=array();

while($extraerDatos=$consultar->fetch_assoc()){
	$resultado[]=$extraerDatos;
}

echo json_encode($resultado);

?>
