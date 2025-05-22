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
    echo "Error: my sql is not installed...installing mysql"
    dnf install mysql -y
    $VALIDATE $1 "mysql"
else
    echo "mysql is installed...nothing to do"
fi



