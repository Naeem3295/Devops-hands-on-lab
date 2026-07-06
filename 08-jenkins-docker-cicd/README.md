# 🚀 React CI/CD Pipeline with GitHub Actions

> A production-ready Continuous Integration (CI) pipeline for a React application using GitHub Actions. This project automates the build process on every push and pull request, ensuring code quality and deployment readiness.


## 📌 Project Overview

This project demonstrates how to implement a modern CI pipeline for a React application using **GitHub Actions**.

Whenever code is pushed to the **main** branch or a Pull Request is created, GitHub Actions automatically:

- Checks out the source code
- Sets up the Node.js environment
- Installs project dependencies
- Builds the React application
- Uploads the production build as an artifact

This ensures every code change is validated automatically before deployment.


## 🏗️ Architecture

```text
Developer
     │
     ▼
 GitHub Repository
     │
     ▼
 GitHub Actions
     │
     ├── Checkout Source Code
     ├── Setup Node.js
     ├── Install Dependencies
     ├── Build React Application
     └── Upload Build Artifact


## 🛠️ Technologies Used

- React
- Vite
- Git
- GitHub
- GitHub Actions
- Node.js 22
- npm


## 📂 Project Structure

```text
06-github-actions-react-cicd/
│
├── .github/
│   └── workflows/
│       └── react-ci.yml
│
├── public/
├── src/
├── package.json
├── package-lock.json
├── vite.config.js
└── README.md

## ⚙️ CI Workflow

The workflow is automatically triggered when:

- Code is pushed to the **main** branch
- A Pull Request is opened against the **main** branch

Pipeline stages:

1. Checkout Repository
2. Setup Node.js
3. Install Dependencies
4. Build React Application
5. Upload Build Artifact


## 📜 GitHub Actions Workflow

```yaml
name: React CI Pipeline

on:
  push:
    branches:
      - main

  pull_request:
    branches:
      - main
```


## ▶️ Run Locally

Clone the repository

```bash
git clone https://github.com/Naeem3295/Devops-hands-on-lab.git
```

Navigate to the project

```bash
cd 06-github-actions-react-cicd
```

Install dependencies

```bash
npm install
```

Start development server

```bash
npm run dev
```

Create production build

```bash
npm run build


## 🎯 Learning Outcomes

After completing this project I learned how to:

- Build React applications using Vite
- Create GitHub Actions workflows
- Automate Continuous Integration (CI)
- Configure Node.js environments
- Generate production builds automatically
- Upload build artifacts
- Validate code through automated pipelines
- Structure a CI-ready GitHub repository


## 🚀 Future Improvements

- Continuous Deployment (CD)
- AWS EC2 Deployment
- Nginx Deployment
- Docker Integration
- Jenkins Integration
- Kubernetes Deployment


## ⭐ Project Status

✅ Completed

This project successfully demonstrates an automated Continuous Integration (CI) pipeline for a React application using GitHub Actions.
