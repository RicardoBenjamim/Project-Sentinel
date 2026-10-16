#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

LOG_FILE="$PROJECT_ROOT/incidents/01-disk-full/evidence/simulated-app.log"
THRESHOLD=100

if [[ ! -f "$LOG_FILE" ]]; then
    echo "ERROR: Log file not found: $LOG_FILE"
    exit 1
fi

ERROR_COUNT=$(grep -c "ERROR" "$LOG_FILE" || true)

echo "================================"
echo "       Project Sentinel"
echo "================================"
echo "Log file: $LOG_FILE"
echo "Errors found: $ERROR_COUNT"
echo "Configured threshold: $THRESHOLD"
echo

if (( ERROR_COUNT > THRESHOLD )); then
    echo "ALERT: Error count exceeds threshold!"
    exit 2
else
    echo "OK: Error count is within threshold."
fi
