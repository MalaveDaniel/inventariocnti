<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "marca".
 *
 * @property int $id_marca
 * @property string $nombre_marca
 *
 * @property Modelo[] $modelos
 */
class marca extends \yii\db\ActiveRecord
{
    /**
     * {@inheritdoc}
     */
    public static function tableName()
    {
        return 'marca';
    }

    /**
     * {@inheritdoc}
     */
    public function rules()
    {
        return [
            [['id_marca', 'nombre_marca'], 'required'],
            [['id_marca'], 'default', 'value' => null],
            [['id_marca'], 'integer'],
            [['nombre_marca'], 'string'],
            [['id_marca'], 'unique'],
        ];
    }

    /**
     * {@inheritdoc}
     */
    public function attributeLabels()
    {
        return [
            'id_marca' => 'Id Marca',
            'nombre_marca' => 'Nombre Marca',
        ];
    }

    /**
     * Gets query for [[Modelos]].
     *
     * @return \yii\db\ActiveQuery
     */
    public function getModelos()
    {
        return $this->hasMany(Modelo::className(), ['id_marca' => 'id_marca']);
    }
}
