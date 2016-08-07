# update-script
An easy to use script for updating your repositories

## Setup

This script assumes you have already initialized a git repository in your project directory. 

## Instructions

1. Go to line 15 of update.sh
2. Replace '/Users/Jackson/WebstormProjects/' with the path to your projects ex. 'Users/Jackson/Desktop/DigitalCrafts/7-16immersive/' 

IMPORTANT: Make SURE $1 is at the end. Do not remove this! Also make sure your path ends with /

3.  Go to line 45 of update.sh
4. The first quotations specify the path to your .pem file. I am not using a pem file to access my server, but AWS does use .pem. 
5. Locate the path to your .pem file.
6. Copy the FULL path and place it between those quotes. Ex: 'Users/Jackson/WebstormProjects/7-16immersive/yeagerAWS.pem'
7. The second part specifies the server that you will connect to. Go on the aws website to find this.
8. The third part specifies the commands to be executed when you are connected to the server. For aws, you will want to have this:

Line 45: "cd /var/www/html; git pull"

Line 47: "cd /var/www/html/$1; git pull"

9. Repeat steps 4-8 for line 47. 
10. Save your file!
11. Open Terminal
12. Execute this command to run the script: 

```Bash
sh /path/to/update.sh project-name
```

If my update.sh is on my Desktop, I would execute 

```Bash
sh /Users/Jackson/Desktop/update.sh project-name
```

For example, if I had a project called "blackjack", I would execute

```Bash
sh /Users/Jackson/Desktop/update.sh blackjack
```
