oimage=$1
# k8s.gcr.io == gcr.io/google-containers
cimage=`echo $oimage | sed 's#k8s.gcr.io#gcr.io/google-containers#g' | sed 's#gcr.io#gcr.azk8s.cn#g' | sed 's#quay.io#quay.azk8s.cn#g'`
docker pull $cimage
docker tag $cimage $oimage
docker rmi $cimage
