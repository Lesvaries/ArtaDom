<?php 

require 'Credentials.php';
try
{
	$bdd = new PDO('mysql:host=localhost;dbname=bddartadom;charset=utf8',$user,$password);
}
catch(Exception $e)
{
    die('Erreur : '.$e->getMessage());
}

?>