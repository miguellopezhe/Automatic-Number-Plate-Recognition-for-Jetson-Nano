<?php
    $server = "localhost"; //Recogida de los datos de la BBDD en diferentes variables
    $user = "root";
    $pass = "Admin123";
    $bd = "proyecto_ia";
    if(empty($_GET['matricula'])){ //Si no se proporciona la matricula que imprima el siguiente comentario en la pagina "Solo en la pagina de php esto no se ve"
        echo("La matricula no se ha proporcionado");
    }
    $con = mysqli_connect($server, $user, $pass, $bd) or die("Ezin izan da konektatu"); //Conexion a la BBDD
    $matricula = mysqli_real_escape_string($con, $_GET['matricula']); //Recoje el dato matricula que se le pasa en el formulario
    $sql = "SELECT matricula, marca, modelo, color, anio_fabricacion, etiqueta, nombre_propietario, apellido_propietario FROM vehiculos WHERE matricula = '$matricula'"; //Se realiza una consulta SQL a la BBDD
    if (!$result = mysqli_query($con, $sql)) die();

    $vehiculos = array(); //Se crea una variable que tiene un array vacio
    while ($row = mysqli_fetch_array($result)) { //Mediante la conexion y la consulta SQL realizada todo los resultados se van guardando en las siguentes variables y por final en el array que hemos llamado vehiculo
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
    //Se cierra la conexion a la BBDD    
    mysqli_close($con);
    header('Content-Type: application/json'); //Se le indica que se va a mandar el fichero con la consulta en un formato JSON
    echo json_encode($vehiculos); //Y se envia el formulario
?>
