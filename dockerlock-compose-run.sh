#!/usr/bin/env bash

script_name="${0}"
script_dirname="$( dirname -- "${0}" )"
script_dirname_abs="$( readlink -f -- "${script_dirname}" )"
script_basename="$( basename -- "${0}" )"


exec multi-gitter run "${script_dirname}/dockerlock-compose.sh" \
    --log-level=debug \
    --pr-title "Update/lock docker-compose image reference digests" \
    --pr-body \
$'
Update or lock docker image reference digests in docker-compose files.

**IMPORTANT**: This PR is made by a script, please merge after approving.
' \
    "${@}"
