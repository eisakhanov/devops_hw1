#!/bin/bash

set -e

# Проверка на то, что пользователь задал пароль для пользователя "test"
if [[ -z "${POSTGRES_TEST_USER_PASSWORD}" ]]; then
    printf >&2 'Error: "test" user password is not specified.\n'
    printf >&2 '    You must specify POSTGRES_TEST_USER_PASSWORD to a non-empty value for the\n'
    printf >&2 '    "test" user. For example, "-e POSTGRES_TEST_USER_PASSWORD=password" on "docker run".\n'
    exit 1
fi

# Создание пользователя "test" и базы данных "test" с выдачей прав
psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<-EOSQL
	CREATE USER test WITH PASSWORD '$POSTGRES_TEST_USER_PASSWORD';
	CREATE DATABASE test;
	GRANT ALL PRIVILEGES ON DATABASE test TO test;
EOSQL
