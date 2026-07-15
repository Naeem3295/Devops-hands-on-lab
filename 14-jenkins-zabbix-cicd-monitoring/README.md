# Project 14: Jenkins CI/CD Pipeline & Zabbix Monitoring

## Overview

This project demonstrates a complete CI/CD pipeline using Jenkins and system monitoring using Zabbix on AWS EC2.

The objective is to automate application deployment and monitor server health by integrating Jenkins, Docker, and Zabbix.

---

## Architecture

GitHub Repository
        │
        ▼
     Jenkins
        │
        ▼
 Build → Test → Deploy
        │
        ▼
 Docker Container
        │
        ▼
     Zabbix Agent
        │
        ▼
   Zabbix Server
        │
        ▼
   Zabbix Dashboard

---

## Technologies Used

- AWS EC2 (Ubuntu 26.04)
- Jenkins
- Docker
- Git & GitHub
- Node.js
- Zabbix Server
- Zabbix Agent 2
- MySQL 8
- Linux

---

## Project Structure


14-jenkins-zabbix-cicd-monitoring/
│
├── Dockerfile
├── Jenkinsfile
├── app.js
├── package.json
├── test.sh
└── README.md


---

## Jenkins Pipeline Stages

### Stage 1 – Checkout

- Pull source code from GitHub

### Stage 2 – Build

- Build application

### Stage 3 – Test

- Execute dummy test script

### Stage 4 – Deploy

- Build Docker image
- Run Docker container

---

## Zabbix Monitoring

Configured monitoring includes:

- CPU Monitoring
- Memory Monitoring
- Linux Host Monitoring
- Custom High CPU Trigger (>80%)

---

## Docker Containers

- Jenkins Demo Application
- MySQL
- Zabbix Server
- Zabbix Web
- Zabbix Java Gateway
- Zabbix Agent

---

## Learning Outcomes

- Configure Jenkins Pipeline
- Automate CI/CD workflow
- Deploy applications using Docker
- Configure Zabbix monitoring
- Monitor CPU and Memory usage
- Create alert triggers

---

Report

Jenkins CI/CD Pipeline and Zabbix Monitoring Report
Name

Md Naeem

Project Title

Automating Application Deployment using Jenkins and Monitoring System Health using Zabbix

Objective

The objective of this project was to automate application deployment using Jenkins CI/CD Pipeline and monitor server health using Zabbix. The implementation was completed on an AWS EC2 Ubuntu server using Docker containers.

Part 1 – Jenkins CI/CD Pipeline

The following tasks were completed:

Installed Jenkins on AWS EC2
Connected Jenkins with GitHub repository
Created a Declarative Pipeline
Pulled source code from GitHub
Executed Build stage
Executed Test stage
Built Docker image
Deployed Docker container successfully

Pipeline stages:

Checkout
Build
Test
Deploy

The pipeline executed successfully and deployed the application into a Docker container.

Part 2 – Zabbix Monitoring

The monitoring environment was deployed using Docker containers.

Installed components:

MySQL
Zabbix Server
Zabbix Web
Zabbix Java Gateway
Zabbix Agent

Configured monitoring:

Linux Host
CPU Monitoring
Memory Monitoring
High CPU Usage Trigger (>80%)

The Zabbix dashboard successfully displayed server metrics and trigger configuration.

Challenges Faced

During implementation several challenges were encountered:

Jenkins Git authentication failed due to GitHub password authentication removal.
SSH authentication was configured initially, then GitHub Personal Access Token (PAT) was used successfully.
Jenkins Docker permission issues were resolved by adding the Jenkins user to the Docker group.
Jenkins workspace path required modification because the project existed inside a subdirectory.
Zabbix Agent interface configuration required additional troubleshooting before the host became available.
Key Learning

Through this project I learned:

Jenkins pipeline creation
GitHub integration with Jenkins
Docker deployment automation
Continuous Integration and Continuous Deployment (CI/CD)
Zabbix monitoring configuration
CPU and Memory monitoring
Alert trigger creation
Troubleshooting real-world DevOps deployment issues
