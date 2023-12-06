#!/bin/bash
# This script monitors CPU and memory usage

FILE_NAME="log.csv"

[ ! -f $FILE_NAME ] && { echo "datetime,cpuUsage,memUsage" >> $FILE_NAME; }

while :
do 
    # Get the current usage of CPU and memory
    cpu=$(top -bn1 | awk '/Cpu/ { print $2}')
    cpuUsage=${cpu//[,]/.}
    memUsage=$(free -m | awk '/Mem/{print $3}')
    datetime=$(date +"%Y-%m-%d %T")

    # Print the usage
    echo "$datetime"
    echo "CPU Usage: $cpuUsage%"
    echo "Memory Usage: $memUsage MB"

    echo "$datetime,$cpuUsage,$memUsage" >> $FILE_NAME

    # Sleep for 1 second
    sleep 1
done