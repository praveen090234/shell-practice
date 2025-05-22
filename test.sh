#1/bin/bash

USER=$(id -u)

if [ $USER -ne 0 ]
then 
     echo "this user have root access"
else
     echo "this user need root access"
fi



