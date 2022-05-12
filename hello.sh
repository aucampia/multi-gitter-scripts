#!/usr/bin/env bash

script_name="${0}"
script_dirname="$( dirname -- "${0}" )"
script_dirname_abs="$( readlink -f -- "${script_dirname}" )"
script_basename="$( basename -- "${0}" )"

touch hello.world
