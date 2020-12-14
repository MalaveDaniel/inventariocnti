<?php

/* @var $this \yii\web\View */
/* @var $content string */

use app\widgets\Alert;
use yii\helpers\Html;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use app\assets\AppAsset;

AppAsset::register($this);
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?php $this->registerCsrfMetaTags() ?>
    <title><?= Html::encode($this->title) ?></title>
    <?php $this->head() ?>
</head>
<body>
<?php $this->beginBody() ?>

<div class="wrap">
<?php 
  $role = Yii::$app->authManager->getAssignments(Yii::$app->user->getId());

  ?>
    <?php
    NavBar::begin([
        'brandLabel' => Html::img('@web/images/Logo_CNTI2.png', ['style'=> 'margin-top: -15px; padding:0px;width: 150px; height: 50px', 'alt'=>Yii::$app->name]),
        'brandUrl' => Yii::$app->homeUrl,
        'options' => [
            'class' => 'navbar-inverse navbar-fixed-top',
        ],
    ]);
    echo Nav::widget([
        'options' => ['class' => 'navbar-nav navbar-right'],
        'items' => [
            Yii::$app->user->isGuest ? (''):(['label' => 'Home', 'url' => ['/site/index']]),

            Yii::$app->user->isGuest ?['label' => 'Inicio', 'url' => ['/site/index']]: (''),

            Yii::$app->user->isGuest ?['label' => 'Registrar Marca', 'url' => ['/marca/create']]: (''),
            Yii::$app->user->isGuest ?['label' => 'Registrar Modelo', 'url' => ['/modelo/create']]: (''),
            Yii::$app->user->isGuest ?['label' => 'Registrar  Tipo de Bien', 'url' => ['/tipo_bien/create']]: (''),
            Yii::$app->user->isGuest ?['label' => 'Registrar Bien', 'url' => ['/bienes/create']]: (''),
             Yii::$app->user->isGuest ?['label' => 'Registrar Almacen', 'url' => ['/almacen/create']]: (''),
              Yii::$app->user->isGuest ?['label' => 'Registrar Personas', 'url' => ['/persona/create']]: (''), 

            Yii::$app->user->isGuest ?['label' => 'Registrar Solicitud de bien', 'url' => ['/solicitud_bien/create']]: (''),  


                  
          
        ],
    ]);
    NavBar::end();
    ?>

    <div class="container">
        <?= Breadcrumbs::widget([
            'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
        ]) ?>
        <?= Alert::widget() ?>
        <?= $content ?>
    </div>
</div>


<footer class="footer">
    <div class="container">

        <p class="pull-right">® 2020 CNTI. Este es un software desarrollado para optimizar los procesos de trabajo administrativos referentes a la entrada y salida de los bienes nacionales ubicados dentro de la institución del Centro Nacional de Tecnologías de Información.</p>
    </div>
</footer>




<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>
