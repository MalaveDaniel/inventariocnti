<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $user */

$resetLink = Yii::$app->urlManager->createAbsoluteUrl(['site/password-reset', 'token' => $user->password_reset_token]);
?>

La ONCTI (Observatorio Nacional de Ciencia y Tecnologia) te saluda innovador: <?php echo Html::encode($user->username) ?>,

Has click en el link para cambiar tu contraseña:

<?php echo Html::a(Html::encode($resetLink), $resetLink) ?>