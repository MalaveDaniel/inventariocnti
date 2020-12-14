<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "planes".
 *
 * @property int $id_planes
 * @property string $nombre_planes
 *
 * @property PlanesTelefono[] $planesTelefonos
 */
class planes extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'planes';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['nombre_planes'], 'required'],
            [['nombre_planes'], 'string'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_planes' => 'Id Planes',
            'nombre_planes' => 'Nombre Planes',
        ];
    }

    /**
     * Gets query for [[PlanesTelefonos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getPlanesTelefonos()
    {
        return $this->hasMany(PlanesTelefono::className(), ['id_planes' => 'id_planes']);
    }
}
