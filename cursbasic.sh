#!/bin/bash
#Variables
username="student"
password="student"

#Add user
useradd ${username}
echo ${pass} | passwd --stdin ${username} >> /dev/null

#Populate the student's home dir with stuff
HOMEDIR=$(tail -n 1 /etc/passwd | cut -d : -f 6)
printf "Downloading files\n"
curl -s https://raw.githubusercontent.com/Bryan-Legend/babel-lang/master/Babel.EnglishEmitter/Resources/Irregular%20Verbs.txt -o ${HOMEDIR}/irregular_verbs
chown -R ${username}:${username} ${HOMEDIR}
