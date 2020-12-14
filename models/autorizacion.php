<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "autorizacion".
 *
 * @property int $id_autorizacion
 * @property int $id_user
 * @property string $fecha_hora_aprobacion
 * @property string $detalle
 * @property string $fecha_orden_salida
 *
 * @property Persona $user
 * @property OrdenSalida[] $ordenSalidas
 */
class autorizacion extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'autorizacion';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_user', 'fecha_hora_aprobacion', 'detalle', 'fecha_orden_salida'], 'required'],
            [['id_user'], 'default', 'value' => null],
            [['id_user'], 'integer'],
            [['fecha_hora_aprobacion', 'fecha_orden_salida'], 'safe'],
            [['detalle'], 'string'],
            [['id_user'], 'exist', 'skipOnError' => true, 'targetClass' => Persona::className(), 'targetAttribute' => ['id_user' => 'id_user']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_autorizacion' => 'Id Autorizacion',
            'id_user' => 'Id User',
            'fecha_hora_aprobacion' => 'Fecha Hora Aprobacion',
            'detalle' => 'Detalle',
            'fecha_orden_salida' => 'Fecha Orden Salida',
        ];
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
     * Gets query for [[OrdenSalidas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenSalidas()
    {
        return $this->hasMany(OrdenSalida::className(), ['id_autorizacion' => 'id_autorizacion']);
    }
}
