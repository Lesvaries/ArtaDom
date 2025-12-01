<?php

include_once './models/ArtisteModels.php';

    $listeArtistes = get_artistes();
    $listeGroupes = get_groupes();

    include_once "./views/artistesView.php";


?>