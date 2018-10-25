#!/bin/sh


docker-compose -f mock-env-compose.yml up -d
for var in appserver1 appserver2 appserver3 static_server persistence_server
do
   docker exec ansible /root/deploy/copy_id.expect root $var devops2018
done

docker cp ansible.hosts ansible:/etc/ansible/hosts
