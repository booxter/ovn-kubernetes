#!/usr/bin/env bash

set -euo pipefail

for node in $(kubectl get nodes -o name | grep ovn-worker2); do
		kubectl annotate --overwrite "$node" \
			k8s.ovn.org/transport-zones="[\"tz-worker\"]"
			#k8s.ovn.org/transport-zones="[\"tz$counter\"]"
done
