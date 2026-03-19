#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"


if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: Please run the script with root access $N"
    exit 1
else
    echo "Script is running with root access"
fi
# Validate function takes input as exit status and what command going to install.
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2... $G SUCCESS $N"
    else
        echo -e "Installing $2.... $R FAILURE $N"
        exit 1
    fi
}


dnf list installed mysql 
if [ $? -ne 0 ]
then
    echo "MYSQL is not installed... going to install"
    dnf install mysql -y
    VALIDATE $? "mysql"
else
    echo -e "$Y Nothing to do .. MYSQL already installed $N"
fi


dnf list installed python3
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install"
    dnf install python3 -y
    VALIDATE $? "python3"
else
    echo -e "$Y Nothing to do.. python3 already installed.$N"
fi


dnf list installed nginx 
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install"
    dnf install nginx -y
    VALIDATE $? "nginx"
else
    echo -e "$Y Nothing to do.. nginx already installed $N"
fi