<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model app\models\solicitud_bien */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="solicitud-bien-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'id_user')->textInput() ?>

    <?= $form->field($model, 'id_tipo_bien')->textInput() ?>

    <?= $form->field($model, 'id_bienes')->textInput() ?>

    <?= $form->field($model, 'nombre_bien')->textInput() ?>

    <div class="form-group">
        <?= Html::submitButton('Save', ['class' => 'btn btn-success']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
