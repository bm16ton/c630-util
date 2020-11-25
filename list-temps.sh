#!/bin/bash
for i in $(seq 0 40) ; do
FILET=$(echo /sys/class/hwmon/hwmon$i)
    if [[ -L $FILET ]]; then
        TYPE=$(cat /sys/class/hwmon/hwmon$i/name)
        if [[ -f $FILET/temp1_input ]]; then
            TEMP=$(echo "$(cat /sys/class/hwmon/hwmon$i/temp1_input)F")
            FTEMP=$(echo "$TEMP / 10000" |bc)
            FTEMP2=$(echo "scale=2;((9/5) * $FTEMP) + 32" |bc)
            CRITT=$(cat /sys/class/thermal/thermal_zone$i/trip_point_*_temp)
            FTEMPC=$(echo $FTEMP"C")
            FTEMP2F=$(echo $FTEMP2"F")
        else
            TEMP="0"
            POOP="temp not available"
            FTEMP=NA
            FTEMP2=NA
        fi
        if [ "$(echo $CRITT | awk '{print $1}')" = "" ]; then
        CAR1B=""
else
        CAR1=$(echo $CRITT | awk '{print $1}') 2> /dev/null
        CAR1A=$(echo "$CAR1 / 1000" |bc)
        CAR1B=""$CAR1A"C"
fi
        if [ "$(echo $CRITT | awk '{print $2}')" = "" ]; then
        CAR2B=""
else
        CAR2=$(echo $CRITT | awk '{print $2}') 2> /dev/null
        CAR2A=$(echo "$CAR2 / 1000" |bc)
        CAR2B=""$CAR2A"C"
fi
        if [ "$(echo $CRITT | awk '{print $3}')" = "" ]; then
        CAR3B=""
else
        CAR3=$(echo $CRITT | awk '{print $3}') 2> /dev/null
        CAR3A=$(echo "$CAR3 / 1000" |bc)
        CAR3B=""$CAR2A"C"
fi
#        echo $CAR1A
#        echo $CAR2A
#        echo $CAR3A
        echo "$i $TYPE = $FTEMPC $FTEMP2F $POOP $(echo -n "Crit temps "$CAR1B $CAR2B $CAR3B)"
    fi
done

#cat /sys/class/hwmon/hwmon21/name
#cat /sys/class/hwmon/hwmon21/temp1_label
#cat /sys/class/hwmon/hwmon21/temp2_label
#cat /sys/class/hwmon/hwmon22/name
#cat /sys/class/hwmon/hwmon22/temp1_label
#cat /sys/class/hwmon/hwmon22/temp2_label
#cat /sys/class/hwmon/hwmon23/name
#cat /sys/class/hwmon/hwmon23/temp1_label
#cat /sys/class/hwmon/hwmon23/temp2_label
exit
