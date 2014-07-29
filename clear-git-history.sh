#!/bin/sh
 
##
# Removes all Git historyand loacl and remote branches & tags
# Reconstructs the repo with only the current content 
# Pushes to origin
##

git fetch --all -p

ORIGIN=$(git config --get remote.origin.url)
echo "Origin URL '$ORIGIN'"

CURR_BRN=$(git branch --no-color | grep '^\* ' | grep -v 'no branch' | sed 's/^* //g')
echo "Current Branch '$CURR_BRN'"

##
# Delete remote tags
##
TAGS=($(git tag))
echo "Tags '$TAGS'"
for i in "${TAGS[@]}"
do
   echo "Deleting Tag '$i'" 
   git push --delete origin $i -f
done

##
# Delete remote branches
##
REMOTE_BRNS=($(git branch -r --no-color | sed "s/^[* ] origin\///"))
echo "Remote Branches '$REMOTE_BRNS'"
for i in "${REMOTE_BRNS[@]}"
do
   if [[ "$CURR_BRN" == "$i" ]]; then
     echo "Skipping delete of current branch '$i'"
     continue
   fi

   echo "Deleting '$i'" 
   git push origin :$i -f
done

git fetch --all -p

rm -rf .git
git init
git add .
git commit -m "Initial commit"

git remote add origin $ORIGIN
git push -u --force origin master
