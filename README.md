# otus_app

- Install Docker
- Install and init gCloud
- Folder [docker](./docker) for test running app on local machine by docker-compose
- Create k8s infrastructure for App by [Terraform](./terraform), connecting to k8s cluster are included
- Install [Helm](https://github.com/kubernetes/helm/releases) to `/usr/bin` or other folder for your OS
- Install server side Helm’s - Tiller.
```
#
#Tiller - это аддон Kubernetes, т.е. Pod, который
#общается с API Kubernetes.
$ kubectl apply -f helm/tiller.yml
```
- Let's start helm tiller-server pod
```
$ helm init --service-account tiller
```
and check it
```
$ kubectl get pods -n kube-system --selector app=helm
```

- Downloads dep's for `search_engine` appl and run `search_engine` app.
```
$ cd helm/Charts/search_engine
$ helm dep update
$ helm install . --name search-engine-test
```
- Search `ingress` ip for access to ui... Waiting more time then you think :)
```
$ kubectl get ingress
```
