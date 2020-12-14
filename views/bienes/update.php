<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\bienes */

$this->title = 'Update Bienes: ' . $model->id_bienes;
$this->params['breadcrumbs'][] = ['label' => 'Bienes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_bienes, 'url' => ['view', 'id' => $model->id_bienes]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="bienes-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
