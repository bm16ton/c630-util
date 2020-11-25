#!/bin/bash
rm /usr/lib/c630-util/venus 2> /dev/null
rm /usr/lib/c630-util/venus-vid 2> /dev/null
echo "" > /usr/lib/c630-util/venus
echo "" > /usr/lib/c630-util/venus-vid
for i in $(seq 0 40) ; do
FILET=$(echo /sys/class/video4linux/video$i)
    if [[ -L $FILET ]]; then
        TYPE=$(cat /sys/class/video4linux/video$i/name)
        if [ "$TYPE" = "qcom-venus-decoder" ]; then
    echo "video$i = qcom-venus-decoder DEBUG = $(cat /sys/class/video4linux/video$i/dev_debug)" >> /usr/lib/c630-util/venus
    echo "video$i" >> /usr/lib/c630-util/venus-vid
else
        if [ "$TYPE" = "qcom-venus-encoder" ]; then
    echo "video$i = qcom-venus-encoder DEBUG = $(cat /sys/class/video4linux/video$i/dev_debug)" >> /usr/lib/c630-util/venus
    echo "video$i" >> /usr/lib/c630-util/venus-vid
    fi
    fi
    fi
done
exit



