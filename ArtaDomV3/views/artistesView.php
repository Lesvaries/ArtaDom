<h2>Artistes</h2>
<ul>
<?php foreach ($listeArtistes as $art): ?>
    <li>
        <?php echo ($art['nom']); ?> <?php echo ($art['prenom']); ?>
    </li>
<?php endforeach; ?>
</ul>
 
<h2>Groupes</h2>
    <ul>
    <?php foreach ($listeGroupes as $grp): ?>
        <li>
            <?php echo ($grp['nomGrp']); ?>
        </li>
    <?php endforeach; ?>
    </ul>
