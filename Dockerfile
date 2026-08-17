#Stage:1, setting upthe base image
FROM python:3.9

#setting working directory
WORKDIR /app/backend

#copying requirements to the default directory
COPY requirements.txt /app/backend

#Installing build dependencies
RUN apt-get update \
    && apt-get upgrade -y \
    && apt-get install -y gcc default-libmysqlclient-dev pkg-config \
    && rm -rf /var/lib/apt/lists/*

#Install app dependencies
RUN pip install mysqlclient
RUN pip install --no-cache-dir -r requirements.txt

#Copying the entire code
COPY . /app/backend

#Exposing the port
EXPOSE 8000
