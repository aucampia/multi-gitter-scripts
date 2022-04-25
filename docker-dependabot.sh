#!/usr/bin/env bash

script_name="${0}"
script_dirname="$( dirname -- "${0}" )"
script_dirname_abs="$( readlink -f -- "${script_dirname}" )"
script_basename="$( basename -- "${0}" )"


set -eo pipefail

dockerfiles_count=$(find . -mindepth 1 -maxdepth 1 \( -name 'Dockerfile' -o -name '*.Dockerfile' -o -name 'Dockerfile.*' \) | wc -l)

if [ "${dockerfiles_count}" -eq "0" ]
then
    1>&2 echo "No Dockerfiles"
    exit 0
fi

dependabot_file="$(find .github/dependabot.yaml .github/dependabot.yml 2>/dev/null || :)"

if [ -z "${dependabot_file}" ]
then
    1>&2 echo "Creating dependabot file for docker"
    mkdir -vp .github/
    cp "${script_dirname_abs}/dependabot-docker-root.yaml" .github/dependabot.yml
    exit 0
fi

dependabot_docker_count=$(yq -o json '[.updates[] | select(."package-ecosystem" == "docker" and .directory == "/")] | length' "${dependabot_file}")

1>&2 declare -p dependabot_docker_count dockerfiles_count

if [ "${dependabot_docker_count}" -lt 1 ]
then
    yq -i '.updates += [{"package-ecosystem": "docker", "directory": "/", "schedule": { "interval": "weekly", "day": "sunday" }}]' "${dependabot_file}"
fi
