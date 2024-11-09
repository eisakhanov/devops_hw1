#!/usr/bin/env sh

set -eu

# Решаем, нужна ли нам секция с блокировкой POST запросов
if [ "$DENY_POST" == "true" ]; then
    export DENY_POST_PLACE_HOLDER='
  if ($request_method = POST) {
    return 405;
  }'
else
    export DENY_POST_PLACE_HOLDER=''
fi

# Производим замену плейсхолдера в шаблоне
envsubst '${DENY_POST_PLACE_HOLDER}' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf

exec "$@"