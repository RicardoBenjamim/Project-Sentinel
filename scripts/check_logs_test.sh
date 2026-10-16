#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd -- "$(dirname -- "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(cd -- "$SCRIPT_DIR/.." && pwd)"

MONITOR="$PROJECT_ROOT/scripts/check_logs.sh"
TEST_DIR="$(mktemp -d)"

trap 'rm -rf "$TEST_DIR"' EXIT

PASS=0
FAIL=0

run_test() {
    local name="$1"
    local expected="$2"
    local actual=0

    shift 2
    if "$@" >/dev/null 2>&1; then
        actual=0
    else
        actual=$?
    fi

    if [[ "$actual" -eq "$expected" ]]; then
        echo "PASS: $name"
        ((PASS+=1))
    else
        echo "FAIL: $name (expected exit $expected, got $actual)"
        ((FAIL+=1))
    fi
}

echo "Project Sentinel - Automated Tests"
echo

# Test 1: Monitor detects excessive errors
cp "$MONITOR" "$TEST_DIR/check_logs.sh"

echo "ERROR" > "$TEST_DIR/log.txt"
for i in $(seq 1 100); do
    echo "ERROR" >> "$TEST_DIR/log.txt"
done

sed "s|LOG_FILE=.*|LOG_FILE=\"$TEST_DIR/log.txt\"|" \
    "$MONITOR" > "$TEST_DIR/check_logs.sh"
chmod +x "$TEST_DIR/check_logs.sh"

run_test "Excessive errors trigger alert" 2 "$TEST_DIR/check_logs.sh"

# Test 2: Missing log file
sed "s|LOG_FILE=.*|LOG_FILE=\"$TEST_DIR/missing.log\"|" \
    "$MONITOR" > "$TEST_DIR/check_logs.sh"
chmod +x "$TEST_DIR/check_logs.sh"

run_test "Missing log file is detected" 1 "$TEST_DIR/check_logs.sh"
# Test 3: Error count below threshold
printf 'INFO Application started\nERROR A minor issue occurred\n' \
    > "$TEST_DIR/log.txt"

sed "s|LOG_FILE=.*|LOG_FILE=\"$TEST_DIR/log.txt\"|" \
    "$MONITOR" > "$TEST_DIR/check_logs.sh"
chmod +x "$TEST_DIR/check_logs.sh"

run_test "Errors below threshold do not trigger alert" 0 \
    "$TEST_DIR/check_logs.sh"

# Test 4: Empty log file
: > "$TEST_DIR/log.txt"

run_test "Empty log file is handled correctly" 0 \
    "$TEST_DIR/check_logs.sh"
echo
echo "Results: $PASS passed, $FAIL failed"

[[ "$FAIL" -eq 0 ]]
