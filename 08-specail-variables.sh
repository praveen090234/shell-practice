#!/bin/bash 

echo "all variabbles passed to the script : $@"
echo "number of varaibles : $#"
echo "current script name : $0"
echo "present working directory : $PWD"
echo "User running this script : $USER"
echo "home directory of the user : $HOME"
echo "PID of the script : $$"
sleep 10 &
echo "PID of the last command running in the background : $!"


