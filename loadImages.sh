#!/bin/bash

images=$(ls *.tar)
for image in $images
do
	echo load $image...
	docker load -i $image
done

