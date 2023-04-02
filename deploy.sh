#!/bin/bash

rm -rdf ./.quarto ./docs ./public ./tiny

sh render_github.sh
sh render_gitlab.sh
sh render_tiny.sh
echo "All renders done"

git add -A
echo "Modifications added."
git commit -m $1
echo "Commit with message done"

# Deploy at github
mv .gitignore .gitignorebak
mv .gitignore.github .gitignore
git push github main
echo "Deployed to github"

# Deploy at gitlab
mv .gitignore .gitignore.github
mv .gitignore.gitlab .gitignore
git push gitlab main
echo "Deployed to gitlab"

# Deploy at tiny
mv .gitignore .gitignore.gitlab
mv .gitignore.tiny .gitignore
git push tiny main
echo "Deployed to tiny"

# Rename again gitignore
mv .gitignore .gitignore.tiny
mv .gitignorebak .gitignore




