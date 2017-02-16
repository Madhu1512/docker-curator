#!/bin/bash

set -e

params=""
if [ "$1" = 'curator_cli' ]; then
  [ ! -z "$SSL_ENABLED" ] && params='--use_ssl'
  [ ! -z "$ELASTICSEARCH_USER_PASS" ] && params="${params} --http_auth ${ELASTICSEARCH_USER_PASS}"
  [ ! -z "$ELASTICSEARCH_HOST" ] && params="${params} --host ${ELASTICSEARCH_HOST}"
  [ ! -z "$ELASTICSEARCH_PORT" ] && params="${params} --port ${ELASTICSEARCH_PORT}"
  shift
        set -- "$@"
  $(echo curator_cli "${params}" "$@")
fi

if [ "$1" = 'bash' ]; then
  shift
        set -- "$@"
  eval "$@"
fi
