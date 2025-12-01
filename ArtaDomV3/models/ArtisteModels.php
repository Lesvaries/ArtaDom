<?php

    function get_artistes()
    {
        global $bdd;

        $req = $bdd->prepare("SELECT id_artiste, nom, prenom FROM artiste ORDER BY nom, prenom");
        $req->execute();
        $artistes = $req->fetchAll();

        return $artistes;
    }

    function get_groupes()
    {
        global $bdd;

        $req = $bdd->prepare("SELECT id_groupe, nomGrp FROM groupe ORDER BY nomGrp");
        $req->execute();
        $groupes = $req->fetchAll();

        return $groupes;
    }

?>