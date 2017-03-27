<?php

return [
    'components' => [
	'db' => [
            'class' => 'yii\db\Connection',
	    'dsn' => 'pgsql:host=db;dbname=app_database',
	    'username' => 'app_user',
            'password' => 'app_user',
	    'charset' => 'utf8',
	],
    ]
];
