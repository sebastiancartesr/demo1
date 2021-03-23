<?php

    include 'conexion.php';
    header("Access-Control-Allow-origin: *");
    $IdPaciente = $_POST['IdPaciente'];
    $DataIni = $_POST['DataIni'];
    $DataFin = $_POST['DataFin'];

    $consultar=$connect->query("SELECT * FROM bitacora  WHERE IdPaciente='".$IdPaciente."' and FechaHora BETWEEN '".$DataIni." 00:00:00' AND '".$DataFin." 23:59:59'");

    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }

    echo json_encode($resultado);

    ?>
    