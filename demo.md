# Demo

[Docker Hub](https://hub.docker.com/)
[Play With Docker](https://labs.play-with-docker.com/)

## installacion

- [Documentación](https://docs.docker.com/get-docker/)
- script de instalación para Ubuntu

## Primeros pasos

### Inicio

```bash
docker --version
docker system info
```

### Primer contenedor

[Hello Wold](https://hub.docker.com/_/hello-world)
[docker run](https://docs.docker.com/engine/reference/run/)
[docker ps](https://docs.docker.com/engine/reference/commandline/ps/)
[docker inspect](https://docs.docker.com/engine/reference/commandline/inspect/)


```bash
docker run --name hola hello-world
docker ps 
docker ps -a
docker inspect hola
docker inspect hola --format='{{.Config.Image}}' $INSTANCE_ID
docker rm hola
```

### Corriendo Un Ubuntu real

[Docker Hub Ubuntu](https://hub.docker.com/_/ubuntu)
[docker Top](https://docs.docker.com/engine/reference/commandline/top/)
[docker rm](https://docs.docker.com/engine/reference/commandline/rm/)

```bash
docker run --name  svr ubuntu
docker ps
docker ps -a
docker rm svr
docker run -d -it --name  svr ubuntu
docker ps
docker top svr
```

### Ciclo de vida

[docker stop](https://docs.docker.com/engine/reference/commandline/stop/)
[docker start](https://docs.docker.com/engine/reference/commandline/start/)
[Linux kill](https://learning.lpi.org/en/learning-materials/101-500/103/103.5/?gclid=Cj0KCQjw1bqZBhDXARIsANTjCPIAazKGNLLIqg2nGNjYdXIAit5GcGcTLUMxV_nRotQM1v5jgdIW1coaAnBZEALw_wcB)

```bash
docker run --name  svr ubuntu tail -f /dev/null
docker ps
docker stop svr
docker ps
docker start svr
docker ps
ps aux
docker run -d -it --name  svr ubuntu
ps aux
exit
ps aux
kill -9 pid 
docker ps
docker ps -a
```

### Python & Tags

[docker image](https://docs.docker.com/engine/reference/commandline/images/)
[docker pull](https://docs.docker.com/engine/reference/commandline/pull/)
[Doker Hub - Python](https://hub.docker.com/_/python)

```bash
docker image ls
docker pull python
docker run --rm python python --version
docker ps -a
docker pull python:3.10.7
docker image ls
docker run --rm python:3.10.7 python --version
docker ps -a
docker pull python:3.9
docker image ls
docker run --rm python:3.9 python --version
docker ps -a
```

### Python & Volumnes

```python
import sys

print(sys.version)

print("SyPy 2022")
print("Salta - Argentina")
```

```bash
touch ver.py
mv /ver.py /home
```

```bash
docker run --rm /root/sypy_2022_docker/ver.py:/home/ver.py python python /home/ver.py
docker run --rm /root/sypy_2022_docker/ver.py:/home/ver.py python:3.10  python /home/ver.py
docker run --rm /root/sypy_2022_docker/ver.py:/home/ver.py python python:3.9 /home/ver.py

ls /home
docker run --rm /home:/code ls /code
docker run --rm /home:/code python python:3.9 /code/ver.py
```

### Networks & Ping

[Docker Networks](https://docs.docker.com/network/)
[docker network create](https://docs.docker.com/engine/reference/commandline/network_create/)
[docker network ls](https://docs.docker.com/engine/reference/commandline/network_ls/)


```bash
docker networks create sypy
docker networks ls
docker run -d --name svr1 --network sypy ubutnu sleep infinity
docker inspect svr1 --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $INSTANCE_ID
docker run -d --name svr2 --network sypy ubutnu sleep infinity
docker inspect svr2 --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $INSTANCE_ID
docker ps

ping 192.19.0.2
ping 192.19.0.2

docker exec svr 2 /bin/bash
ping
apt update
apt install -y iputils-ping
apt install -y iproute2
```

### Nginx & Port Maping

[docker log]()
[Docker Hub Nginx](https://hub.docker.com/_/nginx)

```bash
docker run nginx 
docker ps
docker run -d --name web nginx
docker log web
docker log -f web
docker stop web
docker rm web
docker run -d -p80:80 --name web nginx
docker stop web
docker start web
```

### Nginx & Volumnes

- Copiar y  preparar los HTMLs


```bash
docker run -d -p 9091:80 -v /root/sypy_2022_docker/html/server1:/usr/share/nginx/html:ro --name web1 nginx
docker run -d -p 9092:80 -v /root/sypy_2022_docker/html/server2:/usr/share/nginx/html:ro --name web2 nginx

```

### Deploy a Producción

#### Local

**Explicar el Docker File**

```bash
docker build -t sypy2022 .
docker tag sypy2022 fjbardelli/sypy2022
docker push  fjbardelli/sypy2022
```

#### Play With Docker

```bash
docker pull  fjbardelli/sypy2022
docker run -d -p 81:8000 --name sypy2022 fjbardelli/sypy2022
```

#### Cambiar la App

```bash
docker stop sypy2022
docker start sypy2022
docker pull  fjbardelli/sypy2022
docker run -d -p 81:8000 --name sypy2022 fjbardelli/sypy2022
```

#### Local

Docker hub
DockerFile

### Jupyter

[Oficial](https://jupyterhub.readthedocs.io/en/stable/quickstart-docker.html)
[Preparada](https://medium.com/analytics-vidhya/jupyterhub-docker-31b7a3469872)

*Usuario:*  admin
*Clave*  change.it!

```bash
docker run -d -p 8000:8000 --name jupyterhub jupyterhub/jupyterhub jupyterhub
docker pull rancavil/jupyterhub-docker
docker run -d --name Jupyter2 -p 8002:8000 rancavil/jupyterhub-docker
docker image ls
```


### NetData & Stress Test

[Docker Hub NetData](https://hub.docker.com/r/netdata/netdata)
[NetData](https://www.netdata.cloud/)
[Stress Test](https://hub.docker.com/r/progrium/stress/)

```bash
docker run -d --name=netdata \
  -p 19999:19999 \
  -v netdataconfig:/etc/netdata \
  -v netdatalib:/var/lib/netdata \
  -v netdatacache:/var/cache/netdata \
  -v /etc/passwd:/host/etc/passwd:ro \
  -v /etc/group:/host/etc/group:ro \
  -v /proc:/host/proc:ro \
  -v /sys:/host/sys:ro \
  -v /etc/os-release:/host/etc/os-release:ro \
  --restart unless-stopped \
  --cap-add SYS_PTRACE \
  --security-opt apparmor=unconfined \
  netdata/netdata

   docker run --rm -it progrium/stress --cpu 2 --io 1 --vm 2 --vm-bytes 128M --timeout  120s
```

### Portainer

[Portainer](https://www.portainer.io/)
[Docker Install](https://docs.portainer.io/v/ce-2.9/start/install/server/docker/linux)

#### Se Muestra local para ver una verson de testing con muchos servicios