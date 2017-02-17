#!/bin/bash
originRegistry=$1
tagRegistry=$2
if  [[ ! -n "$originRegistry" || ! -n "$tagRegistry" ]] ;then
	echo "usage: sh tagImages.sh originRegistry tagRegistry"
	exit 0
fi

images=$(docker images --format '{{.Repository}}:{{.Tag}}' | grep $originRegistry | sed 's#/# #g' | awk '{print $2}')
for image in $images
do
echo executed: docker tag $originRegistry/$image $tagRegistry/$image
docker tag $originRegistry/$image $tagRegistry/$image
done
