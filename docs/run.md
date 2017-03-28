# Установка окружения и запуск приложения

[Назад](/README.md)

Подготовка:
- Установить docker (http://bfy.tw/AhnJ)
- Установить docker-compose (http://bfy.tw/AhnE)
- Выполнить команду: sudo printf '\n127.0.0.1   app.local\n' >> /etc/hosts
- Освободить порты 80, 25, 1080, 5050

## Backend (php7.0+apache+postgres9.5)

Запуск:

```sh docker/run.sh```

 - Необязательный параметр. IP хост машины. нужен чтобы заработал дебаг.
 - Необязательный параметр. Путь до папки, где лежит дамп базы, 
 который нужно залить при старте сервиса.

Остановка:

```sh docker/run.sh``` 

Результат можно посомтреть тут: http://app.local

Дебаг:
- PhpStorm -> Settings -> Languages & Frameworks -> PHP - выбрать 7 версию пхп
- PhpStorm -> Settings -> Languages & Frameworks -> PHP -> Debug полу Debug port должно содержать значение 9000
- PhpStorm -> Settings -> Languages & Frameworks -> PHP -> Debug -> DBGp proxy
в качестве IDE key указать PHPSTORM, 
в качестве Host указать IP адрес хост машины, 
поле Порт должно содержать значение 9000.

PgAdmin:
- доступен тут: http://app.local:5050

MaileDev:
- доступен тут: http://app.local:1080
