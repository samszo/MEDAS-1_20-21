<?php
$dir    = '../';
$reps = scandir($dir);
echo json_encode($reps);
?>