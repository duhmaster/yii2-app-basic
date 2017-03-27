#!/bin/sh

BASE_DIR=$(dirname "$(readlink -f "$0")")
HOST_IP=""
DUMP_PATH=""

if [ $1 ]; then
    HOST_IP=$1
else
    HOST_IP=127.0.0.1
fi

if [ $2 ]; then
    DUMP_PATH=$2
else
    DUMP_PATH=$BASE_DIR/dump
fi

echo "HOST_IP_ADDRESS=$HOST_IP" > .env
echo "DUMP_PATH=$DUMP_PATH" >> .env

printf "\n=============================\n"
printf "Starting services ...\n"
printf "=============================\n"
docker-compose -f $BASE_DIR/docker-compose.yml up -d --build

printf "\n=============================\n"
printf "Waiting initialization...\n"
printf "=============================\n"
count=0
total=10
pstr="[##################################################################]"

while [ $count -lt $total ]; do
  sleep 0.5 # this is work
  count=$(( $count + 1 ))
  pd=$(( $count * 73 / $total ))
  printf "\r%3d.%1d%% %.${pd}s" $(( $count * 100 / $total )) $(( ($count * 1000 / $total) % 10 )) $pstr
done
printf "\n"

printf "\n=============================\n"
printf "Start import dump ...\n"
printf "=============================\n"
docker-compose -f $BASE_DIR/docker-compose.yml exec db sh /import_dump.sh

printf "\n=============================\n"
printf "Start execute migrations ...\n"
printf "=============================\n"
docker-compose -f $BASE_DIR/docker-compose.yml exec web php /var/www/app/protected/yiic migrate
printf "\n=============================\n"
printf "App started\n"
printf "=============================\n"