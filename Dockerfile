FROM python:3.11.5-slim

WORKDIR /app

COPY requirements.txt requirements.txt

RUN apt-get update && \
    apt-get install -y build-essential cmake && \
    rm -rf /var/lib/apt/lists/*

RUN pip3 install cmake

RUN pip3 install -r requirements.txt

EXPOSE 8080

COPY . .

CMD ["python3", "server.py"]