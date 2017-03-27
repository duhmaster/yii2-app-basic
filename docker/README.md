# Docker for test: how to

Подготовка:
- Установить docker (http://bfy.tw/AhnJ)
- Установить docker-compose (http://bfy.tw/AhnE)
- Выполнить команду: sudo printf '\n127.0.0.1   test.local\n' >> /etc/hosts
- Освободить порты 80, 25, 1080, 5050

## Backend (php7.0+apache+postgres9.5)

Запуск:

```docker/compose/dev/php7.0+apache+postgres9.5/back/run.sh [#host_ip#] [#dump_path#]```

 - [#host_ip#] - Необязательный параметр. IP хост машины. нужен чтобы заработал дебаг.
 - [#ump_path#] - Необязательный параметр. Путь до папки, где лежит дамп базы, 
 который нужно залить при старте сервиса. По умолчанию дам ищеться в папке 
 docker/compose/dev/php7.0+apache+postgres9.5/back/dump 

Остановка:

```docker/compose/dev/php7.0+apache+postgres9.5/back/stop.sh``` 

Результат можно посомтреть тут: http://test.local

Дебаг:
- PhpStorm -> Settings -> Languages & Frameworks -> PHP - выбрать 7 версию пхп
- PhpStorm -> Settings -> Languages & Frameworks -> PHP -> Debug полу Debug port должно содержать значение 9000
- PhpStorm -> Settings -> Languages & Frameworks -> PHP -> Debug -> DBGp proxy
в качестве IDE key указать PHPSTORM, 
в качестве Host указать IP адрес хост машины, 
поле Порт должно содержать значение 9000.

PgAdmin:
- доступен тут: http://test.local:5050

MaileDev:
- доступен тут: http://test.local:1080