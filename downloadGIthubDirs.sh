#!/bin/bash
url=$1
if [ -z "$url" ]; then
	echo "usage: ./downloadGIthubDirs.sh github_url"
	exit 1
fi
durl=`sed 's#/tree/[a-z]*/#/trunk/#' <<< $url`
echo "svn checkout" $durl
svn checkout $durl

