<?php
    header("Access-Control-Allow-origin: *");
    include 'conexion.php';

    $NombreRol = $_POST['NombreRol'];


    $consultar=$connect->query("SELECT IdRol , NombreRol FROM rol WHERE NombreRol='".$NombreRol."'");

    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }

    echo json_encode($resultado);

    ?>