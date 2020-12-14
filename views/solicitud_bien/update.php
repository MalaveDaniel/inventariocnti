<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\solicitud_bien */

$this->title = 'Update Solicitud Bien: ' . $model->id_solicitud_bien;
$this->params['breadcrumbs'][] = ['label' => 'Solicitud Biens', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_solicitud_bien, 'url' => ['view', 'id' => $model->id_solicitud_bien]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="solicitud-bien-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
