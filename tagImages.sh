#!/bin/bash
originRegistry=$1
TagRegistry=$2
if  [ ! -n "$originRegistry" ] ;then
	echo "usage: sh tagImages.sh originRegistry TagRegistry"
	exit 0
fi

images=$(docker images --format '{{.Repository}}:{{.Tag}}' | grep $originRegistry | sed 's#/# #g' | awk '{print $2}')
for image in $images
do
echo executed: docker tag $originRegistry/$image $TagRegistry/$image
docker tag $originRegistry/$image $TagRegistry/$image
done
