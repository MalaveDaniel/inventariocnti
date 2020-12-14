<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "modelo".
 *
 * @property int $id_modelo
 * @property int $id_marca
 * @property string $nombre_modelo
 *
 * @property Bienes[] $bienes
 * @property Marca $marca
 */
class modelo extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'modelo';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_marca', 'nombre_modelo'], 'required'],
            [['id_marca'], 'default', 'value' => null],
            [['id_marca'], 'integer'],
            [['nombre_modelo'], 'string'],
            [['id_marca'], 'exist', 'skipOnError' => true, 'targetClass' => Marca::className(), 'targetAttribute' => ['id_marca' => 'id_marca']],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_modelo' => 'Id Modelo',
            'id_marca' => 'Id Marca',
            'nombre_modelo' => 'Nombre Modelo',
        ];
    }

    /**
     * Gets query for [[Bienes]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getBienes()
    {
        return $this->hasMany(Bienes::className(), ['id_modelo' => 'id_modelo']);
    }

    /**
     * Gets query for [[Marca]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getMarca()
    {
        return $this->hasOne(Marca::className(), ['id_marca' => 'id_marca']);
    }
}
