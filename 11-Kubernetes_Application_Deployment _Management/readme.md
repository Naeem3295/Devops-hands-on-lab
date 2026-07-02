# Kubernetes Application Deployment & Management

## Project Overview

This project demonstrates the deployment and management of a containerized Nginx application using Kubernetes (K3s). The assignment covers Kubernetes core concepts including Deployments, ReplicaSets, Services, ConfigMaps, Secrets, Scaling, Rolling Updates, Rollbacks, Troubleshooting, and Namespaces.


The objective of this assignment is to gain hands-on experience with Kubernetes by deploying and managing an application in a Kubernetes cluster. The project demonstrates how Kubernetes automates application deployment, scaling, configuration management, recovery, and resource isolation.


# Environment

| Component | Value |
|-----------|-------|
| Cloud Provider | AWS EC2 |
| Operating System | Ubuntu |
| Kubernetes Distribution | K3s |
| Container Runtime | containerd |
| Application | Nginx |
| Service Type | NodePort |

Part 1: Conceptual Understanding

1. How does Kubernetes ensure high availability compared to traditional deployment?

Kubernetes ensures high availability by running multiple replicas of an application across Pods. If one Pod or node fails, Kubernetes automatically creates a replacement Pod. It also distributes traffic using Services, reducing downtime. Compared to traditional deployment, Kubernetes provides self-healing and automatic recovery.

2. Explain the relationship between Pods, ReplicaSets, and Deployments.

A Pod is the smallest unit that runs one or more containers. A ReplicaSet ensures that the desired number of Pods are always running. A Deployment manages ReplicaSets and provides features such as scaling, rolling updates, and rollback. Therefore, Deployments control ReplicaSets, and ReplicaSets manage Pods.

Why are Services required in Kubernetes?

Services provide a stable network endpoint for accessing Pods. Since Pod IP addresses can change when Pods are recreated, Services ensure that clients can always reach the application. They also perform load balancing across multiple Pods.

4. Difference between ConfigMaps and Secrets with a practical example.

ConfigMaps are used to store non-sensitive configuration data such as application mode or log level. Secrets are used to store sensitive information like passwords, API keys, or tokens. For example, APP_MODE=dev can be stored in a ConfigMap, while a database password should be stored in a Secret.

# Part 2: Cluster Setup & Verification

The objective of this part was to set up a Kubernetes cluster and verify that all core Kubernetes components were running successfully before deploying any application.

## Cluster Setup

A lightweight Kubernetes distribution (**K3s**) was installed on an AWS EC2 Ubuntu instance.

### Commands Used

bash
curl -sfL https://get.k3s.io | sh -

## Verify Cluster Status

### Check Kubernetes Nodes

bash
sudo kubectl get nodes


**Output**

NAME         STATUS   ROLES           AGE   VERSION
k8s-master   Ready    control-plane   xxm   v1.36.2+k3s1

### Check Cluster Information

bash
sudo kubectl cluster-info

**Output**

- Kubernetes Control Plane
- CoreDNS
- Metrics Server



### Check System Pods

bash
sudo kubectl get pods -n kube-system

**Output**

coredns
metrics-server
local-path-provisioner
traefik
svclb-traefik

## Observation

The K3s cluster was successfully installed on the AWS EC2 instance. The control-plane node was in the **Ready** state, indicating that the cluster was healthy and operational. All essential system Pods, including **CoreDNS**, **Metrics Server**, **Traefik**, and **Local Path Provisioner**, were running successfully in the `kube-system` namespace, confirming that the Kubernetes environment was ready for application deployment.

# Part 3: Multi-Resource Deployment

The objective of this part was to deploy a containerized Nginx application in Kubernetes using multiple resources. A Deployment was created with two replicas, and a NodePort Service was configured to expose the application externally.

## Resources Created

The following Kubernetes resources were created:

- Deployment
- Service (NodePort)

## Deployment Configuration

The Deployment was configured with:

- Application: Nginx
- Replicas: 2
- Container Port: 80
- Labels: `app: nginx`

The Deployment ensures that two identical Nginx Pods are always running inside the cluster.

## Service Configuration

A NodePort Service was created to expose the application outside the Kubernetes cluster.

Configuration:

- Service Type: NodePort
- Service Port: 80
- Target Port: 80
- NodePort: 30080

This allows users to access the application through the EC2 public IP and NodePort.

## Deployment Commands

### Apply Deployment

bash
sudo kubectl apply -f deployment.yaml

### Apply Service

bash
sudo kubectl apply -f service.yaml

## Verification

### Verify Deployment

bash
sudo kubectl get deployment


### Verify Running Pods

bash
sudo kubectl get pods


### Verify Service

bash
sudo kubectl get svc


## Access the Application

The application was successfully accessed from a web browser using the EC2 Public IP and the configured NodePort.

Example:

http://54.169.244.120:30080/

The default **Welcome to nginx!** page was displayed successfully.


## Observation

The Deployment successfully created two running Nginx Pods, and the NodePort Service exposed the application to external users. Kubernetes automatically associated the Pods with the Service using labels and selectors. The application was successfully accessed through the EC2 public IP without any issues.


# Part 4: Configuration & Secrets

The objective of this part was to manage application configuration and sensitive information using Kubernetes ConfigMaps and Secrets. These resources were injected into the running Nginx container as environment variables without modifying the application image.

## Resources Created

The following Kubernetes resources were created:

- ConfigMap
- Secret

## ConfigMap

A ConfigMap was created to store non-sensitive application configuration.

Configuration:

| Key | Value |
|------|-------|
| APP_MODE | dev |

### Apply ConfigMap

bash
sudo kubectl apply -f configmap.yaml

Verify ConfigMap

bash
sudo kubectl get configmap

## Secret

A Secret was created to store dummy application credentials.

Configuration:

| Key | Value |
|------|-------|
| USERNAME | admin |
| PASSWORD | password123 |

The Secret values were stored in Base64 encoded format.

### Apply Secret

bash
sudo kubectl apply -f secret.yaml

Verify Secret

bash
sudo kubectl get secrets

## Update Deployment

The Deployment was updated to inject both ConfigMap and Secret values as environment variables into the Nginx container.

Environment Variables:

| Variable | Source |
|-----------|--------|
| APP_MODE | ConfigMap |
| USERNAME | Secret |
| PASSWORD | Secret |

Apply the updated Deployment

bash
sudo kubectl apply -f deployment.yaml

## Verification

The environment variables were verified inside the running Pod using the `kubectl exec` command.

Verify ConfigMap Variable

bash
sudo kubectl exec -it <pod-name> -- printenv | grep APP_MODE

Output

APP_MODE=dev

Verify Secret Variables

bash
sudo kubectl exec -it <pod-name> -- printenv | grep USERNAME
sudo kubectl exec -it <pod-name> -- printenv | grep PASSWORD

Output

USERNAME=admin
PASSWORD=password123

## Observation

The ConfigMap and Secret were successfully created and injected into the Deployment as environment variables. The values were verified inside the running container using the `kubectl exec` command. This approach separates configuration and sensitive information from the application image, making deployments more secure and easier to manage.
