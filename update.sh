#!/bin/bash

#Creates a variable called 'desc' and assigns it to user input.
read -p "Commit message: " desc
read -p "Update on server? (y/n) " update

if [ "$1" = "portfolio" ]; then
    echo "Detected that you are updating your portfolio. I'll put that in the public_html folder instead of a project folder"
fi

echo "============================================="
echo "Entering project directory"
echo "============================================="
#Enters project directory. Project directory is the first argument ie "sh update.sh portfolio"
cd /Users/Jackson/WebstormProjects/$1

echo "============================================="
echo "Adding files to staging area"
echo "============================================="
#Adds all files to staging area
git add .

echo "============================================="
echo "Commiting changes with message '$desc'"
echo "============================================="
#Commits the changes with the commit message you entered
git commit -m "$desc"

echo "============================================="
echo "Pushing commit to master"
echo "============================================="
#Pushes the commit
git push origin master


#Enters the remote server, enters the directory that contains your project, and pulls changes.

if [ "$update" = "y" ]; then
    echo "============================================="
    echo "Entering remote server and pulling changes"
    echo "============================================="
    
    if [ "$1" = "portfolio" ]; then
        ssh -i "/Users/Jackson/.ssh/id_rsa" kingofkingshf@volition-dev.com "cd public_html; git pull"
    else
        ssh -i "/Users/Jackson/.ssh/id_rsa" kingofkingshf@volition-dev.com "cd public_html/$1; git pull"
    fi
fi



echo "============================================="
echo "Done! Happy coding!"
echo "============================================="