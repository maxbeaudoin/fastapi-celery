import os
from celery import Celery

broker_url = os.getenv("CELERY_BROKER_URL", "amqp://rabbitmq")
backend_url = os.getenv("CELERY_BACKEND_URL", "redis://redis")
app = Celery(broker=broker_url, backend=backend_url)

@app.task
def say_hello(name: str):
    return f"Hello {name}"