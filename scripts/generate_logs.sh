#!/usr/bin/env bash

set -euo pipefail

OUTPUT="incidents/01-disk-full/evidence/simulated-app.log"

mkdir -p "$(dirname "$OUTPUT")"

for i in $(seq 1 1000); do
    printf '%s | ERROR | Simulated application log entry %04d\n' \
        "$(date '+%Y-%m-%d %H:%M:%S')" "$i"
done > "$OUTPUT"

echo "Log de teste criado: $OUTPUT"
du -h "$OUTPUT"
