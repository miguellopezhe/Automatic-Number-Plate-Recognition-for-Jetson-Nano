<?php
    $server = "localhost";
    $user = "root";
    $pass = "Admin123";
    $bd = "proyecto_ia";
    if(empty($_GET['matricula'])){
        echo("La matricula no se ha proporcionado");
    }
    $con = mysqli_connect($server, $user, $pass, $bd) or die("Ezin izan da konektatu");
    $matricula = mysqli_real_escape_string($con, $_GET['matricula']);
    $sql = "SELECT matricula, marca, modelo, color, anio_fabricacion, etiqueta, nombre_propietario, apellido_propietario FROM vehiculos WHERE matricula = '$matricula'";
    if (!$result = mysqli_query($con, $sql)) die();

    $vehiculos = array();
    while ($row = mysqli_fetch_array($result)) {
        $matricula = $row['matricula'];
        $marca = $row['marca'];
        $modelo = $row['modelo'];
        $color = $row['color'];
        $anio_fabricacion = $row['anio_fabricacion'];
        $etiqueta = $row['etiqueta'];
        $nombre_propietario = $row['nombre_propietario'];
        $apellido_propietario = $row['apellido_propietario'];
        $vehiculos[] = array('matricula' => $matricula, 'marca' => $marca, 'modelo' => $modelo, 'color' => $color, 'anio_fabricacion' => $anio_fabricacion, 'etiqueta' => $etiqueta, 'nombre_propietario' => $nombre_propietario, 'apellido_propietario' => $apellido_propietario);
    }
    
    mysqli_close($con);
    header('Content-Type: application/json');
    echo json_encode($vehiculos);
?>
