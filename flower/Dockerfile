# Dockerfile
FROM python:3.11

RUN mkdir /app
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt

COPY ./src /app
COPY requirements.txt /app

EXPOSE 5555

CMD celery -A app flower