# Gitea with Tor and Caddy Setup

This project sets up a Gitea instance accessible via a Tor hidden service, using Docker.

Gitea instance is hidden behind Caddy server without access to the network. D

## Security Disclaimer

This configuration uses self-signed certificates, so you will get a browser warning about an untrusted CA when opening the Tor-hosted webpage using SSL. When needed, generate certificates from a trusted Certificate Authority (CA) for better security.

## Prerequisites

Before you begin, ensure you have docker installed on your system.

## Getting Started

### 1. Clone the Repository

```sh
git clone https://github.com/daregit/tor-gitea.git
cd tor-gitea
./run.sh

```

### 2. Setup gitea admin accounts

Using tor-browser visit gitea web interface and configure initial settings and admin account.

### 3. Setup gitea

Setup user account(s), SSH keys, repositories.

### 4. Configure ssh clinet for repository access

1. Install openbsd-netcat and tor
2. Start tor service
3. add entry to ~/.ssh/config

```
Host *.onion
    ProxyCommand nc -X 5 -x localhost:9050 %h %p
```
