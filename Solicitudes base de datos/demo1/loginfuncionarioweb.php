<?php
    header("Access-Control-Allow-origin: *");
    include 'conexion.php';

    $correo = $_POST['Correo'];
    $clave = $_POST['clave'];

    $consultar=$connect->query("SELECT per.IdPersona, per.Rut , per.Correo , per.Clave , per.PrimerNombre , per.SegundoNombre , per.PrimerApellido, 
    per.SegundoApellido , per.Telefono , per.Direccion , per.IdCetrooncologico , rol.NombreRol , eq.IdEspecialista
    FROM persona per 
    INNER JOIN trabajador tra ON per.IdPersona=tra.IdPersona 
    INNER JOIN rol ON tra.IdRol=rol.IdRol
    INNER JOIN equipo eq ON tra.IdTrabajador=eq.IdEspecialista OR tra.IdTrabajador=eq.IdAsistente WHERE Correo='".$correo."' and Clave='".$clave."'");

    $resultado=array();

    while($extraerDatos=$consultar->fetch_assoc()){
        $resultado[]=$extraerDatos;
    }

    echo json_encode($resultado);

    ?>