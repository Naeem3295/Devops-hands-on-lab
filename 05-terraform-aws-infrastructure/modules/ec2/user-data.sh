#!/bin/bash

apt update -y

apt install nginx -y

systemctl enable nginx

systemctl start nginx

HOSTNAME=$(hostname)

cat <<EOF >/var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
<title>Terraform AWS Project</title>
</head>

<body>

<h1>Terraform Three Tier Application</h1>

<h2>$HOSTNAME</h2>

<p>Ubuntu 24.04 LTS</p>

</body>
</html>
EOF