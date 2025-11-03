-!/bin/bash
-set -e
#-------------------
# Frank Nicholas 
#-------------------

# reset - commit your changes or stash them before you merge
# git reset --hard - personal alias - grh

# checking if I have the latest files from github
echo "Checking for newer files online first"
git pull

# Backup everything inside the project folder
git add --all .

# Comment to the commit
echo "------------------------------------"
echo "Write your commit comment!"
echo "------------------------------------"

read input

# Commit to local repo 
git commit -m "$input"

# Sync with github
git push -u origin main

echo "----------------------------------------------------------------"
echo "-------------------    Git Push Done      ----------------------"
echo "----------------------------------------------------------------"
