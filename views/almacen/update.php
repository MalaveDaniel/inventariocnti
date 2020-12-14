<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\almacen */

$this->title = 'Update Almacen: ' . $model->id_almacen;
$this->params['breadcrumbs'][] = ['label' => 'Almacens', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_almacen, 'url' => ['view', 'id' => $model->id_almacen]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="almacen-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
