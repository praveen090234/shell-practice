#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "This user is not running with root access"
else
    echo "This user is running with root access"
    exit 1 # exit form the script 
fi

dnf list installed mysql #if ecit code is not equal to 0 we are going to install my sql 
                        # if exit code is equal to 0 nothing to do

if [ $? -ne 0 ]
then
    echo "mysql is not installed.....going to install it"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "installing mysql is ....... success"
    else 
        echo "installing mysql is ..... failure"
        exit 1
else
    echo "mysql is already installed... nothing to do"