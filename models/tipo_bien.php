<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "tipo_bien".
 *
 * @property int $id_tipo_bien
 * @property string $nombre_tipo_bien
 *
 * @property Bienes[] $bienes
 * @property SolicitudBien[] $solicitudBiens
 */
class tipo_bien extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'tipo_bien';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_tipo_bien', 'nombre_tipo_bien'], 'required'],
            [['id_tipo_bien'], 'default', 'value' => null],
            [['id_tipo_bien'], 'integer'],
            [['nombre_tipo_bien'], 'string'],
            [['id_tipo_bien'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_tipo_bien' => 'Id Tipo Bien',
            'nombre_tipo_bien' => 'Nombre Tipo Bien',
        ];
    }

    /**
     * Gets query for [[Bienes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBienes()
    {
        return $this->hasMany(Bienes::className(), ['id_tipo_bien' => 'id_tipo_bien']);
    }

    /**
     * Gets query for [[SolicitudBiens]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getSolicitudBiens()
    {
        return $this->hasMany(SolicitudBien::className(), ['id_tipo_bien' => 'id_tipo_bien']);
    }
}
