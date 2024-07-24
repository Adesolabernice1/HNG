#!/bin/bash

LOG_DIR="/var/log/devopsfetch/HNG"
LOG_FILE="$LOG_DIR/activities.log"

# Ensure the log directory exists
mkdir -p $LOG_DIR

# Infinite loop to continuously monitor system activities
while true; do
    echo "Monitoring activities at $(date)" >> $LOG_FILE
    # Example: Log active users
    echo "Active users:" >> $LOG_FILE
    who >> $LOG_FILE
    echo "" >> $LOG_FILE

    # Example: Log active ports
    echo "Active ports and services:" >> $LOG_FILE
    ss -tuln >> $LOG_FILE
    echo "" >> $LOG_FILE

    # Example: Log Docker containers
    echo "Docker containers:" >> $LOG_FILE
    docker ps -a >> $LOG_FILE
    echo "" >> $LOG_FILE

    # Example: Log Nginx configurations
    echo "Nginx is running"
    echo "Nginx configurations:" >> $LOG_FILE
    nginx -T >> $LOG_FILE 2>/dev/null
    echo "" >> $LOG_FILE

    sleep 60 # Log every minute
done
