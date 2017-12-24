#!/bin/bash
if [ -n "$1" ]; then
	if [ "$1" = "go" ]; then
		echo mount go
                sudo mount -t vboxsf goprojects /mnt/go_codes
 	elif [ "$1" = "python" ]; then
		echo mount python
		sudo mount -t vboxsf pythonpros /mnt/python_codes
	fi
else
	echo mount 'go & python'
	sudo mount -t vboxsf goprojects /mnt/go_codes
	sudo mount -t vboxsf pythonpros /mnt/python_codes
fi

