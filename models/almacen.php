<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "almacen".
 *
 * @property int $id_almacen
 * @property string $nombre_almacen
 *
 * @property OrdenSalida[] $ordenSalidas
 * @property SolicitudBien[] $solicitudBiens
 */
class almacen extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'almacen';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre_almacen'], 'required'],
            [['nombre_almacen'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_almacen' => 'Id Almacen',
            'nombre_almacen' => 'Nombre Almacen',
        ];
    }

    /**
     * Gets query for [[OrdenSalidas]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenSalidas()
    {
        return $this->hasMany(OrdenSalida::className(), ['id_almacen' => 'id_almacen']);
    }

    /**
     * Gets query for [[SolicitudBiens]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSolicitudBiens()
    {
        return $this->hasMany(SolicitudBien::className(), ['id_almacen' => 'id_almacen']);
    }
}
