<h1><u><?= $data['title']?></u></h1>
<h3><?= $data['kenteken'] .  ' - ' .  $data['type'] ?></h3>

<form action="<?= URLROOT ?>/mankement/detail" method="post">
    <label for="mankement">Mankement</label>
    <input id="mankement" name="mankement" type="text">
    <input type="hidden" name="autoId" value="<?= $data['AutoId'] ?>">
    <input type="hidden" name="id" value="<?= $data['id']?>">
    <br>
    <button type="submit">Mankement toevoegen</button>
</form>