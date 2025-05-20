#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "This user is not running with root access"
    exit 1
else
    echo "This user is running with root access"
     # exit form the script 
fi

Validate () {
if [ $1 -eq 0 ]
    then
        echo "installing $2 is ....... success"
    else 
        echo "installing $2 is ..... failure"
        exit 1
    fi
} 


dnf list installed mysql 

if [ $? -ne 0 ]
then
    echo "mysql is not installed.....going to install it"
    dnf install mysql -y
    $Validate $1 "mysql"
    
else
    echo "mysql is already installed... nothing to do"
fi

dnf list installed python3 

if [ $? -ne 0 ]
then
    echo "python3 is not installed.....going to install it"
    dnf install python3 -y
    $Validate $1 "python"
else
    echo "python3 is already installed... nothing to do"
fi


dnf list installed nginx 

if [ $? -ne 0 ]
then
    echo "nginx is not installed.....going to install it"
    dnf install nginx -y
   $Validate $1 "nginx" 
else
    echo "nginx is already installed... nothing to do"
fi