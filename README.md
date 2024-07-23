# FastAPI Celery

FastAPI Celery is an open-source project that demonstrates the integration of FastAPI with Celery, using RabbitMQ as a message broker and Redis as a backend. This setup is ideal for handling background tasks in a FastAPI application.

## Getting Started

These instructions will guide you through setting up the project locally for development and testing purposes.

### Prerequisites

- Python 3.11
- Docker
- Docker Compose

### Installation

Clone the repository:

```bash
git clone https://github.com/maxbeaudoin/fastapi-celery.git
cd fastapi-celery
```

Before starting the application, ensure you run the initialization script:

```bash
./init.sh
```

This script prepares the necessary environment for the application to run smoothly.

Next, start the application using Docker Compose:

```bash
docker-compose up --build
```

This command builds the Docker images if they don't exist and starts the containers.

## Usage

With the application running, you can access:

- **FastAPI** application at http://localhost:8000 for API interactions.
- **RabbitMQ** Management UI at http://localhost:15672 to monitor message queues.
- **Flower** for Celery monitoring at http://localhost:5555.

To work within a specific service environment, use the `activate.sh` script with the service name as an argument. This sets up the environment variables and any other dependencies specific to that service. For example:

```bash
source ./activate.sh api
```

Replace `api` with `flower` or `worker` to activate the environment for those services.

### License
This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

