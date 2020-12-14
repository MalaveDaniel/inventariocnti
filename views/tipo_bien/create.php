<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\tipo_bien */

$this->title = 'Crear Tipo Bien';
$this->params['breadcrumbs'][] = ['label' => 'Tipo Biens', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="tipo-bien-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
