#!/bin/bash
cmd=$1
# ./loop.sh "docker exec -it $(docker ps | grep mysql | awk '{print $1}') mysql -uroot -proot -e 'show processlist' | wc -l"
# docker exec -it $(docker ps | grep mysql | awk '{print $1}') mysql -uroot -proot -e 'show processlist' | wc -l
# docker exec -it $(docker ps | grep redis | awk '{print $1}') redis-cli -a root info | grep connected_clients
while true;
do
	sh -c "$cmd";
	sleep 0.5;
done
