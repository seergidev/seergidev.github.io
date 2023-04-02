#!/bin/bash

rm -rdf ./.quarto ./docs ./public ./tiny

sh render_github.sh
sh render_gitlab.sh
sh render_tiny.sh

git add -A
git commit -m $1

# Deploy at github
mv .gitignore .gitignorebak
mv .gitignore.github .gitignore
git push github main

# Deploy at gitlab
mv .gitignore .gitignore.github
mv .gitignore.gitlab .gitignore
git push gitlab main

# Deploy at tiny
mv .gitignore .gitignore.gitlab
mv .gitignore.tiny .gitignore
git push tiny main

# Rename again gitignore
mv .gitignore .gitignore.tiny
mv .gitignorebak .gitignore




