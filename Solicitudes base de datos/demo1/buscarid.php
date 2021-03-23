<?php
    header("Access-Control-Allow-origin: *");
    include 'conexion.php';

    $Correo = $_POST['Correo'];


    $consultar=$connect->query("SELECT * FROM persona  WHERE Correo='".$Correo."'");

    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }

    echo json_encode($resultado);

    ?>