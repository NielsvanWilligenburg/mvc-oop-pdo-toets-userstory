<h1><?= $data['title']?></h1>


<h3>Auto van instructeur: <?= $data['naam'] ?> </h3>
<h3>E-mailadres: <?= $data['email'] ?> </h3>
<h3>Kenteken auto: <?= $data['kenteken'] .  ' - ' .  $data['type'] ?></h3>

<table>
    <thead>
        <tr>
            <th>Datum</th>
            <th>Mankement</th>
        </tr>
    </thead>
    <tbody>
       <?= $data['rows'] ?>
    </tbody>
</table>