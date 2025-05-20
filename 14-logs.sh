#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-practice-logs"
SCRIPT_NAME=$(echo $0 ! cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" $>>$LOG_FILE

if [ $USERID -ne 0 ]
then
    echo -e "$R Error: $N This user is not running with root access" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$G This user is running with root access $N" | tee -a $LOG_FILE
     # exit form the script 
fi

Validate () {
if [ $1 -eq 0 ]
    then
        echo -e "installing $2 is ....... $G success $N" | tee -a $LOG_FILE
    else 
        echo -e "installing $2 is ..... $R failure $n" | tee -a $LOG_FILE
        exit 1
    fi
} 


dnf list installed mysql  $>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo -e "$Y mysql is not installed.....going to install it $N" | tee -a $LOG_FILE
    dnf install mysql -y $>>$LOG_FILE
    $Validate $1 "mysql"
    
else
    echo -e "$Y mysql is already installed... nothing to do $N" | tee -a $LOG_FILE
fi

dnf list installed python3 $>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo -e "$Y python3 is not installed.....going to install it" | tee -a $LOG_FILE
    dnf install python3 -y
    $Validate $1 "python"
else
    echo -e "$Y python3 is already installed... nothing to do $N" | tee -a $LOG_FILE
fi


dnf list installed nginx $>>$LOG_FILE

if [ $? -ne 0 ]
then
    echo -e "$Y nginx is not installed.....going to install it $N" | tee -a $LOG_FILE
    dnf install nginx -y $>>$LOG_FILE
   $Validate $1 "nginx" $>>$LOG_FILE
else
    echo -e  "$Y nginx is already installed... nothing to do $N" | tee -a $LOG_FILE
fi