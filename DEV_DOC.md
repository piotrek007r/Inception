# 👨‍💻 Developer Documentation

This document explains how to set up, build, and manage the Inception infrastructure from a developer perspective.

It focuses on environment setup, build process, container management, and data persistence.

---

## ⚙️ Project Setup (From Scratch)

### Prerequisites

Before starting the project, ensure the following are installed:

- Docker
- Docker Compose
- sudo privileges
- Bash shell

---

### Configuration Files

The project relies on a few key configuration components:

- `docker-compose.yml` — defines all services and their relationships
- `.env` file — stores non-sensitive configuration values (database names, users, etc.)
- `secrets/` directory — stores sensitive credentials provided during setup

---

### Secrets Initialization

On first execution, secrets are created automatically through an interactive prompt triggered by:

```bash id="p1d7qk"
make up
```

The following values must be provided manually:

database password
database root password
WordPress admin password
WordPress user password

These values are stored locally inside the secrets/ directory and reused on future runs.

🚀 Build and Launch Process

The entire project is managed through a Makefile.

Full startup
make up

This command:

triggers secret creation (if not already present)
creates required directories for persistent storage
builds Docker images
creates containers
configures networks and volumes
starts all services in detached mode
Stop containers
make down

Stops all running containers without removing persistent data.

Rebuild environment
make re

This fully resets the environment by:

removing containers
removing images
removing volumes
rebuilding everything from scratch
Full cleanup
make fclean

Removes all Docker-related resources including:

containers
images
volumes
networks (unused)

⚠️ This also removes stored data.

🐳 Container Management

Useful Docker commands for debugging and monitoring:

List running containers
docker ps
View logs
docker compose logs

Useful for:

debugging startup issues
checking service errors
verifying container behavior
Restart services
docker compose restart
Inspect containers
docker inspect <container_name>

Used to verify:

environment variables
network configuration
mounted volumes
💾 Data Storage and Persistence

This project uses Docker volumes to ensure persistent data storage.

Stored data includes:
MariaDB database files
WordPress website content
