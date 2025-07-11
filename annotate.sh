#!/usr/bin/env bash

set -euo pipefail

counter=0
for node in $(kubectl get nodes -o name); do
		counter=$((counter + 1))
		kubectl annotate --overwrite "$node" \
			k8s.ovn.org/transport-zones="[\"tz$counter\"]"
done

echo "Annotated $counter nodes with transport zones."
