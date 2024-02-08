<?php
    $server = "localhost";
    $user = "root";
    $pass = "Admin123";
    $bd = "proyecto_ia";
    $con = mysqli_connect($server, $user, $pass, $bd) or die("Ezin izan da konektatu");
    $sql = "SELECT matricula, fecha_hora, coeficiente FROM entrada";
    if (!$result = mysqli_query($con, $sql)) die();
    $vehiculos2 = array();
    while ($row = mysqli_fetch_array($result)) {
        $matricula = $row['matricula'];
        $fecha_hora = $row['fecha_hora'];
        $coeficiente = $row['coeficiente'];
        $vehiculos2[] = array('matricula' => $matricula, 'fecha_hora' => $fecha_hora, 'coeficiente' => $coeficiente);
        }
    
    mysqli_close($con);
    header('Content-Type: application/json');
    echo json_encode($vehiculos2);
?>
