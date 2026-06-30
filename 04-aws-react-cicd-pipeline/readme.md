# 🚀 React CI/CD Pipeline with GitHub Actions & AWS EC2

A production-style React CI/CD pipeline built using **GitHub Actions (Self-Hosted Runner)**, **AWS EC2**, **Nginx**, and **SSH-based deployment**.

The pipeline automatically builds and deploys a React application to an AWS EC2 web server whenever code is pushed to the `main` branch.

---

# 📌 Project Overview

This project demonstrates a complete Continuous Integration and Continuous Deployment (CI/CD) workflow for a React application.

The architecture separates the build process and the web server into different EC2 instances.

- GitHub stores the source code.
- GitHub Actions automatically triggers on every push.
- A Self-Hosted Runner builds the React application.
- The build artifacts are securely transferred to the Web Server using SSH.
- Nginx serves the application.

---

# 🏗️ Architecture

```
                    Developer
                        │
                        │ Git Push
                        ▼
                  GitHub Repository
                        │
                        ▼
              GitHub Actions Workflow
                        │
                        ▼
        Self-Hosted Runner (App Server)
               AWS EC2 (Ubuntu)
                        │
          npm install
          npm run build
                        │
                SCP + SSH
                        ▼
          AWS EC2 Web Server (Nginx)
                        │
                        ▼
              React Application Live
```

---

# ⚙️ Technology Stack

- React + Vite
- Git & GitHub
- GitHub Actions
- Self-Hosted GitHub Runner
- AWS EC2
- Ubuntu Server
- Nginx
- SSH
- SCP
- Node.js 22

---

# 📂 Project Structure

```
Devops-hands-on-lab
│
├── .github
│   └── workflows
│       └── react-cicd.yml
│
└── 3. aws-react-cicd-pipeline
    ├── src
    ├── public
    ├── package.json
    ├── vite.config.js
    └── ...
```

---

# 🔄 CI/CD Workflow

Every push to the **main** branch automatically performs the following steps:

1. Checkout Repository
2. Setup Node.js
3. Install Dependencies
4. Build React Application
5. Copy Build Files
6. Securely Transfer Files using SCP
7. Deploy Files to Nginx
8. Restart Nginx

---

# 📜 GitHub Actions Workflow

Main workflow location:

```
.github/workflows/react-cicd.yml
```

Pipeline includes:

- Checkout Repository
- Setup Node.js
- npm install
- npm run build
- SCP Deployment
- SSH Remote Deployment
- Restart Nginx

---

# 🔐 GitHub Secrets

The following GitHub Secrets were configured:

| Secret | Description |
|---------|-------------|
| HOST | App Server IP |
| USERNAME | SSH Username |
| SSH_KEY | Private SSH Key |

---

# 🌐 AWS Infrastructure

## App Server

- Ubuntu EC2
- Self-Hosted GitHub Runner
- Node.js
- Git
- SSH

Responsibilities

- Execute GitHub Actions
- Build React Application
- Transfer Build Files

---

## Web Server

- Ubuntu EC2
- Nginx

Responsibilities

- Host React Application
- Serve Static Files

---

# 🚀 Deployment Process

```
Git Push
      │
      ▼
GitHub Actions Triggered
      │
      ▼
Build React App
      │
      ▼
Copy dist/
      │
      ▼
SCP Build Files
      │
      ▼
SSH into Web Server
      │
      ▼
Replace /var/www/html
      │
      ▼
Restart Nginx
      │
      ▼
Website Updated

# ✅ Features

- Fully Automated CI/CD
- Self-Hosted GitHub Runner
- Production Style Deployment
- Secure SSH Deployment
- Automatic Build
- Automatic Deployment
- Nginx Hosting
- AWS EC2 Infrastructure

---

# 🧪 Testing

Modify any React component:

```jsx
<h1>React CI/CD Successfully Deployed 🚀</h1>
```

Then execute:

```
git add .
git commit -m "Update UI"
git push
```

GitHub Actions will automatically build and deploy the latest version.
