#!/usr/bin/env bash

script_name="${0}"
script_dirname="$( dirname -- "${0}" )"
script_dirname_abs="$( readlink -f -- "${script_dirname}" )"
script_basename="$( basename -- "${0}" )"


exec multi-gitter run "${script_dirname}/hello.sh" \
    --git-type=cmd \
    --log-level=debug \
    --pr-title "test" \
    --pr-body \
$'
Update or lock docker image reference digests in docker-compose files.

Dependabot currently does not support docker-compose files. This
is a workaround until we figure out a more permanent solution to this problem.

**IMPORTANT**: This PR is made by a script, please merge after approving.
' \
    "${@}"
