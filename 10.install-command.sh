#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]
then
    echo "ERROR: please run this script with root access."
    exit 1
else
    echo "You are running with root access."
fi

dnf installed mysql 
if [ $? -ne 0 ]
then
    dnf install mysql -y
    if [ $? -eq 0 ]
    then
        echo "Installing MYSQL is ........ SUCCESS"
    else
        echo "Installing MYSQL is ......... FAILURE"
        exit 1
    fi

else
    echo "MYSQL is already installed.."

fi



# dnf install mysql -y
# if [ $? -eq 0 ]
# then
#     echo "Installing MYSQL is ........ SUCCESS"
# else
#     echo "Installing MYSQL is ......... FAILURE"
#     exit 1
# fi


