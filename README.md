# DCiaC - Docker Compose in a Container
This is a simply docker container that allows the operator to execute 
`docker-compose` from within a container. This was needed as I was starting to
see version and other conflicts between Docker and Docker Compose.

## Caceats
- When executing the container you need to mount `/var/run/docker.sock` so that
  `docker-compose` an interact with the host system's Docker daemon
- In order to access local resources it is important to mount those into the
  running container, i.e. the docker-compose file.

## How I use it
I create an alias for running the container which seems to work for most cases

```
alias docker-compose='docker run -ti -v /var/run/docker.sock:/var/run/docker.sock  -v $(pwd):/work dbainbriciena/docker-compose:1.27.4 docker-compose'
```
