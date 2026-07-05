Kubernetes 3-Tier BMI Health Tracker

A production-style **3-Tier BMI Health Tracker** deployed on **AWS EC2** using **Docker** and **K3s Kubernetes**.

This project demonstrates how to deploy a containerized application using Kubernetes with a React frontend, Node.js backend, PostgreSQL database, Persistent Volumes, ConfigMaps, Secrets, StatefulSets, and Kubernetes Services.


## 📌 Project Overview

This project consists of three layers:

- 🎨 Frontend (React + Nginx)
- ⚙ Backend (Node.js + Express)
- 🗄 PostgreSQL Database

All components are deployed inside a **K3s Kubernetes Cluster** running on an **AWS EC2 Ubuntu Server**.


# 🌐 Live Application

**Application URL**

http://52.77.219.57:30080

# ☁ AWS Infrastructure

| Component | Details |
|-----------|---------|
| Cloud Provider | AWS EC2 |
| Region | ap-southeast-1 (Singapore) |
| OS | Ubuntu 24.04 LTS |
| Kubernetes | K3s |
| Container Runtime | Docker |
| Frontend | React + Nginx |
| Backend | Node.js + Express |
| Database | PostgreSQL 14 |
| Service Type | NodePort |
| NodePort | 30080 |


# 🏗 Architecture

                    Internet
                        │
                        ▼
             AWS EC2 Ubuntu Server
               52.77.219.57
                        │
                K3s Kubernetes
                        │
      ┌─────────────────┼─────────────────┐
      │                 │                 │
      ▼                 ▼                 ▼
Frontend Pods      Backend Pods      PostgreSQL
 (React+Nginx)    (Node.js API)      StatefulSet
      │                 │                 │
      └────────────┬────┘                 │
                   ▼                      │
             ClusterIP Service            │
                   │                      │
                   └──────────────┬───────┘
                                  ▼
                          Persistent Volume

# 🛠 Technology Stack

- AWS EC2
- Ubuntu 24.04
- Docker
- Kubernetes (K3s)
- React
- Nginx
- Node.js
- Express.js
- PostgreSQL
- Persistent Volume
- ConfigMap
- Secret
- StatefulSet
- Migration Job


# 📂 Project Structure

```
12-kubernetes-3tier-app/

├── backend/
├── frontend/
├── database/
├── docs/
│   └── screenshots/
├── k8s/
│   ├── backend/
│   ├── frontend/
│   ├── postgres/
│   └── namespace.yaml
└── README.md


# 🚀 Deployment Workflow

1. Launch AWS EC2 Ubuntu Instance
2. Install Docker
3. Build Backend Docker Image
4. Build Frontend Docker Image
5. Install K3s Kubernetes
6. Create Kubernetes Namespace
7. Deploy PostgreSQL
8. Run Database Migration Job
9. Deploy Backend
10. Deploy Frontend
11. Verify Pods and Services
12. Access Application via NodePort

# 🐳 Docker Images

| Image | Tag |
|------|------|
| bmi-backend | v1 |
| bmi-frontend | v1 |
| postgres | 14 |


# ☸ Kubernetes Resources

- Namespace
- Deployment
- StatefulSet
- Service
- ConfigMap
- Secret
- PersistentVolume
- PersistentVolumeClaim
- Migration Job
- NodePort Service


# 🌐 Kubernetes Services

| Service | Type | Port |
|---------|------|------|
| bmi-frontend-svc | NodePort | 30080 |
| bmi-backend-svc | ClusterIP | 3000 |
| bmi-postgres-svc | ClusterIP | 5432 |

---

# 🔍 Verification Commands

```bash
kubectl get nodes

kubectl get pods -n bmi-app

kubectl get svc -n bmi-app

kubectl get pvc -n bmi-app

kubectl get pv

kubectl get jobs -n bmi-app

kubectl logs deployment/bmi-backend -n bmi-app

kubectl logs postgres-0 -n bmi-app

# ✅ Deployment Status

| Component | Status |

| AWS EC2 | ✅ Running |
| Docker | ✅ Installed |
| K3s Cluster | ✅ Running |
| PostgreSQL | ✅ Running |
| Migration Job | ✅ Completed |
| Backend | ✅ Running |
| Frontend | ✅ Running |
| Application | ✅ Live |


# 📚 Skills Demonstrated

- Docker Image Creation
- Multi-stage Docker Build
- Kubernetes Deployments
- StatefulSets
- Persistent Volumes
- ConfigMaps
- Secrets
- Kubernetes Services
- Migration Jobs
- AWS EC2 Deployment
- K3s Cluster Management
- Kubernetes Troubleshooting
- Container Networking


# 🐞 Issues Resolved

During deployment, the following issues were successfully resolved:

- ImagePullBackOff
- Missing Kubernetes Secret
- Persistent Volume Binding
- StatefulSet Scheduling
- Migration Job Initialization
- Container Image Import into K3s
- Node Label Configuration
