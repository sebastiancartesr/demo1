<?php
    header("Access-Control-Allow-origin: *");
    include 'conexion.php';

    $correo = $_POST['Correo'];
    $clave = $_POST['clave'];

    $consultar=$connect->query("SELECT per.IdPersona, per.Rut , per.Correo , per.Clave , per.PrimerNombre , per.SegundoNombre , per.PrimerApellido, 
    per.SegundoApellido , per.Telefono , per.Direccion , per.IdCetrooncologico , rol.NombreRol 
    FROM persona per 
    INNER JOIN trabajador tra ON per.IdPersona=tra.IdPersona 
    INNER JOIN rol ON tra.IdRol=rol.IdRol
    WHERE Correo='".$correo."' and Clave='".$clave."' and NombreRol='administrador'");

    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }

    echo json_encode($resultado);

    ?>