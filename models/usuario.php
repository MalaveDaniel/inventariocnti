<?php

namespace app\models;
use Yii;
use yii2mod\user\models\UserModel;
/**
 * This is the model class for table "usuario".
 *
 * @property int $id_usuario
 * @property string $correo_electronico
 * @property float $cedula
 * @property string $nombre_usuario
 *
 * @property Autorizacion[] $autorizacions
 * @property OrdenSalida[] $ordenSalidas
 */
class usuario extends \yii\db\ActiveRecord
{
    public $contrasena;
    public $repetir_contrasena;
    public $captcha;

    public static function tableName()
    {
        return 'usuario';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['contrasena','repetir_contrasena','correo_electronico', 'cedula', 'nombre_usuario'], 'required'],
            [['correo_electronico', 'nombre_usuario'], 'string'],
            [['cedula'], 'number'],
            [['correo_electronico'], 'email'],
            ['cedula', 'unique'],
            [['contrasena', 'repetir_contrasena'], 'string', 'max' => 100],
            ['contrasena', 'compare', 'compareAttribute' => 'repetir_contrasena', 'operator' => '=='],
            ['captcha', 'required'],
            ['captcha', 'captcha'],

        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_usuario' => 'Id Usuario',
            'correo_electronico' => 'Correo Electronico',
            'cedula' => 'Cedula',
            'nombre_usuario' => 'Nombre Usuario',
            'contrasena' => 'Contraseña',
            'repetir_contrasena' => 'Repetir Contraseña',
        ];
    }

 public function validateCedula($attribute, $params, $validator)
    {
        $userModel = UserModel::find()->where(['username'=>$this->$attribute])->one();

        if(!empty($userModel)){
            $this->addError($attribute, 'La cedula ya existe');
        }
    }
    public function validateEmail($attribute, $params, $validator)
    {
        $userModel = UserModel::find()->where(['email'=>$this->$attribute])->one();
  
        if(!empty($userModel)){
            $this->addError($attribute, 'El email ya existe');
        }
    }


    /**
     * Gets query for [[Autorizacions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAutorizacions()
    {
        return $this->hasMany(Autorizacion::className(), ['id_usuario' => 'id_usuario']);
    }

    /**
     * Gets query for [[OrdenSalidas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenSalidas()
    {
        return $this->hasMany(OrdenSalida::className(), ['id_usuario' => 'id_usuario']);
    }

 public function  beforeSave($insert) {
        if ($insert) {           
            $user = new UserModel();           
            $attributes['username'] = $this->cedula;
            $attributes['status'] = 1;
            $attributes['email'] = $this->correo_electronico;
            $user->setAttributes($attributes);
            $user->setPassword($this->contrasena);
            $user->setLastLogin(time());
            $user->generateAuthKey();
            $user->save();
            $this->id_user = $user->id;
        } else {
            $user = UserModel::find()->where(['id'=>$this->id_user])->one();
            if($user->password_hash!=$this->contrasena){
                $user->setPassword($this->contrasena);
                $user->generateAuthKey();               
            }
            $user->setLastLogin(time());
            $user->username = $this->cedula;
            $user->email=$this->correo_electronico;
            $user->save();
        }
        return parent::beforeSave($insert);
    }


}


