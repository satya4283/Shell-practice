#!/bin/bash

USERID=$(id -u)

R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

LOGS_FOLDER="/var/log/shellscript-logs"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME.log"

mkdir -p $LOGS_FOLDER
echo "script started executing at: $(date)" &>>$LOG_FILE


if [ $USERID -ne 0 ]
then
    echo -e "$R ERROR: Please run the script with root access $N" &>>$LOG_FILE
    exit 1
else
    echo "Script is running with root access" &>>$LOG_FILE
fi
# Validate function takes input as exit status and what command going to install.
VALIDATE(){
    if [ $1 -eq 0 ]
    then
        echo -e "Installing $2... $G SUCCESS $N" &>>$LOG_FILE
    else
        echo -e "Installing $2.... $R FAILURE $N" &>>$LOG_FILE
        exit 1
    fi
}


dnf list installed mysql  &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "MYSQL is not installed... going to install" &>>$LOG_FILE
    dnf install mysql -y &>>$LOG_FILE
    VALIDATE $? "mysql"
else
    echo -e "$Y Nothing to do .. MYSQL already installed $N" &>>$LOG_FILE
fi


dnf list installed python3 &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "python3 is not installed... going to install" &>>$LOG_FILE
    dnf install python3 -y &>>$LOG_FILE
    VALIDATE $? "python3"
else
    echo -e "$Y Nothing to do.. python3 already installed.$N" &>>$LOG_FILE
fi


dnf list installed nginx  &>>$LOG_FILE
if [ $? -ne 0 ]
then
    echo "nginx is not installed... going to install" &>>$LOG_FILE
    dnf install nginx -y &>>$LOG_FILE
    VALIDATE $? "nginx"
else
    echo -e "$Y Nothing to do.. nginx already installed $N" &>>$LOG_FILE
fi