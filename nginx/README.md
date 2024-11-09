# NGINX c возможностью блокировки POST запросов
## Сборка и запуск

Сборка образа (из директории docker):

`docker build -t nginx_deny_post .`

Запуск образа.
С блокировкой POST запросов:

`docker run -d -e DENY_POST=true -p 8080:8080 nginx_deny_post`

Без блокировки POST запросов:

`docker run -d -p 8080:8080 nginx_deny_post`
