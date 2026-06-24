📄 1. README.md (Main Documentation)
markdown
# 3-Tier AWS Architecture Implementation

## Project Overview
This project demonstrates a complete 3-Tier Architecture on AWS using EC2, VPC, Security Groups, and Reverse Proxy.

## Architecture Diagram
Internet
│
▼
┌─────────────────────────────────────┐
│ Presentation Layer (Web Tier) │
│ - Nginx Web Server │
│ - Public Subnet │
│ - Security Group: web-sg │
└─────────────────────────────────────┘
│
▼
┌─────────────────────────────────────┐
│ Application Layer (App Tier) │
│ - Node.js Application │
│ - Public Subnet │
│ - Security Group: app-sg │
└─────────────────────────────────────┘
│
▼
┌─────────────────────────────────────┐
│ Database Layer (DB Tier) │
│ - MySQL Database │
│ - Private Subnet │
│ - Security Group: db-sg │
└─────────────────────────────────────┘

text

## Technologies Used

| Layer | Technology |
|-------|------------|
| **Presentation** | Nginx (Reverse Proxy) |
| **Application** | Node.js + Express |
| **Database** | MySQL |
| **Infrastructure** | AWS (VPC, EC2, Security Groups) |
| **OS** | Ubuntu 26.04 LTS |

## AWS Resources Created

| Resource | Name | CIDR |
|----------|------|------|
| VPC | three-tier-vpc | 10.0.0.0/16 |
| Subnet-1 | web-subnet | 10.0.1.0/24 |
| Subnet-2 | app-subnet | 10.0.2.0/24 |
| Subnet-3 | db-subnet | 10.0.3.0/24 |
| Internet Gateway | three-tier-igw | - |
| Route Table (Public) | public-rt | 0.0.0.0/0 → IGW |
| Route Table (Private) | private-rt | - |

## Security Groups

### web-sg
| Type | Port | Source |
|------|------|--------|
| HTTP | 80 | 0.0.0.0/0 |
| SSH | 22 | My IP |

### app-sg
| Type | Port | Source |
|------|------|--------|
| Custom TCP | 8080 | web-sg |
| SSH | 22 | My IP |

### db-sg
| Type | Port | Source |
|------|------|--------|
| MySQL | 3306 | app-sg |
| SSH | 22 | My IP |

## EC2 Instances

| Name | Type | Subnet | Security Group | Public IP |
|------|------|--------|----------------|-----------|
| web-server | t2.micro | web-subnet | web-sg | 13.214.212.174 |
| app-server | t2.micro | app-subnet | app-sg | 54.254.193.35 |
| db-server | t2.micro | db-subnet | db-sg | 13.251.160.166 |

## Database Setup

```sql
CREATE DATABASE shopdb;
CREATE USER 'shopuser'@'%' IDENTIFIED BY 'Password@123';
GRANT ALL PRIVILEGES ON shopdb.* TO 'shopuser'@'%';

CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    price DECIMAL(10,2)
);

INSERT INTO products (name, price) VALUES
('Laptop', 50000.00),
('Mouse', 500.00);
Application Setup
Node.js App (app.js)
javascript
const express = require("express");
const mysql = require("mysql2");

const app = express();
const db = mysql.createConnection({
    host: "10.0.3.246",
    user: "shopuser",
    password: "Password@123",
    database: "shopdb"
});

app.get("/", (req, res) => res.send("Application Layer Running"));
app.get("/products", (req, res) => {
    db.query("SELECT * FROM products", (err, result) => res.json(result));
});

app.listen(8080);
Nginx Reverse Proxy Configuration
nginx
server {
    listen 80;
    location / {
        proxy_pass http://10.0.2.248:8080;
        proxy_http_version 1.1;
        proxy_set_header Host $host;
    }
}
Testing
Home Page
text
http://13.214.212.174
Output: Application Layer Running

Products API
text
http://13.214.212.174/products
Output:

json
[
  {"id":1,"name":"Laptop","price":"50000.00"},
  {"id":2,"name":"Mouse","price":"500.00"}
]

3. nginx.conf (Nginx Configuration)
nginx
server {
    listen 80;
    
    location / {
        proxy_pass http://10.0.2.248:8080;
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection 'upgrade';
        proxy_set_header Host $host;
        proxy_cache_bypass $http_upgrade;
    }
}

