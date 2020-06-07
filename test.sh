#!/usr/bin/zsh

PODS=(	
		nginx		\
   		mysql		\
		wordpress
	 )

# Build container image and execute its pod.
# If a previous pod was running, remove it
# at manifest application to restart the pod
#
# @$1: Service to be built and run.
function launch()
{
	errlog=$(mktemp)
	kubectl get pods -l app=$1 2> $errlog
	docker build -t image-$1 ./srcs/$1
	kubectl apply -f ./srcs/$1.yaml
	if [[ -s $errlog ]]; then
		echo "Pod started!"
	else
		kubectl delete pod -n default -l app=$1
		echo "Pod restarted!"
	fi
	rm -f $errlog
	return 0
}

"$@"
