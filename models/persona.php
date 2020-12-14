<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "persona".
 *
 * @property int $id_user
 * @property string $correo_electronico
 * @property string $cedula
 * @property string $primer_nombre
 * @property string $primer_apellido
 * @property string $segundo_apellido
 * @property string $segundo_nombre
 *
 * @property Autorizacion[] $autorizacions
 * @property OrdenSalida[] $ordenSalidas
 * @property SolicitudBien[] $solicitudBiens
 */
class persona extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'persona';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['correo_electronico', 'cedula', 'primer_nombre', 'primer_apellido', 'segundo_apellido', 'segundo_nombre'], 'required'],
            [['correo_electronico'], 'string', 'max' => 48],
            [['cedula'], 'string', 'max' => 15],
            [['primer_nombre', 'primer_apellido', 'segundo_apellido', 'segundo_nombre'], 'string', 'max' => 20],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_user' => 'Id User',
            'correo_electronico' => 'Correo Electronico',
            'cedula' => 'Cedula',
            'primer_nombre' => 'Primer Nombre',
            'primer_apellido' => 'Primer Apellido',
            'segundo_apellido' => 'Segundo Apellido',
            'segundo_nombre' => 'Segundo Nombre',
        ];
    }

    /**
     * Gets query for [[Autorizacions]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getAutorizacions()
    {
        return $this->hasMany(Autorizacion::className(), ['id_user' => 'id_user']);
    }

    /**
     * Gets query for [[OrdenSalidas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenSalidas()
    {
        return $this->hasMany(OrdenSalida::className(), ['id_user' => 'id_user']);
    }

    /**
     * Gets query for [[SolicitudBiens]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSolicitudBiens()
    {
        return $this->hasMany(SolicitudBien::className(), ['id_user' => 'id_user']);
    }
}
