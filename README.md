# otus_app

- Install Docker
- Install and init gCloud
- folder [docker](./docker) for test running app on local machine by docker-compose
- Create k8s infrastructure for App by [Terraform](./terraform), connecting to k8s cluster are included
- Install [Helm](https://github.com/kubernetes/helm/releases) to `/usr/bin` or other folder for your OS
- Установим серверную часть Helm’а - Tiller.
```
#
#Tiller - это аддон Kubernetes, т.е. Pod, который
#общается с API Kubernetes.
$ kubectl apply -f tiller.yml
```
- Let's start helm tiller-server pod
```
$ helm init --service-account tiller
```
and check it
```
$ kubectl get pods -n kube-system --selector app=helm
```


