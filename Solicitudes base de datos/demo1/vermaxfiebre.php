<?php
include 'conexion.php';
header("Access-Control-Allow-origin: *");
$IdMedico = $_POST['IdMedico'];
$DataIni = $_POST['DataIni'];


$consultar=$connect->query("SELECT pac.IdPaciente , pac.Rut,pac.Correo,pac.Clave,  pac.PrimerNombre, pac.SegundoNombre, pac.PrimerApellido,pac.SegundoApellido,pac.FechaN,pac.Telefono,pac.Direccion, MAX(bita.Fiebre) MaxFiebre
FROM persona per 
INNER JOIN trabajador tra ON per.IdPersona=tra.IdPersona 
INNER JOIN rol ON tra.IdRol=rol.IdRol
INNER JOIN equipo eq ON tra.IdTrabajador=eq.IdEspecialista OR tra.IdTrabajador=eq.IdAsistente 
INNER JOIN paciente pac ON eq.IdEspecialista=pac.IdMedico
INNER JOIN bitacora bita ON pac.IdPaciente=bita.IdPaciente
WHERE per.IdPersona='".$IdMedico."' AND bita.FechaHora BETWEEN '".$DataIni." 00:00:00' AND '".$DataIni." 23:59:59' GROUP BY pac.IdPaciente , pac.Rut ORDER BY `MaxFiebre` DESC" );
$resultado=array();

while($extraerDatos=$consultar->fetch_assoc()){
	$resultado[]=$extraerDatos;
}

echo json_encode($resultado);

?>
