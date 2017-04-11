#!/bin/bash
originRegistry=$1
tagRegistry=$2
keyword=$3
if  [[ ! -n "$originRegistry" || ! -n "$tagRegistry" ]] ;then
	echo "usage: sh tagImages.sh originRegistry tagRegistry [keyword]"
	exit 0
fi

images=$(docker images --format '{{.Repository}}:{{.Tag}}' | grep $originRegistry | grep $keyword | sed 's#/# #g' | awk '{print $2}')
for image in $images
do
echo executed: docker tag $originRegistry/$image $tagRegistry/$image
docker tag $originRegistry/$image $tagRegistry/$image
done
