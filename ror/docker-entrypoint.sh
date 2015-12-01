#!/bin/bash
set -e

RESETBUNDLE=1
[[ "$1" = "-k" ]] && RESETBUNDLE=0 && shift

pushd /app >/dev/null
(( RESETBUNDLE == 1 )) && rm -rf vendor/bundle
bundle install --path vendor/bundle
bin/rails $*
popd >/dev/null
