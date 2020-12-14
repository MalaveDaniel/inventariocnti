<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use yii\helpers\Url;
use yii\jui\DatePicker;
use yii\captcha\Captcha;

/* @var $this yii\web\View */
/* @var $model app\models\usuario */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="usuario-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'correo_electronico')->textInput() ?>

    <?= $form->field($model, 'cedula')->textInput() ?>

    <?= $form->field($model, 'nombre_usuario')->textInput() ?>

    <?= $form->field($model, 'contrasena')->passwordInput(['maxlength' => 100]) ?>
    <?= $form->field($model, 'repetir_contrasena')->passwordInput(['maxlength' => 100]) ?>


   <div class="form-row col-md-12">
        <div class="form-group col-md-4">
        </div>
        <div class=" col-md-4" align="center">
            <?= Html::submitButton('Registrar', ['class' => 'btn btn-success', 'style' => "width: 90px"]) ?>
        </div>
        <div class="form-group col-md-4"></div>

    </div>


    <?php ActiveForm::end(); ?>


</div>
