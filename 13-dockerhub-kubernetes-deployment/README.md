# 🚀 Docker Hub Kubernetes Deployment

A production-style DevOps project demonstrating how to containerize a Node.js application, push the Docker image to Docker Hub, and deploy it into a Kubernetes cluster running on an AWS EC2 instance.


## 📖 Project Overview

This project demonstrates an end-to-end deployment workflow using Docker, Docker Hub, Kubernetes, and AWS EC2.

The application is:

- Containerized using Docker
- Pushed to Docker Hub
- Deployed into a Kubernetes Cluster
- Exposed using a Kubernetes NodePort Service
- Running inside the `production` namespace


# 🏗 Architecture


Browser
│
▼
NodePort Service (30080)
│
▼
Kubernetes Service
│
▼
Deployment
│
▼
ReplicaSet
│
▼
Pods
│
▼
Docker Image
│
▼
Docker Hub
│
▼
AWS EC2 Kubernetes Cluster


# 🛠 Tech Stack

- AWS EC2
- Ubuntu Linux
- Docker
- Docker Hub
- Kubernetes (kubeadm)
- containerd
- Calico CNI
- Node.js
- Express.js
- Git
- GitHub


# 📂 Project Structure


13-dockerhub-kubernetes-deployment
│
├── .github
│   └── workflows
│
├── k8s
│   ├── namespace.yaml
│   ├── deployment.yaml
│   └── service.yaml
│
├── screenshots
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
├── src
├── test
│
├── Dockerfile
├── .dockerignore
├── Jenkinsfile
├── package.json
└── README.md


# ⚙️ Docker Image Build

Build Docker Image

```bash
docker build -t naeem3295/dockerhub-kubernetes-deployment:v1 .
```

Run Container

```bash
docker run -d \
--name app \
-p 5000:5000 \
naeem3295/dockerhub-kubernetes-deployment:v1
```

Check Running Containers

```bash
docker ps
```

View Logs

```bash
docker logs app


# 🐳 Docker Hub

Login

```bash
docker login
```

Push Image

```bash
docker push naeem3295/dockerhub-kubernetes-deployment:v1
```

Docker Hub Repository


https://hub.docker.com/r/naeem3295/dockerhub-kubernetes-deployment

# ☸ Kubernetes Cluster Setup

Initialize Cluster

```bash
sudo kubeadm init --pod-network-cidr=192.168.0.0/16
```

Configure kubectl

```bash
mkdir -p $HOME/.kube

sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config

sudo chown $(id -u):$(id -g) $HOME/.kube/config
```

Install Calico

```bash
kubectl apply -f https://raw.githubusercontent.com/projectcalico/calico/v3.30.3/manifests/calico.yaml
```

Remove Control Plane Taint

```bash
kubectl taint nodes --all node-role.kubernetes.io/control-plane-

# 📦 Create Namespace

```bash
kubectl create namespace production
```
# 🚀 Deploy Application

```bash
kubectl apply -f k8s/
```

Verify Deployment

```bash
kubectl get all -n production
```

Check Pods

```bash
kubectl get pods -n production
```

Check Services

```bash
kubectl get svc -n production
```

# 🌍 Application Access


http://13.213.51.211:30080
