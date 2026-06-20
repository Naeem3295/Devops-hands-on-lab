Topic: Nginx Web Server with HTTPS, SSL & Reverse Proxy

📌 Question:

Set up a secure production-like web server using Nginx on Linux.

Your setup must include:

Static website hosting

HTTPS using self-signed SSL (OpenSSL)

HTTP → HTTPS auto redirect

Reverse proxy to backend (port 3000)

🎯 Requirements

🔹 Part 1: Basic Setup 

Install Nginx & OpenSSL

Create /var/www/secure-app

Add HTML page:

Secure Server Running via Nginx

🔹 Part 2: SSL 

Generate self-signed SSL (365 days)

Store in:

/etc/nginx/ssl/

🔹 Part 3: Nginx Config (30 Marks)

Create custom config

Port 80 → redirect to HTTPS

Port 443 → serve with SSL

Set:

ssl_certificate

ssl_certificate_key

Correct root & index

🔹 Part 4: Reverse Proxy 

Run backend on port 3000

Configure Nginx to:

proxy to backend

pass Host, X-Real-IP

🔹 Part 5: Testing 

nginx -t

Reload Nginx

Show:

HTTP → HTTPS redirect

HTTPS working

Backend via Nginx
