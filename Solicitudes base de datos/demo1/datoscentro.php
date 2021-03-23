<?php
    header("Access-Control-Allow-origin: *");

    include 'conexion.php';

    $IdPaciente = $_POST['IdPaciente'];


    $consultar=$connect->query("SELECT cen.IdCentroOncologico , cen.Direccion , cen.telefono , cen.Correo
    FROM paciente pac 
    INNER JOIN trabajador tra ON pac.IdMedico=tra.IdTrabajador 
    INNER JOIN persona per ON tra.IdPersona=per.IdPersona
    INNER JOIN centrooncologico cen ON per.IdCetrooncologico=cen.IdCentroOncologico WHERE IdPaciente='".$IdPaciente."'");

    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }

    echo json_encode($resultado);

    ?>