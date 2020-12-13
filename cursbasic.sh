#!/bin/bash

printf "Salut, o sa iti configuram linuxul pentru a putea urma acest curs. Pentru inceput, te rugam sa iti alegi un nume de utilizator. Numele poate sa contina doar caractere alfanumerice.\n"
read -p "Nume utilizator: " username
username=$(echo ${username} | tr '[:upper:]' '[:lower:]')
printf "Ok, acum hai sa iti setam si o parola: \n"
read -sp "Parola: " pass
useradd ${username}
echo ${pass} | passwd --stdin ${username} >> /dev/null

#Populate the user's home dir with stuff
HOMEDIR=$(tail -n 1 /etc/passwd | cut -d : -f 6)
printf "Homedir is ${HOMEDIR}\n"
curl -s https://raw.githubusercontent.com/Bryan-Legend/babel-lang/master/Babel.EnglishEmitter/Resources/Irregular%20Verbs.txt -o ${HOMEDIR}/irregular_verbs
chown -R ${username}:${username} ${HOMEDIR}
