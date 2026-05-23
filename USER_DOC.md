# 👤 User Documentation

This document explains how to use the Inception infrastructure from a user or administrator perspective.

It focuses on basic operations such as starting the project, accessing services, and verifying that the system is running correctly.

---

## 🧱 Services Overview

The infrastructure provides three main services:

- **NGINX** — entry point of the system, handling HTTPS requests and routing traffic  
- **WordPress** — website application and administration panel  
- **MariaDB** — database storing all WordPress data (users, posts, configuration)

NGINX acts as the only publicly exposed service. All other components run internally inside the Docker network.

---

## 🚀 Starting the Project

To start the full infrastructure, run:

```bash
make up

On first launch, the system will automatically prompt for required credentials, including database and WordPress user passwords.

After setup, Docker will build all images and start all containers.

⛔ Stopping the Project

To stop all running services:

make down

This will stop and remove containers but will preserve persistent data stored in Docker volumes.

🌐 Accessing the Website

Once the system is running, the website can be accessed via:

https://localhost

Because the project uses a self-signed TLS certificate, the browser may display a security warning. This is expected and must be accepted manually.

🛠️ WordPress Administration Panel

The WordPress admin panel is available through the same domain:

https://localhost/wp-admin

From here, the administrator can:

manage posts and pages
configure the website
manage users and roles

Login credentials are defined during the initial setup (see below).

🔐 Credentials Management

All sensitive credentials are provided during the first execution of make up.

They include:

database root password
database user password
WordPress admin password
WordPress standard user password

These values are stored locally inside the secrets/ directory.

⚠️ Important:

credentials are not hardcoded in the project
they are required for initial setup
losing them may require resetting the environment
📊 Checking Service Status

To verify that all services are running correctly:

docker ps

All containers should be listed as running.

To inspect logs for debugging:

docker compose logs

This is useful if:

the website is not accessible
containers fail to start
configuration errors occur
💾 Data Persistence

All important data is stored using Docker volumes:

MariaDB database files
WordPress website files

This ensures that:

data is preserved after container restart
the system can be rebuilt without data loss
infrastructure remains consistent
