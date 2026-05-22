# Inception

*This project has been created as part of the 42 curriculum by pruszkie.*

---

<br>

# 📌 Description

Inception is a system administration and infrastructure project focused on containerization, service orchestration, and environment isolation using Docker and Docker Compose.

The main objective is to design and deploy a small multi-service infrastructure where each component runs inside its own dedicated container. Instead of installing and configuring services directly on the host operating system, every service is isolated, reproducible, and managed independently through Docker.

---

## 🧱 Infrastructure Overview

The system is composed of three main services:

- **NGINX** — secure reverse proxy and public entry point of the application  
- **WordPress (PHP-FPM)** — application layer providing dynamic website functionality  
- **MariaDB** — relational database responsible for persistent data storage  

---

## 🔗 Architecture Principles

All services communicate through a dedicated Docker network while remaining isolated from the host system.

The project also introduces persistent storage using Docker volumes, ensuring that data survives:
- container restarts
- rebuilds
- full infrastructure recreation

---

## ⚙️ Key Concepts Covered

- Building custom Docker images  
- Container lifecycle management  
- Docker networking between services  
- Environment variables and secrets handling  
- TLS/HTTPS configuration  
- Service separation and responsibility isolation  
- Persistent storage strategies  

---

## 🧠 Design Philosophy

The project follows a production-oriented approach where each container has a single responsibility. This improves:

- modularity  
- maintainability  
- scalability  
- security  

It reflects real-world DevOps practices used in modern infrastructure systems.

---

🖥️ Virtual Machines vs Docker

Virtual Machines run a full operating system on top of a hypervisor, which includes its own kernel and system resources. This makes them more isolated but also significantly heavier in terms of CPU, memory, and disk usage. They take longer to start and require more resources overall.

Docker, on the other hand, uses containerization and shares the host system kernel. Containers are much lighter, start almost instantly, and use fewer resources. Instead of virtualizing hardware, Docker isolates processes at the operating system level, making it more efficient for running multiple services.

🔐 Secrets vs Environment Variables

Environment variables are commonly used to configure applications, but they are not secure for sensitive data. They can often be viewed through container inspection commands or process listings, which makes them unsuitable for passwords or private keys.

Secrets provide a safer way to handle sensitive information. They are stored separately from the application configuration and are only exposed to the container at runtime in a controlled manner. This reduces the risk of accidental exposure of credentials such as database passwords or administrative accounts.

🌐 Docker Network vs Host Network

Docker bridge networks create an isolated virtual network where containers can communicate with each other using internal DNS names. This ensures that services remain separated from the host system and are only accessible when explicitly exposed.

Host networking removes this isolation and allows containers to directly use the host machine’s network stack. While this can improve simplicity in some cases, it significantly reduces security and control over exposed services. For this project, a bridge network is used to ensure proper isolation and controlled access through NGINX only.

💾 Docker Volumes vs Bind Mounts

Docker volumes are managed internally by Docker and provide a reliable way to persist data independently of the host filesystem structure. They are portable, easier to manage, and recommended for production-like environments.

Bind mounts directly map a directory from the host system into a container. While they are useful for development due to real-time file access, they are tightly coupled to the host environment and can cause portability and permission issues. For this project, volumes are preferred to ensure data persistence and system independence.

<br>

# 🚀 Instructions

## Requirements

- Docker and Docker Compose installed  
- sudo privileges required  
- Bash shell  

---

## ▶️ How to run the project

To start the infrastructure, run:

```bash
make up
```

# 📚 Resources

## Docker & Infrastructure

- https://docs.docker.com/ — Official Docker documentation  
- https://docs.docker.com/compose/ — Docker Compose reference  
- https://docs.nginx.com/ — NGINX configuration and reverse proxy concepts  
- https://mariadb.com/kb/en/ — MariaDB official documentation  
- https://wordpress.org/support/ — WordPress installation and configuration guides  

---

## System & Networking Concepts

- https://www.redhat.com/en/topics/linux/what-is-a-container — Containers vs virtual machines  
- https://www.digitalocean.com/community/tutorials — Linux, networking and server setup tutorials  
- https://httpd.apache.org/docs/ — General web server and proxy concepts (for reference comparison)  

---

## TLS / HTTPS

- https://letsencrypt.org/docs/ — TLS/SSL concepts and certificates  
- https://wiki.openssl.org/ — OpenSSL documentation  

---

# 🤖 AI Usage

AI tools were used as a **supporting assistant only**, mainly for understanding and structuring concepts.

## Used for:

- Clarifying Docker concepts (volumes, networks, containers vs VMs)
- Understanding architecture design (multi-container structure)
- Help with documentation structure (README, DEV_DOC, USER_DOC)
- Reviewing Makefile flow and explaining execution steps
- Improving clarity and readability of technical explanations

## Not used for:

- Writing final implementation code
- Generating Dockerfiles or configurations blindly
- Copy-pasting full infrastructure setup

All implementation decisions and configuration were verified manually through:
- Docker documentation
- testing in local environment
- iterative debugging and adjustment

## Summary

AI was used as a **learning and clarification tool**, not as an automatic solution generator.
