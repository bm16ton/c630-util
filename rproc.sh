#!/bin/bash
rm /usr/lib/c630-util/rproc 2> /dev/null
echo -n "" > /usr/lib/c630-util/plist
for i in $(seq 0 40) ; do
FILET=$(echo /sys/class/remoteproc/remoteproc$i)
    if [[ -L $FILET ]]; then
        TYPE=$(cat /sys/class/remoteproc/remoteproc$i/name)
        STATE=$(cat /sys/class/remoteproc/remoteproc$i/state)
    echo "remoteproc$i = $TYPE state = $STATE" >> /usr/lib/c630-util/rproc
    echo "remoteproc$i" >> /usr/lib/c630-util/plist

    fi
done
exit

