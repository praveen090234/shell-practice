#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: this user is not running woth root access"
    exit 1
else
    echo "User is running with root user"
fi
