#!/usr/bin/zsh

PODS=(	
		nginx		\
   		mysql		\
		wordpress
	 )

function launch()
{
	errlog=$(mktemp)
	kubectl get pods -l app=$1 2> $errlog
	docker build -t $1-image $2 ./srcs/$1
	kubectl apply -f ./srcs/$1.yaml
	if [[ -s $errlog ]]; then
		echo "Pod started!"
	else
		kubectl delete pod -n default -l app=$1
		#kubectl rollout restart deployment $1
		#kubectl scale deployment $1 --replicas=0
		#kubectl scale deployment $1 --replicas=1
		echo "Pod restarted!"
	fi
	rm -f $errlog
	return 0
}

"$@"

#----------------- set colors -------------------#
ORANGE="\033[0;31m "
RED="\033[0;31m "
GREEN="\n\033[0;92m "
CYAN="\033[0;36m "
MAGENTA="\033[0;95m "
NC="\033[0m" # No Color

if [[ "$1" == "ignite" ]]; then

	#------------------- docker ---------------------#

	#if [[ ! $(which docker) == "" ]]
	#then
	#	echo -e "${GREEN}Docker found...${NC}";
	#else
	#	echo -e "${RED}You need Docker to run this app.${NC}";
	#	exit 1;
	#fi

	#docker ps > /dev/null;
    #if [[ $? == 1 ]];
    #then
    #    printf "${RED}Docker doesn't have the right permissions${NC}";
    #    sudo usermod -aG docker $USER;
    #    printf "${GREEN}Permissions were applied. Please log out and in again...${NC}";
    #    exit 1;

    #fi
	##----------------- kubernetes -------------------#

	#if [ ! $(which kubectl) == "" ]
	#then
	#	echo -e "${GREEN}Kubernetes found...${NC}";
	#else
	#	echo -e "${GREEN}Downloading and installing Kubernetes...${NC}";
	#	if [ ${SYSTEM_TYPE} == "Darwin" ]
	#	then
	#		curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/darwin/amd64/kubectl"
	#	else
	#		curl -LO https://storage.googleapis.com/kubernetes-release/release/`curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt`/bin/linux/amd64/kubectl
	#	fi
	#	chmod +x ./kubectl
	#	sudo mv ./kubectl /usr/local/bin/kubectl
	#fi
	#kubectl version --client

	##------------------ minikube --------------------#

	#if [ ! $(which minikube) == "" ]
	#then
	#	echo -e "${GREEN}Minikube found...${NC}";
	#else
	#	curl -LO "https://storage.googleapis.com/minikube/releases/latest/minikube-${SYSTEM_TYPE}-amd64"
	#	sudo install "minikube-${SYSTEM_TYPE}-amd64" /usr/local/bin/minikube
	#fi
	minikube delete

	#----------- setup and permissions --------------#

	#echo -e "${GREEN}Setting up permissions...${NC}"
	#sudo systemctl enable docker.service
	#sudo groupadd docker
	#sudo usermod -aG docker $USER

	#--------------- start minikube -----------------#

	echo -e "${GREEN}Starting Minikube...${NC}"
	minikube start --driver=virtualbox --extra-config=apiserver.service-node-port-range=3000-35000
	minikube addons enable ingress
	minikube addons enable dashboard
	minikube addons enable metrics-server

fi

eval $(minikube docker-env)

#----------------- main config ------------------#
#
SYSTEM_TYPE="linux"
MYSQL_ROOT_PASSWORD="admin"
MYSQL_DATA_DIR="/data"
#SSH_USER="admin"
#SSH_PASS="admin"
MINIKUBE_IP=$(minikube ip)
WORDPRESS_DB_NAME="wordpress"
WORDPRESS_USER_NAME="admin"
WORDPRESS_PASSWORD="admin"
WORDPRESS_DB_HOST=$MINIKUBE_IP
FTP_USER="admin"
FTP_PASSWORD="admin"

#------------------- build containers ---------------------#

#docker build -t phippy-nginx srcs/nginx

#------------------- apply yamls ---------------------#
kubectl wait --namespace=kube-system --for=condition=Ready pods --all --timeout 10s
kubectl apply -f srcs/ingress.yaml
kubectl patch deployment ingress-nginx-controller --patch "$(cat ./srcs/nginx-ingress-controller-patch.yaml)" -n kube-system
launch influxdb
launch nginx 

#minikube dashboard
