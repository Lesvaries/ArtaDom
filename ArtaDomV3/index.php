<?php

include_once('./models/ConnexionArtadom.php');

include_once('views/layouts/head.php');
include_once('views/layouts/header.php');


if (!isset($_GET['section']) OR $_GET['section'] == 'index')
{
    include_once('controllers/HomepageController.php');
}
else
{
    if ($_GET['section'] == 'artistes')
    {  
        include_once('controllers/ArtistesController.php');
    }
}

?>