#!/bin/bash
images=$(docker images --format '{{.Repository}}:{{.Tag}}' | grep '')

#echo $images
for image in $images
do
	name=$(echo $image | sed 's#/#.#g' | sed 's/:/_/g')
	echo saving $image...
	docker save $image > $name.tar
done
