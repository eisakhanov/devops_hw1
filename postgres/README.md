# Postgres c пользователем и БД "test"

## Сборка и запуск

Сборка образа (из директории docker):

`docker build -t postgres_test .`

Запуск образа:

`docker run -d -e POSTGRES_PASSWORD=superpass -e POSTGRES_TEST_USER_PASSWORD=testpass -p 5432:5432 postgres_test`

## Примечание

Образ создан с учетом того, что нам нужен не суперпользователь.

В случае, если нужен суперпользователь, проще воспользоваться переменной 'POSTGRES_USER` (https://hub.docker.com/_/postgres):

> POSTGRES_USER
>
> This optional environment variable is used in conjunction with POSTGRES_PASSWORD to set a user and its password. This variable will create the specified user with superuser power and a database with the same name. If it is not specified, then the default user of postgres will be used.

