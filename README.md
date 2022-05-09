# ...

```bash
./dockerlock-compose-run.sh --dry-run --branch "dockerlock-compose-$(date +%YW%W)" -O coopnorge
```

```bash

multi-gitter run $(pwd)/docker-dependabot.sh --log-level=debug --pr-title "Enable dependabot for docker" --pr-body $'This repo contains a
Dockerfile but does not have dependabot enabled for docker.\n\n\nThis is done by a script, please merge this when approving.' -O coopnorge  --dry-run

multi-gitter run $(pwd)/docker-dependabot.sh --log-level=debug --pr-title "Enable dependabot for docker" --pr-body $'This repo contains a
Dockerfile but does not have dependabot enabled for docker.\n\n\nThis is done by a script, please merge this when approving.' -O coopnorge  --dry-run



## ...

multi-gitter run $(pwd)/pin-devtools-terraform-v1beta1.sh --log-level=debug --pr-title "Pin version of devtools-terraform-v1beta1" --pr-body "Plan is to use dependabot for getting new version eventually, but for now pinning this so upgrades can be done in a controlled fashion. This is done by a script, please merge this when approving." -O coopnorge  --dry-run
multi-gitter run $(pwd)/pin-devtools-terraform-v1beta1.sh --log-level=debug --pr-title "Pin version of devtools-terraform-v1beta1" --pr-body "Plan is to use dependabot for getting new version eventually, but for now pinning this so upgrades can be done in a controlled fashion. This is done by a script, please merge this when approving." --repo coopnorge/terraform-platform-teams  --dry-run
```
