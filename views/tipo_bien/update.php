<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\tipo_bien */

$this->title = 'Update Tipo Bien: ' . $model->id_tipo_bien;
$this->params['breadcrumbs'][] = ['label' => 'Tipo Biens', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id_tipo_bien, 'url' => ['view', 'id' => $model->id_tipo_bien]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="tipo-bien-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
