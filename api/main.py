import os
from fastapi import FastAPI
from celery.result import AsyncResult
from celery import Celery

broker_url = os.getenv("CELERY_BROKER_URL", "amqp://rabbitmq")
backend_url = os.getenv("CELERY_BACKEND_URL", "redis://redis")
celery = Celery(broker=broker_url, backend=backend_url)

app = FastAPI()

@app.get("/say-hello/{name}")
async def say_hello(name: str):
    # Dispatch the task using its name as a string
    task = celery.send_task('tasks.say_hello', args=[name])
    return {"task_id": task.id, "status": "Task submitted successfully"}

@app.get("/task-status/{task_id}")
async def get_task_status(task_id: str):
    # Retrieve task result using Celery
    task_result = AsyncResult(task_id, app=celery)
    return {
        "task_id": task_id,
        "status": task_result.status,
        "result": task_result.result
    }