#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
   echo "Please run the script with root user access"
   exit 1
fi

VALIDATE(){
if [ $1 -ne 0 ]; then
   echo "$2...FAILURE"
   exit 1
else
    echo "$2...SUCCESS"
fi
}

echo "Installing Ngnix...."
dnf install nginx -y
VALIDATE $? "Installing Nginx"

echo "Installing MySQL...."
dnf install mysql -y
VALIDATE $? "Installing MySQL"

echo "Installing NodeJS...."
dnf install nodejs -y
VALIDATE $? "Installing NodeJS"
