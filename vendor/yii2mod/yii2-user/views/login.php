<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\captcha\Captcha;
/* @var $this yii\web\View */
/* @var $form yii\widgets\ActiveForm */
/* @var $model \yii2mod\user\models\LoginForm */

$this->title = Yii::t('yii2mod.user', 'Login');
//$this->params['breadcrumbs'][] = $this->title;
?>

<div class="static-page" >


<div class="col-12 col-md-12 col-sm-12 col-lg-12 d-flex">

<div id="imagen-convocatoria" class="col-6 col-md-6 col-lg-6 col-sm-6">
<?= Html::img('@web/images/Logo_CNTI.png', ['alt'=>'some', 'style'=>[
    'width' => '100%',
    'height'=> '47rem',
    'margin-rigth'=> '2rem',
]]);

?>
</div>

<div class="col-6 col-md-6 col-lg-6 col-sm-6 justify-content-center">
<div id="login-first" style="width: 80%; height: 47rem; padding: 2rem 5rem;border: double; background-color: #cbd2d4;">
        <h1 style="background-color: #337ab7"><?php echo Html::encode($this->title); ?></h1>
        <p><?php echo Yii::t('yii2mod.user', 'Please fill out the following fields to login:'); ?></p>
            <?php $form = ActiveForm::begin(['id' => 'login-form']); ?>
            <?php echo $form->field($model, 'email'); ?>
            <?php echo $form->field($model, 'password')->passwordInput(); ?>
            <?= $form->field($model, 'captcha')->widget(Captcha::className(), [
                        'captchaAction' => ['/site/captcha']
                    ]) ?> 
            <div style="color:#999;margin:1em 0">
                <?php echo Html::a(Yii::t('yii2mod.user', 'Forgot your password?'), ['site/request-password-reset']); ?>
            </div>
            <div class="form-group">
                <?php echo Html::submitButton(Yii::t('yii2mod.user', 'Login'), ['class' => 'btn btn-primary', 'name' => 'login-button']); ?>
            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>
   </div>
</div>


 


