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
