#!/bin/bash

echo "System Resource Usage:"
echo "-----------------------"

# Total CPU Usage
CPU_USAGE=$(top -bn1 | awk '/Cpu\(s\)/ {print 100 - $8"%"}')
echo "Total CPU Usage: $CPU_USAGE"

# Total Memory Usage
MEMORY=$(free -m | awk '/Mem:/ {printf "Used: %d MB (%.2f%%), Free: %d MB\n", $3, $3/$2 * 100, $4}')
echo "Memory Usage: $MEMORY"

# Total Disk Usage
DISK=$(df -h --total | awk '/total/ {printf "Used: %s (%s), Free: %s\n", $3, $5, $4}')
echo "Disk Usage: $DISK"

# Top 5 Processes by CPU Usage
echo "Top 5 Processes by CPU Usage:"
ps -eo pid,comm,%cpu --sort=-%cpu | head -n 6

# Top 5 Processes by Memory Usage
echo "Top 5 Processes by Memory Usage:"
ps -eo pid,comm,%mem --sort=-%mem | head -n 6
