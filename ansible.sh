#!/usr/bin/bash

sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y

sudo yum install ansible -y

ansible --version

cat <<EOF | sudo tee /etc/ssh/sshd_config
PasswordAuthentication Yes

EOF
sudo systemctl reload sshd
