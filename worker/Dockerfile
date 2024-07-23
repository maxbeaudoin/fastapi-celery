# Dockerfile
FROM python:3.11

RUN mkdir /app
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . /app

CMD celery -A tasks worker --loglevel=info --pool=solo

