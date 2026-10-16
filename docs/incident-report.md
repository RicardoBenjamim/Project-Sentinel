# Incident Report 001 — Excessive Application Logs

## 1. Incident Overview

**Incident type:** Simulated infrastructure incident  
**Severity:** Medium (simulated)  
**Status:** Investigated in a local lab

An application generated an excessive number of error log entries.
This scenario was created to practice Linux troubleshooting and
Bash automation.

## 2. Symptoms

- Repeated ERROR entries in the application log.
- A simulated log rotation failure.
- The log monitor detected more errors than the configured threshold.

## 3. Evidence

The simulated system log contains messages about:

- Application log rotation failure.
- Disk usage reaching 94% (simulated value).
- Excessive application log generation.

The generated application log contains 1,000 ERROR entries.

## 4. Investigation

Commands and scripts used:

- `grep` to locate and count errors.
- `tail` to inspect the most recent log entries.
- `du` to check file size.
- `scripts/check_logs.sh` to detect excessive errors.

## 5. Root Cause Hypothesis

The simulated evidence suggests a possible log rotation problem
combined with excessive application error logging.

The available evidence does not prove the exact underlying cause.

## 6. Remediation Plan

- Investigate why log rotation failed.
- Identify why the application is generating repeated errors.
- Configure log rotation and retention.
- Monitor log volume and disk usage.

## 7. Validation

The monitoring script detected 1,000 ERROR entries against a
configured threshold of 100 and triggered an alert.

A missing-file scenario was also tested.

## 8. Limitations

This is a local simulation. The 94% disk usage value is a log
message, not a measurement of actual disk usage.

No real production system was affected.
