#!/bin/bash

git status

echo "Do you want to select specific files to commit? (y/n)"
read -r select_files

if [[ $select_files == "y" || $select_files == "Y" ]]; then
    echo "Enter file names (separated by spaces) or press Enter to cancel:"
    read -r file_list
    if [[ -z "$file_list" ]]; then
        echo "No files selected. Exiting..."
        exit 1
    fi
    git add $file_list
else
    git add .
fi

commit_message=${1:-"Auto commit on $(date +"%Y-%m-%d %H:%M:%S")"}

git commit -m "$commit_message"

echo "Commit completed with message: \"$commit_message\""
echo "Would you like to push the changes? (y/n)"
read -r confirm

if [[ $confirm == "y" || $confirm == "Y" ]]; then
    git push
    echo "Changes pushed successfully!"
else
    echo "Push aborted. Changes are committed locally."
fi

