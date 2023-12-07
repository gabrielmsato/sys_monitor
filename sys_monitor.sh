#!/bin/bash
# This script monitors CPU and memory usage
# Get system information
model=$(lscpu | grep "Model name")
arch=$(lscpu | grep "Architecture")
cpuCores=$(lscpu | awk "/CPU\(s\):/" | head -n 1)
threads=$(lscpu | grep "Thread")
coresPerThreads=$(lscpu | grep "Core(s)")
sockets=$(lscpu | grep "Socket(s)")

echo "$model"
echo "$arch"
echo "$cpuCores"
echo "$threads"
echo "$coresPerThreads"
echo "$sockets"
echo ""
echo "Monitoring CPU and Memory usage..."

FILE_NAME="log.csv"

# [ ! -f $FILE_NAME ] && { echo "datetime,cpuUsage,memUsage" >> $FILE_NAME; }

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

    # echo "$datetime,$cpuUsage,$memUsage" >> $FILE_NAME

    # Sleep for 1 second
    sleep 1
done