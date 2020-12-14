<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\solicitud_bien */

$this->title = 'Create Solicitud Bien';
$this->params['breadcrumbs'][] = ['label' => 'Solicitud Biens', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="solicitud-bien-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
