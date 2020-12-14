<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model app\models\planes */

$this->title = 'Crear Planes';
$this->params['breadcrumbs'][] = ['label' => 'Planes', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="planes-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
