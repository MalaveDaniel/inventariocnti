<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "bienes".
 *
 * @property int $id_bienes
 * @property int $id_modelo
 * @property int $id_tipo_bien
 * @property string $descripcion
 * @property string $numero_bien
 * @property string $serial
 * @property string $cantidad
 *
 * @property Modelo $modelo
 * @property TipoBien $tipoBien
 * @property OrdenDetalle[] $ordenDetalles
 * @property SolicitudBien[] $solicitudBiens
 */
class bienes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'bienes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_modelo', 'id_tipo_bien', 'descripcion', 'numero_bien', 'serial', 'cantidad'], 'required'],
            [['id_modelo', 'id_tipo_bien'], 'default', 'value' => null],
            [['id_modelo', 'id_tipo_bien'], 'integer'],
            [['descripcion', 'numero_bien', 'serial', 'cantidad'], 'string'],
            [['id_modelo'], 'exist', 'skipOnError' => true, 'targetClass' => Modelo::className(), 'targetAttribute' => ['id_modelo' => 'id_modelo']],
            [['id_tipo_bien'], 'exist', 'skipOnError' => true, 'targetClass' => Tipo_Bien::className(), 'targetAttribute' => ['id_tipo_bien' => 'id_tipo_bien']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_bienes' => 'Id Bienes',
            'id_modelo' => 'Id Modelo',
            'id_tipo_bien' => 'Id Tipo Bien',
            'descripcion' => 'Descripcion',
            'numero_bien' => 'Numero Bien',
            'serial' => 'Serial',
            'cantidad' => 'Cantidad',
        ];
    }

    /**
     * Gets query for [[Modelo]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelo()
    {
        return $this->hasOne(Modelo::className(), ['id_modelo' => 'id_modelo']);
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

    /**
     * Gets query for [[OrdenDetalles]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getOrdenDetalles()
    {
        return $this->hasMany(OrdenDetalle::className(), ['id_bienes' => 'id_bienes']);
    }

    /**
     * Gets query for [[SolicitudBiens]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSolicitudBiens()
    {
        return $this->hasMany(SolicitudBien::className(), ['id_bienes' => 'id_bienes']);
    }
}
