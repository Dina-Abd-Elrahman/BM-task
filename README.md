# BM-task

## Prerequisites

The project needs the following dependencies to function on your system. 

#### Dependencies

- Git
- VirtualBox >= 4.0.x
- Vagrant 

## Setting the project up

The project can be built automatically using **automation.sh** script.

```bash
chmod +x automation.sh && bash automation.sh
```

## Project analysis 

- First, there is **Vagrantfile** in the main repo directory. It creates the VM and start the containers. Open a terminal in the project directory and run the following command

```bash 
vagrant up 
```

To login to the vagrant VM 

```bash
vagrant ssh
```

- Second, For the 'hello-world' application you can find the python script **uploader.py** in the *docker-folder* diectory. this script uploads the **hello-world.txt** file to the minio container. 

Also, you can find the dockerFile to build the hello-world application in the same directory with name **python.Dockerfile**

To run this container to upload the file into the minio container 

```bash
docker run hello-world-python:v1
```

To scale this application to handle the increase in the load

```bash
docker-compose scale hello-world-python=3
```

- Third, For the minio container, I used the official minio image to run the minio as an object store.

- Forth, For the orchestration I used docker-compose to run the two containers. the docker-compose file **docker-compose.yml** in *docker-folder* directory.

**NOTE** 
For the production environment, it's prefered to use docker swarm, or kubernetes with the cluster to handle docker orchasteration. 

## Access you environment
After the environment up and running, check it http://<machine ip>:9001, Username: test, password: test12345"