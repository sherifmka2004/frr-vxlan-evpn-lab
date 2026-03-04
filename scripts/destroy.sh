#!/usr/bin/env bash
# destroy.sh — tear down the lab
set -euo pipefail
cd /opt/frr-lab
containerlab destroy -t topology.yml --cleanup
echo "Lab destroyed."
