# Project Sentinel

A practical DevOps and Cloud Engineering laboratory designed to simulate real-world infrastructure incidents, troubleshooting scenarios, automation workflows, and operational challenges.

The goal of this project is to build hands-on experience with Linux, Bash, Git, Docker, CI/CD, Cloud Platforms, Infrastructure as Code, Monitoring, and Site Reliability Engineering practices.

---

## Author

**Ricardo de Almeida Benjamim**

Aspiring DevOps Engineer | Cloud Engineer | Cybersecurity Student

---

## Project Goals

This project was created to develop practical skills in:

- Linux Administration
- Bash Scripting
- Incident Response
- Troubleshooting
- Git & GitHub
- Containerization
- CI/CD
- AWS Cloud
- Terraform
- Kubernetes
- Monitoring & Observability

---

## Incident Library

### Incident #001 - Disk Full

**Status:** ✅ Completed

#### Scenario

A Linux server begins experiencing performance degradation after disk utilization reaches critical levels.

#### Investigation

- Log analysis
- Error identification
- Warning correlation
- Root cause investigation

#### Root Cause

Application log rotation failed, causing excessive log growth and disk consumption.

#### Resolution

A monitoring script was developed to:

- Detect excessive errors
- Alert when thresholds are exceeded
- Handle missing log files
- Support automated testing

#### Skills Demonstrated

- Linux Troubleshooting
- Log Analysis
- Bash Scripting
- Error Handling
- Automated Testing

---

## Current Progress

### Completed ✅

- Linux Fundamentals
- Incident Investigation
- Bash Automation
- Log Analysis
- Error Handling
- Automated Tests

### In Progress 🔄

- Git & GitHub
- Service Monitoring

### Planned 🚀

- Docker
- CI/CD Pipelines
- AWS
- Terraform
- Monitoring Stack
- Kubernetes
- DevSecOps Controls

---

## Automated Testing

Current test coverage validates:

- Excessive error detection
- Missing log file handling
- Error count below threshold
- Empty log file handling

Current Results:

```text
4 Passed
0 Failed
```

---

## Project Structure

```text
project/
├── incidents/
│   └── 01-disk-full/
│
├── scripts/
│   ├── check_logs.sh
│   └── check_logs_test.sh
│
└── README.md
```

---

## Run the Monitoring Script

```bash
bash scripts/check_logs.sh
```

---

## Run the Automated Tests

```bash
bash scripts/check_logs_test.sh
```

---

## Roadmap

### Phase 1 - Linux & Automation
- [x] Incident Investigation
- [x] Bash Monitoring
- [x] Automated Tests

### Phase 2 - Operations
- [ ] Service Outage Investigation
- [ ] Process Monitoring
- [ ] Network Troubleshooting

### Phase 3 - Containerization
- [ ] Docker
- [ ] Multi-Container Environment

### Phase 4 - DevOps
- [ ] CI/CD Pipeline
- [ ] GitHub Actions

### Phase 5 - Cloud Engineering
- [ ] AWS Deployment
- [ ] Terraform Infrastructure

### Phase 6 - Platform Engineering
- [ ] Kubernetes
- [ ] Monitoring & Observability
