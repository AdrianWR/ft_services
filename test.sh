#!/usr/bin/zsh

PODS=(	
		nginx		\
   		mysql		\
		wordpress
	 )

# Build container image and execute its pod.
#
# @$1: Service to be built and run.
function launch()
{
	if [ -z $1 ]
	then
		echo "Argument not suitable to be launched."
		return 1
	fi

	docker build -t image-$1 ./srcs/$1

	if [ $? -ne 0 ]
	then
		echo "Error found in building $1 image"
		echo "Return Code: $?"
		return $?
	fi
	return 0
}

#for pod in $PODS;
#do
#	docker build -t phippy-$pod ./srcs/$pod
#	echo $pod
#done

"$@"

launch nginx
