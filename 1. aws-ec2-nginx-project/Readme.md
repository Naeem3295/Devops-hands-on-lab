markdown
# 🚀 AWS EC2 - Nginx Web Server Deployment

## 📋 Project Overview

This project demonstrates the deployment of a **production-ready web server** on **AWS EC2** using **Ubuntu 22.04** and **Nginx**. The entire infrastructure is configured with security best practices, custom website deployment, and automated backup using **Cronjob**.

---

## 🎯 Project Objectives

| # | Objective | Status |
|---|-----------|--------|
| 1 | Launch EC2 instance (Ubuntu 22.04, t2.micro) | ✅ Completed |
| 2 | Configure Security Groups (SSH, HTTP, HTTPS) | ✅ Completed |
| 3 | Connect via SSH using Key Pair | ✅ Completed |
| 4 | Install and configure Nginx web server | ✅ Completed |
| 5 | Deploy custom website | ✅ Completed |
| 6 | Set up automated backup with Cronjob | ✅ Completed |
| 7 | Route53 DNS setup | ⚠️ Skipped (No Domain) |
| 8 | SSL/TLS with Certbot | ⚠️ Skipped (No Domain) |

---

## 🛠️ Technologies Used

| Category | Technologies |
|----------|--------------|
| **Cloud Platform** | ☁️ Amazon Web Services (AWS) |
| **Compute** | EC2 (t2.micro - Free Tier) |
| **Operating System** | 🐧 Ubuntu 22.04.5 LTS |
| **Web Server** | 🌐 Nginx |
| **Security** | 🔒 Security Groups, Key Pair (SSH) |
| **Automation** | ⏰ Cronjob, Bash Scripting |
| **Version Control** | 📂 Git & GitHub |

---

## 🔧 Step-by-Step Implementation

### Step 1: Launch EC2 Instance

**AWS Console Configuration:**
| Parameter | Value |
|-----------|-------|
| AMI | Ubuntu Server 22.04 LTS (HVM) |
| Instance Type | t2.micro (Free Tier eligible) |
| Key Pair | naeem-shopbd-key |
| Security Group | web-sg (Custom) |
| Storage | 20 GB gp3 |

**Instance Details:**
Instance ID: i-03695f8fae7b1b827
Public IP: 13.213.0.203
Private IP: 172.31.16.55
State: Running

text

---

### Step 2: Security Group Configuration

**Inbound Rules:**

| Type | Protocol | Port | Source | Purpose |
|------|----------|------|--------|---------|
| SSH | TCP | 22 | My IP (103.49.201.70/32) | Secure administration |
| HTTP | TCP | 80 | 0.0.0.0/0 | Web traffic |
| HTTPS | TCP | 443 | 0.0.0.0/0 | Secure web traffic |

**Security Group ID:** `sg-03e80255cdf7c7f82`

> 🔐 **Security Best Practice:** SSH is restricted to only my IP address for enhanced security.

---

### Step 3: SSH Connection

**Command:**
```bash
ssh -i "naeem-shopbd-key.pem" ubuntu@13.213.0.203
Successful Connection Output:

text
Welcome to Ubuntu 22.04.5 LTS (GNU/Linux 6.8.0-1020-aws x86_64)
ubuntu@ip-172-31-16-55:~$
Step 4: Nginx Installation
Commands:

bash
# Update package list
sudo apt update

# Install Nginx
sudo apt install nginx -y

# Start and enable Nginx
sudo systemctl start nginx
sudo systemctl enable nginx

# Verify status
sudo systemctl status nginx
Output:

text
● nginx.service - A high performance web server
     Active: active (running) since Sat 2026-06-20 04:09:55 UTC
Default Page Changed To:

html
<!DOCTYPE html>
<html>
<head>
    <title>My AWS Server</title>
</head>
<body>
    <h1>Hello, I am learning!</h1>
    <p>I am learning AWS EC2</p>
</body>
</html>
Live URL: http://13.213.0.203

Step 5: Custom Website Deployment
Directory Structure:

text
/var/www/myapp/
└── index.html
Nginx Configuration: /etc/nginx/sites-available/myapp

nginx
server {
    listen 80;
    listen [::]:80;

    server_name 13.213.0.203;

    root /var/www/myapp;
    index index.html;

    location / {
        try_files $uri $uri/ =404;
    }
}
Commands:

bash
# Create directory
sudo mkdir -p /var/www/myapp
sudo chown -R $USER:$USER /var/www/myapp

# Create HTML file
sudo nano /var/www/myapp/index.html

# Enable site
sudo ln -s /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled/
sudo unlink /etc/nginx/sites-enabled/default

# Verify and reload
sudo nginx -t
sudo systemctl reload nginx
Custom HTML:

html
<html>
<head>
    <title>My Custom App</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #0a0a23;
            color: white;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .box {
            text-align: center;
            background: #1a1a1a;
            padding: 50px;
            border-radius: 20px;
            border: 1px solid #ff66bb;
        }
        h1 { color: #ff66bb; font-size: 48px; }
        p { font-size: 18px; color: #aaa; }
    </style>
</head>
<body>
    <div class="box">
        <h1>Welcome to My Custom Site!</h1>
        <p>Deployed on AWS EC2 with Nginx</p>
    </div>
</body>
</html>
Live Custom Site: http://13.213.0.203

Step 6: Automated Backup with Cronjob
Backup Script: /home/ubuntu/backup-nginx-logs.sh

bash
#!/bin/bash
BACKUP_DIR="/home/ubuntu/nginx-backups"
DATE=$(date +%Y-%m-%d)
mkdir -p $BACKUP_DIR
tar -czf $BACKUP_DIR/nginx-logs-$DATE.tar.gz /var/log/nginx/
echo "Nginx logs backup completed on $DATE" >> $BACKUP_DIR/backup.log
Commands:

bash
# Create and make script executable
nano /home/ubuntu/backup-nginx-logs.sh
chmod +x /home/ubuntu/backup-nginx-logs.sh

# Add to crontab
crontab -e
Cronjob Entry:

bash
# Daily backup at 2 AM
0 2 * * * /home/ubuntu/backup-nginx-logs.sh
Verification:

bash
# Check cronjobs
crontab -l

# View backup logs
cat /home/ubuntu/nginx-backups/backup.log

# List backup files
ls -la /home/ubuntu/nginx-backups/
Step 7: Route53 & SSL (Skipped)
⚠️ Note: Route53 hosted zone and SSL certificate installation were not completed due to the absence of a registered domain name. Let's Encrypt requires a valid domain for SSL certificate issuance.

What I would have done:

bash
# Route53 Hosted Zone
aws route53 create-hosted-zone --name mydomain.com

# SSL with Certbot
sudo apt install certbot python3-certbot-nginx -y
sudo certbot --nginx -d mydomain.com -d www.mydomain.com
Alternative Solutions:

Use free domain from Freenom (.tk, .ml, .ga)

Use self-signed certificate for testing

<img width="1362" height="651" alt="Instance " src="https://github.com/user-attachments/assets/d108c94f-bb45-4014-8817-bcb35f98ec7d" />

