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
