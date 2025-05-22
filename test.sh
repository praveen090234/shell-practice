#1/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then 
     echo "this user don't have root access"
else
     echo "this user have root access"
fi

VALIDATE (){
    if [ $1 -eq 0 ]
    then
        echo "$2 installation is successful"
    else
       echo "$2 installation is failure"
    fi
   
}

dnf list installed mysql
if [ $? -ne 0 ] 
then
    echo "Error: mysql is not installed...installing mysql"
    dnf install mysql -y
    $VALIDATE $? "mysql"
else
    echo "mysql is installed...nothing to do"
fi

dnf list installed python3
if [ $? -ne 0 ] 
then
    echo "Error: python3 is not installed...installing mysql"
    dnf install python3 -y
    $VALIDATE $? "python3"
else
    echo "python3 is installed...nothing to do"
fi

dnf list installed nginx
if [ $? -ne 0 ] 
then
    echo "Error: nginx is not installed...installing mysql"
    dnf install nginx -y
    $VALIDATE $? "nginx"
else
    echo "nginx is installed...nothing to do"
fi


