#!/bin/bash
sudo apt-get install gawk util-linux wget findutils python2.7 python2.7-minimal  python2 graphviz
mkdir /usr/lib/c630-util 2> /dev/null
cp list-temps.sh /usr/local/bin/
chmod +x /usr/local/bin/list-temps.sh
cp update-boost /usr/lib/c630-util
chmod +x /usr/lib/c630-util/update-boost
cp v4l2-dec.sh /usr/lib/c630-util
chmod +x /usr/lib/c630-util/v4l2-dec.sh
cp venus-firm /usr/lib/c630-util
chmod +x /usr/lib/c630-util/venus-firm
cp rproc.sh /usr/lib/c630-util
chmod +x /usr/lib/c630-util/rproc.sh
cp getinfo /usr/lib/c630-util
chmod +x /usr/lib/c630-util/getinfo
cp print1 /usr/lib/c630-util
chmod +x /usr/lib/c630-util/print1
cp c630-util /usr/local/bin/
chmod +x /usr/local/bin/c630-util
cp synvar /usr/lib/c630-util/
chmod +x /usr/lib/c630-util/synvar
cp synlist /usr/lib/c630-util/
chmod +x /usr/lib/c630-util/synlist

