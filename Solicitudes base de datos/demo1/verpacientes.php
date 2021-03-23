<?php
include 'conexion.php';
header("Access-Control-Allow-origin: *");
$IdMedico = $_POST['IdMedico'];


$consultar=$connect->query("SELECT  pac.IdPaciente, pac.Rut , pac.Correo, pac.Clave , pac.PrimerNombre , pac.PrimerNombre , pac.SegundoNombre , 
pac.PrimerApellido , pac.SegundoApellido , pac.Telefono , pac.Direccion , pac.IdMedico , pac.FechaN
FROM persona per INNER JOIN trabajador tra ON per.IdPersona=tra.IdPersona 
INNER JOIN equipo eq ON tra.IdTrabajador=eq.IdEspecialista OR tra.IdTrabajador=eq.IdAsistente 
INNER JOIN paciente pac ON eq.IdEspecialista=pac.IdMedico WHERE per.IdPersona='".$IdMedico."'"  );
$resultado=array();

while($extraerDatos=$consultar->fetch_assoc()){
	$resultado[]=$extraerDatos;
}

echo json_encode($resultado);

?>
