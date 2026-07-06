# Monitoring & Observability with Prometheus, Grafana, Loki & Promtail

## Project Overview

This project demonstrates a complete Monitoring & Observability stack deployed on an AWS EC2 Ubuntu server using Docker Compose.

The objective was to monitor server resources, container metrics, and centralized system logs using open-source monitoring tools.

# Deployment Workflow

```text
AWS Console
    │
    ▼
Launch Ubuntu EC2 Instance
    │
    ▼
Connect to EC2 via SSH
    │
    ▼
Update Ubuntu Packages
    │
    ▼
Install Docker Engine
    │
    ▼
Install Docker Compose
    │
    ▼
Clone GitHub Repository
    │
    ▼
Navigate to Project Directory
    │
    ▼
Configure Monitoring Stack
    │
    ├── docker-compose.yml
    ├── prometheus/prometheus.yml
    ├── loki/config.yml
    ├── promtail/config.yml
    └── grafana/provisioning/datasources/datasource.yml
    │
    ▼
Start All Containers
    │
    ▼
docker compose up -d
    │
    ▼
Verify Running Containers
    │
    ▼
docker compose ps
    │
    ▼
Verify Prometheus Targets
    │
    ▼
http://52.221.231.96:9090
    │
    ▼
Verify Grafana
    │
    ▼
http://52.221.231.96:3000
    │
    ▼
Configure & Verify Datasources
    │
    ▼
Prometheus ✓
Loki ✓
    │
    ▼
Verify Node Exporter
    │
    ▼
http://52.221.231.96:9100/metrics
    │
    ▼
Verify cAdvisor
    │
    ▼
http://52.221.231.96:8080
    │
    ▼
Monitoring Stack Successfully Deployed ✅

## Technologies Used

- AWS EC2
- Ubuntu Server
- Docker
- Docker Compose
- Prometheus
- Grafana
- Loki
- Promtail
- Node Exporter
- cAdvisor
- Git
- GitHub

# Project Structure

```
07-monitoring-observability/
│
├── docker-compose.yml
├── prometheus/
│   └── prometheus.yml
├── grafana/
│   └── provisioning/
│       └── datasources/
│           └── datasource.yml
├── loki/
│   └── config.yml
├── promtail/
│   └── config.yml
├── screenshots/
└── README.md
```


# AWS EC2 Setup

Created an Ubuntu EC2 instance.

Connected using SSH.

```bash
ssh -i monitoring-server.pem ubuntu@<EC2-PUBLIC-IP>
```


# Update Server

```bash
sudo apt update
sudo apt upgrade -y
```

# Install Docker

```bash
curl -fsSL https://get.docker.com | sh
```

Add current user into Docker group.

```bash
sudo usermod -aG docker ubuntu
```

Enable Docker.

```bash
sudo systemctl enable docker
sudo systemctl start docker
```

Verify installation.

```bash
docker --version
docker compose version
```

# Clone Repository

```bash
git clone https://github.com/Naeem3295/Devops-hands-on-lab.git
```

```bash
cd Devops-hands-on-lab/07-monitoring-observability
```

# Configure Monitoring Stack

Configured Docker Compose services.

- Grafana
- Prometheus
- Loki
- Promtail
- Node Exporter
- cAdvisor


# Configure Prometheus

Created

```
prometheus/prometheus.yml
```

Configured scrape targets for

- Prometheus
- Node Exporter
- cAdvisor


# Configure Loki

Created

```
loki/config.yml
```

Configured

- TSDB storage
- Filesystem backend
- In-memory ring
- Log storage


# Configure Promtail

Created

```
promtail/config.yml
```

Configured Promtail to collect

```
/var/log/*.log
```

and forward logs to Loki.


# Configure Grafana Datasources

Configured

```
grafana/provisioning/datasources/datasource.yml
```

Added

- Prometheus
- Loki

as Grafana Datasources.

---

# Start Monitoring Stack

```bash
docker compose up -d
```

# Verify Running Containers

```bash
docker compose ps


Expected services

- Grafana
- Prometheus
- Loki
- Promtail
- Node Exporter
- cAdvisor


# Verify Prometheus

Open

```
http://<EC2-PUBLIC-IP>:9090
```

Verify

Status

↓

Targets

All targets should be **UP**.


# Verify Grafana


http://52.221.231.96:3000


Default Login

Username

admin

Password

admin

# Verify Loki

Connections

↓

Data Sources

↓

Loki

Verify

Data source successfully connected


# Verify Node Exporter

http://52.221.231.96:9100/metrics


# Verify cAdvisor

http://52.221.231.96:8080


# Monitoring Components

| Component | Purpose |
|-----------|---------|
| Prometheus | Metrics Collection |
| Grafana | Visualization |
| Node Exporter | Linux Host Metrics |
| cAdvisor | Docker Container Metrics |
| Loki | Log Aggregation |
| Promtail | Log Collector |


# Project Outcome

Successfully deployed a complete Monitoring & Observability stack on AWS EC2 using Docker Compose.

Implemented:

- Infrastructure Monitoring
- Container Monitoring
- Centralized Log Collection
- Metrics Visualization
- Docker-based Deployment
- Automated Grafana Datasources


