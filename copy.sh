#!/bin/bash

RESET="\033[0m"
BOLD="\033[1m"
CYAN="\033[36m"
GREEN="\033[92m"

# Prompt the user for the GitHub repository name and the library repository name
read -p "$(echo $BOLD$CYAN"Enter the library name (now is pyet-boilerplate-package): "$RESET)" library_repo_name
github_repo_url="git@github.com:Eye-Tech-AI/$library_repo_name.git"
read -p "$(echo $BOLD$CYAN"Enter your name (lowercase): "$RESET)" name

answers_file="copier-answers-$name.yaml"
echo $answers_file
# Get the current directory
current_dir=$(pwd)

# Move the main folder to a new folder with the library repository name
cd ..
copier copy -d "project_name=$library_repo_name" -d "github_repo_name=$library_repo_name" --data-file "pyet-boilerplate-package/$answers_file" --trust gh:Eye-Tech-AI/pyet-boilerplate-package "$library_repo_name"
cd "$library_repo_name"

## GitHub updates
git init
git add .
git commit -m "build: initial commit"
git remote add origin "$github_repo_url"
git branch -M master
git push -u origin master

# All done!
echo $BOLD$GREEN"Project has been created successfully!"$RESET
