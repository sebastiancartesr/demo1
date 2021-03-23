<?php
    header("Access-Control-Allow-origin: *");
    include 'conexion.php';

    $correo = $_POST['Correo'];
    $clave = $_POST['clave'];

    $consultar=$connect->query("SELECT * FROM persona  WHERE Correo='".$correo."' and Clave='".$clave."'");

    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }

    echo json_encode($resultado);

    ?>