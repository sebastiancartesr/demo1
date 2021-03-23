<?php
    header("Access-Control-Allow-origin: *");
    include 'conexion.php';

    $IdPaciente = $_POST['IdPaciente'];


    $consultar=$connect->query("SELECT * FROM paciente WHERE IdPaciente='".$IdPaciente."'");

    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }

    echo json_encode($resultado);

    ?>