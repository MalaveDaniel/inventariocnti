<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tarifas_adicionales".
 *
 * @property int $id_tarifas_adicionales
 * @property string $nombre_traifas_adicionales
 * @property bool $estado_tarifas
 *
 * @property Telefono[] $telefonos
 */
class tarifas_adicionales extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tarifas_adicionales';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre_traifas_adicionales', 'estado_tarifas'], 'required'],
            [['nombre_traifas_adicionales'], 'string'],
            [['estado_tarifas'], 'boolean'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_tarifas_adicionales' => 'Id Tarifas Adicionales',
            'nombre_traifas_adicionales' => 'Nombre Traifas Adicionales',
            'estado_tarifas' => 'Estado Tarifas',
        ];
    }

    /**
     * Gets query for [[Telefonos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getTelefonos()
    {
        return $this->hasMany(Telefono::className(), ['id_tarifas_adicionales' => 'id_tarifas_adicionales']);
    }
}
