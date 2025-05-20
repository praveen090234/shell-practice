#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "Error:: this user is not running with root access"
    exit 1
else
    echo "User is running with root user"
fi

dnf install mysql -y

if [ $? -eq 0 ]
then
    echo "installing mysqlq is..... success"
else
    echo "installing mysql is..... failure"
    exit 1
fi
