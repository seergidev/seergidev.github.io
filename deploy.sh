#!/bin/bash

rm -rdf ./.quarto ./docs ./public ./tiny

sh render_github.sh
sh render_gitlab.sh
sh render_tiny.sh

git add -A
echo "Modifications added."
git commit -m "$1"
echo "Commit with message done"

# Deploy at github
git push github main
echo "Deployed to github"

# Deploy at gitlab
git push gitlab main
echo "Deployed to gitlab"

# Deploy at tiny
git push tiny main
echo "Deployed to tiny"





