#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

if [ $USERID -ne 0 ]
then
    echo -e "$R Error: $N This user is not running with root access"
    exit 1
else
    echo "$G This user is running with root access $N"
     # exit form the script 
fi

Validate () {
if [ $1 -eq 0 ]
    then
        echo -e "installing $2 is ....... $G success $N"
    else 
        echo -e "installing $2 is ..... $R failure $n"
        exit 1
    fi
} 


dnf list installed mysql 

if [ $? -ne 0 ]
then
    echo -e "$Y mysql is not installed.....going to install it $N"
    dnf install mysql -y
    $Validate $1 "mysql"
    
else
    echo -e "$Y mysql is already installed... nothing to do $N"
fi

dnf list installed python3 

if [ $? -ne 0 ]
then
    echo -e "$Y python3 is not installed.....going to install it"
    dnf install python3 -y
    $Validate $1 "python"
else
    echo -e "$Y python3 is already installed... nothing to do $N"
fi


dnf list installed nginx 

if [ $? -ne 0 ]
then
    echo -e "$Y nginx is not installed.....going to install it $N"
    dnf install nginx -y
   $Validate $1 "nginx" 
else
    echo -e  "$Y nginx is already installed... nothing to do $N"
fi