<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\planes */

$this->title = 'Update Planes: ' . $model->id_planes;
$this->params['breadcrumbs'][] = ['label' => 'Planes', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_planes, 'url' => ['view', 'id' => $model->id_planes]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="planes-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
