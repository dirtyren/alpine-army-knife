
alpine-army-knife
=================

This is a image based on https://hub.docker.com/r/leodotcloud/swiss-army-knife , but instead of Ubuntu it users Alpine to make it a little smaller.
It is a image with many tools to help debug problems in a Kubernetes Cluster.
This image start nginx with a default welcome page to help interconnections tests

## Running

```
# Run and attach to the network namespace of the container to debug
docker run --name swiss-army-knife --net=container:${CONTAINER_ID_TO_DEBUG} -itd alessandroren/alpine-army-knife

# Exec into the tools container
docker exec -it alpine-army-knife bash
