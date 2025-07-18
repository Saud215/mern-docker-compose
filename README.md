# MERN Docker Compose

A fully Dockerized MERN (MongoDB, Express, React, Node.js) stack.

## Setup

```bash
git clone "repository-url"
cd mern-docker-compose
mv .env.example .env
```

Edit `.env` and fill in required variables (DB URI, JWT secret, etc.).

## Run

```bash
docker-compose --env-file .env up --build
```

## Stop

```bash
docker-compose down
```
