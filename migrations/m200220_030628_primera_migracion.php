<?php

use yii\db\Migration;

/**
 * Class m200220_030628_primera_migracion
 */
class m200220_030628_primera_migracion extends Migration
{
    /**
     * {@inheritdoc}
     */
    public function safeUp()
    {

    }

    /**
     * {@inheritdoc}
     */
    public function safeDown()
    {
        echo "m200220_030628_primera_migracion cannot be reverted.\n";

        return false;
    }

    /*
    // Use up()/down() to run migration code without a transaction.
    public function up()
    {

    }

    public function down()
    {
        echo "m200220_030628_primera_migracion cannot be reverted.\n";

        return false;
    }
    */
}
