#!/bin/bash
registry=maoqide
dockerfiles=`ls -l | grep Dockerfile_ | awk '{print $9}'`
tag=`date +%Y%m%d`

for f in $dockerfiles
do
name=`echo $f | sed 's/Dockerfile_//g'`
image="$registry/$name:$tag"
echo $image
echo $image >> log
docker build -f $f -t $image . >> log
ret=$?
if [ $ret -ne 0 ]; then
    echo !!! "$image" build failed.
fi
done
