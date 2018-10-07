
First you need to install kubectl and minikube to perform the following commands.
I created this gist to show how install kubectl and minikube.

Start minikube
```
$ minikube start
```

This command will be possible to download images from your local machine:
```
$ eval $(minikube docker-env)
```

Bake a docker image
```
$ docker build -t k8s-nodejs-poc:v1 .
```

Deploy this image using kubectl
```
$ kubectl run k8s-nodejs-poc --image=node-k8s-poc:v1 --port=9010
```

List your deployments
```
$ kubectl get deployment
```
