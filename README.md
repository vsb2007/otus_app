# otus_app
## Курсовая работа (проект) по курсу:
### [DevOps практики и инструменты](https://otus.ru/lessons/devops-praktiki-i-instrumenty/)
## Преподователи: [Экспресс 42](https://express42.com/)

## Технологии и инструменты
- [Google Cloud](https://console.cloud.google.com)
- [Terraform](https://www.terraform.io/)
- [Docker](https://www.docker.com/)
- [K8S](https://kubernetes.io/)
- Helm
- [Gitlab](https://about.gitlab.com/)

## То,что осталось реализовать:
- Мониторинг (сбор метрик, алертинг, визуализация)
- Логирование (опционально)
- Трейсинг (опционально)
- ChatOps (опционально)

# Aplication search_engine:

- [search_engine_ui](docker/ui/search_engine_ui)
- [search_engine_crawler](docker/crawler/search_engine_crawler)


## Installation and running

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
- Install Gitlab
```
$ cd helm/Charts/gitlab-omnibus
$ helm install --name gitlab . -f values.yaml
$ kubectl get service -n nginx-ingress nginx
NAME TYPE CLUSTER-IP EXTERNAL-IP PORT(S) AGE
nginx LoadBalancer 10.11.241.113 35.184.199.209 80:31782/TCP,443:30043/TCP,22:31194/TCP 23m
```
-  in `/etc/hosts` (take your IP)
```
$ echo "35.184.199.209 gitlab-gitlab staging production” >> /etc/hosts
```
- Read [Gitlab Readme](./helm/Charts/gitlab-omnibus/Setting.md)