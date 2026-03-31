<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <title>Choisir Caisse</title>
    <link rel="stylesheet" href="/vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" href="/css/shop-homepage.css">
</head>
<body class="bg-light">

<div class="choix-caisse-card">
    <h5 class="fw-bold mb-4 text-center">Choisir Caisse</h5>

    <form method="POST" action="/choisir-caisse">
        <div class="mb-3">
            <label class="form-label">Numéro de caisse</label>
            <select name="caisse_id" class="form-select" required>
                <option value="">-- Sélectionner --</option>
                <?php foreach ($caisses as $c): ?>
                    <option value="<?= $c['id'] ?>"><?= htmlspecialchars($c['libelle']) ?></option>
                <?php endforeach; ?>
            </select>
        </div>
        <div class="text-center">
            <button type="submit" class="btn btn-primary px-4">Valider</button>
        </div>
    </form>
</div>

</body>
</html>
