## Description ##
Sets up a private Docker Registry with SSL and basic authentication and a simple UI on top of it.

### Links ###
https://docs.docker.com/registry/deploying/
https://docs.docker.com/registry/configuration/


## Instructions ##
- Pull repo down to server
- Run `deploy.dh`
- Add credentials as below
- Run `docker-compose up -d`

### Credentials ###

```
# create a new htpasswd file or append a new credential to one
docker run --rm --entrypoint htpasswd registry:2 -Bbn USERNAME PASSWORD >> /var/docker/auth/htpasswd
```

### Pushing Images ###
```
    docker tag <image> <host>/<tag>
    # docker tag nginx docker.merrett.io:5000/nginx
    docker login -u USERNAME -p PASSWORD HOST
    # docker login -u user -p password docker.merrett.io:5000
    docker push <host>/<tag>
    # docker push docker.merrett.io:5000/nginx
```