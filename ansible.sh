#!/usr/bin/bash

sudo dnf install https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm -y

sudo yum install ansible -y

ansible --version

cat <<EOF | sudo tee /etc/ssh/sshd_config

HostKey /etc/ssh/ssh_host_rsa_key
HostKey /etc/ssh/ssh_host_ecdsa_key
HostKey /etc/ssh/ssh_host_ed25519_key


SyslogFacility AUTHPRIV

PermitRootLogin yes


PubkeyAuthentication yes


AuthorizedKeysFile .ssh/authorized_keys

PasswordAuthentication yes

ChallengeResponseAuthentication no

GSSAPIAuthentication yes
GSSAPICleanupCredentials no

UsePAM yes


X11Forwarding yes

PrintMotd no

AcceptEnv LANG LC_CTYPE LC_NUMERIC LC_TIME LC_COLLATE LC_MONETARY LC_MESSAGES
AcceptEnv LC_PAPER LC_NAME LC_ADDRESS LC_TELEPHONE LC_MEASUREMENT
AcceptEnv LC_IDENTIFICATION LC_ALL LANGUAGE
AcceptEnv XMODIFIERS

Subsystem sftp  /usr/libexec/openssh/sftp-server
EOF

sudo systemctl reload sshd

sudo ssh-keygen 
