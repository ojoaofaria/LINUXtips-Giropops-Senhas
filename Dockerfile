FROM ubuntu:20.04
ENV REDIS_HOST=localhost
ADD https://github.com/badtuxx/giropops-senhas.git /app
WORKDIR /app
RUN apt update && apt-get install pip -y
RUN pip install --no-cache-dir -r requirements.txt
RUN apt-get install -y redis
CMD redis-server --daemonize yes && flask run --host=0.0.0.0