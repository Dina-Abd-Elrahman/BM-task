# Deriving python3.8 base image
FROM ubuntu:latest

# Install minio pip3 package
RUN apt-get update
RUN apt-get install -y python3-pip
RUN pip3 install minio

# Working directory
WORKDIR /root

# Copy Hello world file 
ADD hello-world.txt ./

# Copy python script 
ADD uploader.py ./

CMD ["python3", "./uploader.py"]
