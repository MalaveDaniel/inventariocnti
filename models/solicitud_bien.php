<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "solicitud_bien".
 *
 * @property int $id_solicitud_bien
 * @property int $id_user
 * @property int $id_tipo_bien
 * @property int $id_bienes
 * @property string $nombre_bien
 *
 * @property Bienes $bienes
 * @property Persona $user
 * @property TipoBien $tipoBien
 */
class solicitud_bien extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'solicitud_bien';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_user', 'id_tipo_bien', 'id_bienes', 'nombre_bien'], 'required'],
            [['id_user', 'id_tipo_bien', 'id_bienes'], 'default', 'value' => null],
            [['id_user', 'id_tipo_bien', 'id_bienes'], 'integer'],
            [['nombre_bien'], 'string'],
            [['id_bienes'], 'exist', 'skipOnError' => true, 'targetClass' => Bienes::className(), 'targetAttribute' => ['id_bienes' => 'id_bienes']],
            [['id_user'], 'exist', 'skipOnError' => true, 'targetClass' => Persona::className(), 'targetAttribute' => ['id_user' => 'id_user']],
            [['id_tipo_bien'], 'exist', 'skipOnError' => true, 'targetClass' => Tipo_Bien::className(), 'targetAttribute' => ['id_tipo_bien' => 'id_tipo_bien']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_solicitud_bien' => 'Id Solicitud Bien',
            'id_user' => 'Id User',
            'id_tipo_bien' => 'Id Tipo Bien',
            'id_bienes' => 'Id Bienes',
            'nombre_bien' => 'Nombre Bien',
        ];
    }

    /**
     * Gets query for [[Bienes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBienes()
    {
        return $this->hasOne(Bienes::className(), ['id_bienes' => 'id_bienes']);
    }

    /**
     * Gets query for [[User]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getUser()
    {
        return $this->hasOne(Persona::className(), ['id_user' => 'id_user']);
    }

    /**
     * Gets query for [[TipoBien]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTipoBien()
    {
        return $this->hasOne(TipoBien::className(), ['id_tipo_bien' => 'id_tipo_bien']);
    }
}
