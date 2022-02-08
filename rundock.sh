#!/usr/bin/env bash
#
# Скрипт для запуска контейнеров docker

docker run -d --rm --name centos7 eeb6ee3f44bd sleep 60000000 && 

docker run -d --rm --name fedore c31790496329 sleep 60000000 &&

docker run -d --rm --name ubuntu 42a4e3b21923 sleep 60000000 &&

	docker ps | grep 'Up' && 
	sleep 10 &&

ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass >> ansible.log && 

docker stop centos7 &&
docker stop fedore &&
docker stop ubuntu &&

docker ps

#sleep 20

#docker ps
