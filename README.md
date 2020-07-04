# ft_services
Webserver cluster running with Docker containers and Kubernetes

## About
FT Services is a project proposed in the 42 Schools curriculum, consisting on the implementation of a series of web services running on distinct containers orchestrated with Kubernetes. 

## Note to 42 Students!
This cluster architecture doesn't represent the actual subject of the ft_services curriculim project, so beware of getting some ideas to run on your own projects. As my actual and personal view on the subject, it seems that each HTTP service must be exposed individually with a `LoadBalancer` service type. In my setup, the only HTTP service exposed is the NGINX web server, and other services can be reached with a reverse proxy configuration. More details can be seen at the Cluster Architecture section.

## The Cluster

This cluster is composed of several Docker containers, all of them built from the Alpine Linux official Docker Hub image. From this perspective, each container has a different set of applications installed, reflecting the services to be exposed. The 42 School give us students freedom to choose the best tool to deploy their cluster. In this project, it has been choosen the use of the Minikube local cluster deployment tool. The **minikube** configuration is very particular to this set of applications, so here's a quick explanation of this setup:

- use of Virtual Box driver;
- use of *kubeadm* bootstrapper;
- availability of ports in range 3000 - 35000;
- availability of kubelet token authentication inside clusters;
- enabling of **dashboard**, **metrics-server** and **metallb** addons.

## The Services

### NGINX
Cluster main web server, running with a service exposing ports 80 and 443. The access via port 80 is redirected to port 443 with code 301. The NGINX server will allow access to the other HTTP applications with the `proxyy_pass` directive.
### MySQL
### Wordpress
### PHPMyAdmin
### InfluxDB
### Grafana
### FTPS Server

## Cluster Architecture
![img](srcs/ft_services.png)
