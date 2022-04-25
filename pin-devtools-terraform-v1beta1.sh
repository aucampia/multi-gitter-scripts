#!/usr/bin/env bash

set -eo pipefail


sed -E -i 's,ghcr.io/coopnorge/engineering-docker-images/e0/devtools-terraform-v1beta1:latest$,ghcr.io/coopnorge/engineering-docker-images/e0/devtools-terraform-v1beta1:latest@sha256:eca1ed4fff713cec694b4127c39618d21fc57f3f397c17ecbff0f6b23a722244,g' docker-compose.yaml
