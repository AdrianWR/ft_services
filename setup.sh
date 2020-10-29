#!/usr/bin/zsh

PODS=(	
		nginx		\
   		mysql		\
		phpmyadmin	\
		wordpress	\
		influxdb	\
		grafana		\
		nginx		\
		ftps
	 )

function deploy()
{
	errlog=$(mktemp)
	kubectl get pods -l app=$1 2> $errlog
	docker build -t $1-image $2 ./srcs/$1
	kubectl apply -f ./srcs/$1/$1.yaml
	if [[ -s $errlog ]]; then
		echo "Pod started!"
	else
		kubectl delete pod -n default -l app=$1
		echo "Pod restarted!"
	fi
	rm -f $errlog
	return 0
}

minikube status
if [[ $? == 85 || "$1" == "restart" ]]; then

	if [[ "$1" == "restart" ]]; then
		minikube delete
	fi

	minikube start --driver=docker											\
				   --bootstrapper=kubeadm										\
				   --extra-config=kubelet.authentication-token-webhook=true		\
				   --extra-config=apiserver.service-node-port-range=3000-35000
	minikube addons enable metallb
	minikube addons enable dashboard
	minikube addons enable metrics-server
fi

#------------------- Apply YAMLs ---------------------#

eval $(minikube docker-env)

kubectl apply -f ./srcs/metallb/metallb.yaml
for image in $PODS; do
	deploy $image
done
#deploy mysql
#deploy phpmyadmin
#deploy wordpress
#deploy influxdb
#deploy grafana
#deploy nginx
#deploy ftps

minikube dashboard
