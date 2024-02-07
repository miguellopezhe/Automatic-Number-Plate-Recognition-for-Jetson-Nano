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
    $sql = "SELECT matricula, fecha_hora, coeficiente FROM entrada WHERE matricula = '$matricula' ORDER BY fecha_hora DESC";
    if (!$result = mysqli_query($con, $sql)) die();

    $entrada = array();
    while ($row = mysqli_fetch_array($result)) {
        $matricula = $row['matricula'];
        $fecha_hora = $row['fecha_hora'];
        $coeficiente = $row['coeficiente'];
        $entrada[] = array('matricula' => $matricula, 'fecha_hora' => $fecha_hora, 'coeficiente' => $coeficiente);
    }
    
    mysqli_close($con);
    header('Content-Type: application/json');
    echo json_encode($entrada);
?>
