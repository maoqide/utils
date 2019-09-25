#!/bin/bash
#./downloadGIthubDirs.sh https://github.com/kubernetes/kubernetes/tree/master/cluster/addons
url=$1
if [ -z "$url" ]; then
	echo "usage: ./downloadGIthubDirs.sh github_url"
	exit 1
fi
durl=`sed 's#/tree/[a-z]*/#/trunk/#' <<< $url`
echo "svn checkout" $durl
svn checkout $durl

