cat > /etc/systemd/system/docker-brvpn-network.service <<EOF
[Unit]
Description=docker-brvpn-network
After=docker.service
BindsTo=docker.service

[Service]
TimeoutStartSec=0
Restart=on-failure
RestartSec=20
ExecStart=-/usr/bin/docker network create -d bridge --subnet=192.168.30.0/23 --ip-range=192.168.31.128/25 --gateway=192.168.30.241 -o "com.docker.network.bridge.name"="brvpn" brvpn

[Install]
WantedBy=multi-user.target
EOF
systemctl enable docker-brvpn-network.service