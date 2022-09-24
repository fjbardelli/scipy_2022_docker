# Introducción a Docker

## Contexto

- Antes
  - Aplicaciones monolíticas
  - Largos ciclos de desarrollo
  - Entorno único
  - Escalando lentamente
  - Despliegas manuales o controlados
- Ahora
  - Servicios desacoplados
  - Mejoras rápidas e iterativas (metodologías ágiles)
  - Múltiples entornos (producción, QA, testing, integración)
  - Escalar rápida y dinámicamente
  - integración Continua
  - Despliegue Continuo y Automático

## Problemas del desarrollo de Software

- Construir (  No solo es codificar, no solo que pase los test.)
  - Entorno Desarrollo
    - Desarrollo versión de python
    - Dependencias
  - Entrono de ejecución
    - Dependencias Internas
    - Dependencias Externas
- Distribuir
  - Artefactos: Puede hace se muchos y en distintos store (PlayStore, App Packages)
- ejecutar (en cualquier lado)
  - Maquina en la que corre
  - en entorno debe servidores (no es mi maquina)
    - Bases de datos
    - Cache
  - Dependías son el SO
- Solución Docker
  - ¿Que aporta Docker?
    - Escalabilidad
    - Portabilidad

## Maquinas Virtuales Vs Contenedores

### Maquinas Virtuales 
- Que son
- Cuales son sus Componentes
- Explicación de su funcionamiento
- Aplicaciones
  - VM Ware
  - Virtual Box

### Contenedores

- Que son
  - Unidades Lógicas
  - Empaquetan Dependencias
  - Contienen Artefactos del sistema

### Historia de  los contenedores

- Origen LXxC
- Año 2000 como  FreeBSD jail
- Año 2001, a través del proyecto VServer de Jacques Gélinas, se introdujo en Linux la implementación de un entorno aislado
- Año 2008 sale Docker
- Características de los Contenedores
- Que Función binen a cumplir

### Maquinas Virtuales vs Contenedores

- Diferencias entre contenedores y Maquinas Virtuales

## Componentes de Docker

- Arquitectura modular
- Demonio (host)
  - Imágenes
  - Contenedores
- Componentes
  - Cliente
- Registros

## Imágenes y contenedores

### contenedores

A diferencia de una máquina virtual que proporciona virtualización de hardware, un contenedor proporciona virtualización ligera a nivel de sistema operativo mediante la abstracción del "espacio del usuario". Los contenedores comparten el núcleo del sistema host con otros contenedores. Un contenedor, que se ejecuta en el sistema operativo host, es una unidad de software estándar que empaqueta código y todas sus dependencias, para que las aplicaciones se puedan ejecutar de forma rápida y fiable de un entorno a otro. Los contenedores no son persistentes y se activan desde imágenes.
Cada contenedor tiene su propio file system, y stack de red virtualizado que le permite conectarse son el host anfitrión y con otros contenedores.

### Imágenes

Colección de software que se ejecutará como un contenedor que incluye un conjunto de instrucciones para crear un contenedor que se pueda ejecutar en la plataforma Docker. Las imágenes no son modificables, de modo que para realizar cambios en una imagen es preciso crear otra nueva. Se crean generando un sistemas de capas, que permite su re utilización, y generar eun sistema de cache para agilizar su creación.

### Volúmenes

La forma más sencilla de conservar los datos de Docker es atar los soportes, que literalmente vincula una ubicación en el disco host a una ubicación en el disco contenedor. Estos son simples de crear y usar, pero son un poco extravagantes ya que necesita configurar los directorios y administrarlos usted mismo.

Los volúmenes son como discos duros virtuales administrados por Docker. Docker maneja el almacenamiento en disco (generalmente en /var/lib/docker/volumes/) y asígneles un nombre único y fácil de recordar en lugar de una ruta de directorio. Es fácil crearlos y eliminarlos mediante la CLI de Docker.

### Networks

- Port Mapping
- Networks
- Comunicación entre contenedores
- Driver
  - Bridge/NAT: Se utiliza cuando tienes un solo host de Docker y neesitas que tus contenedores hablen entre sí.
  - Overlay: está disponible cuando trabajamos en un formato clúster, es decir que tenemos más de un host de Docker trabajando como uno solo, por lo que necesito que los contenedores puedan hablar entre sí, independientemente de dónde les haya tocado ejecutarse dentro del clúster
  - None: este driver es la forma de decir a Docker que para un contenedor/es en concreto no queremos que estén conectados a ninguna red. Lo que hace en este caso es no asignarle una tarjeta de red y listo.
  - Macvlan: esta opción se utiliza en el caso de querer conectar los dos mundos: el dockerizado y el sin nativo. Se trataría de un entorno híbrido que hace que mis contenedores tengan asignadas una IP dentro de la red donde está mi host/s.

## Comandos Básicos

- doker --version
- doker info
- docker run --name test -it debian
- docker container run --rm --name my_nginx -p 8080:80 nginx
- docker rename container-name new-name
- docker exec -it container-name sh
- docker exec container-name tail /var/log/date.log
- docker ps
- docker ps -a
- docker stop «continer name o container id»
- docker start «continer name o container id»
- docker rm «continer name o container id»
- docker inspect «continer name o container id»  - docker Image ls
- docker pull «image_name»:«tag»
- docker push «image_name»:«tag»

## DEMO

## Construcción de una Imágenes

- ¿Que es un Docker File?
  Los Dockerfile son los archivos de texto que contienen las instrucciones que crean las imágenes. Deben estar guardados dentro de un "build context", es decir, un directorio. Este directorio es el que contiene todos los archivos necesarios para construir nuestra imagen.

- Instrucciones de un Docker File
Directiva	Explicación
FROM	Indica la imagen base sobre la que se basa esta imagen
COPY	Copia un archivo del build context y lo guarda en la imagen
RUN	Ejecuta el comando indicado durante el proceso de creación de imagen.

- Construcción de una imagen
- .dockerignore
- tags
- registry
- push / pull

## DEMO

## Material

https://docker.com/
https://docs.docker.com/
https://aulasoftwarelibre.github.io/taller-de-docker/
https://www.redhat.com/es/topics/containers/whats-a-linux-container#seguridad-de-los-contenedores
https://diarioinforme.com/que-son-los-volumenes-de-docker-y-como-se-utilizan/
https://www.ionos.es/digitalguide/servidores/know-how/docker-container-volumes/
https://www.returngis.net/2020/12/como-funcionan-las-redes-en-docker/
https://www.oracle.com/mx/cloud/cloud-native/container-registry/what-is-docker
https://medium.com/contraslashsas/una-gu%C3%ADa-no-tan-r%C3%A1pida-de-docker-2fab9243762a
https://towardsdatascience.com/docker-networking-919461b7f498
https://techmormo.com/posts/docker-networking-3-drivers-overview/
https://www.ionos.es/digitalguide/servidores/know-how/dockerfile/
https://www.campusmvp.es/recursos/post/mejores-practicas-para-crear-dockerfiles-excelentes.aspx

## Próximos pasos

- Otros Poryectos
  - [Cloud Native Computing Foundation](https://www.cncf.io/)
  - [Docker Compose](https://docs.docker.com/compose/compose-file/)
  - [Podam](https://podman.io)
  - [Containterd](https://containerd.io/)
  - [Mulipass](https://multipass.run/)
- Orquestadores
  - [Docker Swarm](https://docs.docker.com/engine/swarm/)
  - [Kubernetes](https://kubernetes.io/es/)
  - [microk8s][https://microk8s.io/]
  - [minikube](https://minikube.sigs.k8s.io/docs/start/)
  - [Nomad](https://www.nomadproject.io/)
- Herramientas
  - [Portainer](https://www.portainer.io/)
  - [ctop](https://github.com/bcicen/ctop)


