<?php
    header("Access-Control-Allow-origin: *");
    include 'conexion.php';


    $consultar=$connect->query("SELECT * FROM bitacora  WHERE IdPaciente='112' and FechaHora BETWEEN '2020-11-04 00:00:00' AND '2020-11-04 23:59:59'");

    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }

    echo json_encode($resultado);

    ?>


