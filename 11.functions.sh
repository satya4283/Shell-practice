#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: please run this script with root access."
    exit 1 #give other than 0 upto 127
else
    echo "You are running with root access."
fi



VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo "Installing $2 is ........ SUCCESS"
    else
        echo "Installing $2 is ......... FAILURE"
        exit 1
    fi
}

dnf list installed mysql 
# check already installed or not... if installed $? is 0. then
# If not installed $? is not 0 then expression is true
if [ $? -ne 0 ]
then
    echo "MYSQL is not installed going to install...."
    dnf install mysql -y
    VALIDATE $? "mysql"

else
    echo "MYSQL is already installed..Nothing to do it"
fi


dnf list installed python3 
# check already installed or not... if installed $? is 0. then
# If not installed $? is not 0 then expression is true
if [ $? -ne 0 ]
then
    echo "python3 is not installed going to install...."
    dnf install python3 -y
    VALIDATE $? "python3"

else
    echo "python3 is already installed..Nothing to do it"
fi

dnf list installed nginx 
# check already installed or not... if installed $? is 0. then
# If not installed $? is not 0 then expression is true
if [ $? -ne 0 ]
then
    echo "nginx is not installed going to install...."
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo "nginx is already installed..Nothing to do it"
fi