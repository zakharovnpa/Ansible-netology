#!/usr/bin/env bash
#
# Скрипт для запуска контейнеров docker и запуска ansible-playbook

date >> ansible.log &&		# Запись даты выполнения скрипта
docker run -d --rm --name centos7 eeb6ee3f44bd sleep 60000000 && 	# Старт нового контейнера с именем centos7 на основе образа eeb6ee3f44bd
docker run -d --rm --name fedore c31790496329 sleep 60000000 &&		# Аналогично для fedore
docker run -d --rm --name ubuntu 42a4e3b21923 sleep 60000000 &&		# Аналогично для ubuntu

	sleep 3 &&				# Выполнить остановку скрипта на 3 секунды
	docker ps | grep 'Up' && 		# Вывод на терминал контейнеров, которые запустились
	sleep 10 &&				# Выполнить остановку скрипта на 10 секунд

ansible-playbook -i inventory/prod.yml site.yml --ask-vault-pass >> ansible.log && 	# Запуск playbook с запросом пароля на расшифровку файлов 
											# и запись результатов в файл ansible.log

docker stop centos7 &&		# Остановка и удаление уонтейнера с именем centos7
docker stop fedore &&		# Аналогично для fedore
docker stop ubuntu &&		# Аналогично для ubuntu

docker ps		# Вывод на терминал контейнеров, которые запустились
