## Bake docker image using Packer

Run the following command to bake a docker image using Packer

```
packer build docker_build.json
```

Now you can see the baked image

```
marceloserpa@marceloserpa:~/Documents/code/repositories/devops_sandbox/packer_docker$ docker images
REPOSITORY                              TAG                 IMAGE ID            CREATED              SIZE
marceloserpa/ubuntu-java8               1.0                 6ebf3a305073        About a minute ago   475 MB
<none>                                  <none>              6c8d878f9c40        11 minutes ago       475 MB
```

You can run your container normally :)
```
docker run -it {{image_ID}}
```
