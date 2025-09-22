#!/bin/bash
set -e

apt-get update -y
apt-get install -y git openjdk-21-jdk maven nginx

# Clone and build the app
cd /home/ubuntu
git clone ${repo_url} app
cd app
mvn clean package

# Find jar
JAR=$(ls target/*.jar | head -n 1)

# Run app in background on port 8080
nohup java -jar $JAR > app.log 2>&1 &

# Configure Nginx as reverse proxy
cat > /etc/nginx/sites-available/default <<EOL
server {
    listen 80 default_server;
    listen [::]:80 default_server;

    server_name _;

    location / {
        proxy_pass http://127.0.0.1:8080;
        proxy_set_header Host \$host;
        proxy_set_header X-Real-IP \$remote_addr;
        proxy_set_header X-Forwarded-For \$proxy_add_x_forwarded_for;
    }
}
EOL

# Restart nginx
systemctl restart nginx
