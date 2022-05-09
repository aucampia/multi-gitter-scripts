#!/usr/bin/env bash

script_name="${0}"
script_dirname="$( dirname -- "${0}" )"
script_dirname_abs="$( readlink -f -- "${script_dirname}" )"
script_basename="$( basename -- "${0}" )"

lockfile=tmp-dockerlock-compose.json

set -eo pipefail

find_compose_files() {
    find . -regex '^.*/docker-compose[^/]*[.]\(yaml\|yml\)$' -print
}

rm -v "${lockfile}" || :

count=$(find_compose_files | wc -l)

if [ "${count}" -eq "0" ]
then
    1>&2 echo "No docker compose files"
    exit 0
fi

find_compose_files \
    | grep -v -E 'vendor/' \
    | sed 's/^.*$/--composefiles\n&/g' \
    | tee /dev/stderr \
    | tr '\n' '\000' \
    | xargs -t -0 --no-run-if-empty \
        docker-lock lock generate \
            --lockfile-name "${lockfile}" \
            --update-existing-digests \
            --exclude-all-dockerfiles \
            --exclude-all-kubernetesfiles

docker-lock lock rewrite --lockfile-name "${lockfile}"


rm -v "${lockfile}" || :
