#!/bin/bash

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
LOGS_FOLDER="/var/log/shell-practice-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"
PACKAGES=("mysql" "python3" "nginx" "httpd")

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" &>>$LOG_FILE


if [ $USERID -ne 0 ]
then
    echo -e "$R Error: $N This user is not running with root access" | tee -a $LOG_FILE
    exit 1
else
    echo -e "$G This user is running with root access $N" | tee -a $LOG_FILE
     # exit form the script 
fi

VALIDATE(){
if [ $1 -eq 0 ]
    then
        echo -e "installing $2 is ....... $G success $N" | tee -a $LOG_FILE
    else 
        echo -e "installing $2 is ..... $R failure $n" | tee -a $LOG_FILE
        exit 1
    fi
} 


for packages in ${PACKAGES[@]}
do
  dnf list installed $packages  &>>$LOG_FILE
  if [ $? -ne 0 ]
then
    echo -e "$Y $packages is not installed.....going to install it $N" | tee -a $LOG_FILE
    dnf install $packages -y &>>$LOG_FILE
    VALIDATE $? "$packages"
    
else
    echo -e "$Y $packages is already installed... nothing to do $N" | tee -a $LOG_FILE
fi