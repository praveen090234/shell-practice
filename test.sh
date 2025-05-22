#1/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then 
     echo "this user don't have root access"
else
     echo "this user have root access"
fi

dnf list installed mysql
if [ $? -ne 0 ] 
then
    echo "Error: my sql is not installed...installing mysql"
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "mysql installation is successful"
    else
       echo "mysql installation is failure"
    fi
else
    echo "mysql is installed...nothing to do"
fi



