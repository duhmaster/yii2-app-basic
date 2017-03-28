#!/usr/bin/env bash
BASE_DIR=$(dirname "$(readlink -f "$0")")

echo "============================="
echo "Выберите действие:"
echo "1 - Запуск набора для backend"
echo "2 - Запуск набора для frontend"
echo "3 - Запуск набора для test"
echo "4 - Остановить запущенные контейнеры"
echo "5 - Удалить контейнеры"
echo "6 - Выход"
echo "============================="
read doing
if [ "$doing" -le 3 ]; then
    echo "============================="
    echo "Введите ip хоста (enter чтобы использовать 127.0.0.1):"
    read host_ip
    echo "============================="
    echo "Введите путь к дампу (enter чтобы оставить пустым):"
    read dump
fi
if [ $host_ip -z ]; then
    host_ip=127.0.0.1
fi
case $doing in
1)
sh $BASE_DIR/compose/dev/php7.0+apache+postgres9.5/app-back/run.sh ${host_ip} ${dump}
;;
2)
sh $BASE_DIR/compose/dev/php7.0+apache+postgres9.5/app-front/run.sh ${host_ip} ${dump}
;;
3)
sh $BASE_DIR/compose/dev/php7.0+apache+postgres9.5/app-test/run.sh ${host_ip} ${dump}
;;
4)
echo "Останавливаем"
$BASE_DIR/compose/dev/php7.0+apache+postgres9.5/app-back/stop.sh # если $doing содержит 3, то запустить run.sh для тестирования
;;
5)
echo "Удаляем контейнеры"
docker rm -f $(docker ps -f "name=appback_|apptest_|appfront_" -q)
;;
6)
echo "Покеда!"
exit 0
;;
*) #если введено с клавиатуры то, что в case не описывается, выполнять следующее:
echo "Введено неправильное действие"
esac #окончание оператора case.