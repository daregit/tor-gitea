# Gitea with Tor and Caddy Setup

This project sets up a Gitea instance accessible via a Tor hidden service, using Docker and Caddy.

Gitea instance is hidden behind Caddy server without access to the network.

## Security Disclaimer

This configuration uses self-signed certificates. It is recommended to generate certificates from a trusted Certificate Authority (CA).

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- Docker
- Docker Compose

## Getting Started

### 1. Clone the Repository

```sh
git clone https://github.com/daregit/tor-gitea.git
cd tor-gitea
./run.sh

```

### 2. Setup gitea admin accounts

Via tor-browser gitea web interface configure admin account and initial settings.

### 3. Configure ssh

```
Host *.onion
    ProxyCommand nc -X 5 -x localhost:9050  %h %p
```

Where localhost:9050 is location of your tor instance listening for socks connections.
