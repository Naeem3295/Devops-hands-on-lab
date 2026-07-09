# 🚀 Docker Hub Kubernetes Deployment

![Docker](https://img.shields.io/badge/Docker-29.6-blue?logo=docker)
![Kubernetes](https://img.shields.io/badge/Kubernetes-v1.34-326CE5?logo=kubernetes)
![AWS](https://img.shields.io/badge/AWS-EC2-FF9900?logo=amazonaws)
![Ubuntu](https://img.shields.io/badge/Ubuntu-26.04-E95420?logo=ubuntu)
![Node.js](https://img.shields.io/badge/Node.js-Express-339933?logo=node.js)
![License](https://img.shields.io/badge/License-Educational-green)

A production-style DevOps project demonstrating how to containerize a Node.js application, push the Docker image to Docker Hub, and deploy it into a Kubernetes cluster running on AWS EC2 using **kubeadm**.

# 📖 Project Overview

This project demonstrates an end-to-end production deployment workflow using modern DevOps tools and practices.

The application is:

- ✅ Containerized using Docker
- ✅ Pushed to Docker Hub
- ✅ Deployed on Kubernetes
- ✅ Running inside the `production` namespace
- ✅ Exposed using a Kubernetes NodePort Service
- ✅ Hosted on an AWS EC2 Ubuntu instance

# 📑 Table of Contents

- Project Overview
- Architecture
- Technology Stack
- Project Structure
- Docker Workflow
- Kubernetes Deployment
- Verification
- Screenshots
- Learning Outcomes
- Author

# 🏗 Architecture

```text
                        Internet
                            │
                            ▼
                  AWS EC2 (Ubuntu Server)
                            │
                            ▼
                Kubernetes Single Node Cluster
                            │
                    ┌───────┴────────┐
                    ▼                ▼
               Deployment        NodePort Service
                    │
               ReplicaSet
                    │
                    ▼
               Node.js Pods
                    │
                    ▼
      Docker Image (Docker Hub Repository)


# 🛠 Technology Stack

| Category | Technology |
|----------|------------|
| Cloud | AWS EC2 |
| Operating System | Ubuntu 26.04 LTS |
| Container Runtime | Docker |
| Container Registry | Docker Hub |
| Orchestration | Kubernetes |
| Cluster Bootstrap | kubeadm |
| CRI | containerd |
| Networking | Calico |
| Backend | Node.js |
| Framework | Express.js |
| Version Control | Git & GitHub |



# 📂 Project Structure

```text
13-dockerhub-kubernetes-deployment
│
├── .github/
│   └── workflows/
│
├── k8s/
│   ├── namespace.yaml
│   ├── deployment.yaml
│   └── service.yaml
│
├── screenshots/
│   ├── 01-instance.png
│   ├── 02-docker-image.png
│   ├── 03-dockerhub-repository.png
│   ├── 04-docker-container-running.png
│   ├── 05-kubernetes-node.png
│   ├── 06-production-namespace.png
│   ├── 07-production-pods.png
│   ├── 08-service-nodeport.png
│   ├── 09-browser-output.png
│   └── 10-production-all-resources.png
│
├── src/
├── test/
│
├── Dockerfile
├── .dockerignore
├── Jenkinsfile
├── package.json
└── README.md
```

# 🐳 Docker Workflow

## Build Docker Image

```bash
docker build -t naeem3295/dockerhub-kubernetes-deployment:v1 .
```

## Run Container

```bash
docker run -d \
--name app \
-p 5000:5000 \
naeem3295/dockerhub-kubernetes-deployment:v1
```

## Verify Container

```bash
docker ps
```

```bash
docker logs app
```

# 🐳 Docker Hub

## Login

```bash
docker login
```

## Push Image

```bash
docker push naeem3295/dockerhub-kubernetes-deployment:v1
```

## Repository

https://hub.docker.com/r/naeem3295/dockerhub-kubernetes-deployment


# ☸ Kubernetes Deployment

## Initialize Cluster

```bash
sudo kubeadm init --pod-network-cidr=192.168.0.0/16


## Configure kubectl

```bash
mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config


## Install Calico CNI

```bash
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.30.3/manifests/calico.yaml

## Remove Control Plane Taint

```bash
kubectl taint nodes --all node-role.kubernetes.io/control-plane-


## Create Namespace

```bash
kubectl create namespace production


## Deploy Application

```bash
kubectl apply -f k8s/


## Verify Resources

```bash
kubectl get nodes

kubectl get pods -n production

kubectl get svc -n production

kubectl get all -n production
```


# 🌐 Application Access


http://13.213.51.211:30080



# ✅ Verification

Successfully completed:

- Docker Image Build
- Docker Hub Push
- Kubernetes Cluster Setup
- Production Namespace
- Kubernetes Deployment
- NodePort Service
- Browser Access
- AWS EC2 Deployment

