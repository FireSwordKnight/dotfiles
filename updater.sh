#!/usr/bin/env bash

targets='.ssh .gitconfig .profile .vimrc'
cd $(dirname ${BASH_SOURCE[0]})

for target in $targets
do 
	target_path="$HOME/$target"
	echo "Copying $target_path to $(pwd)..."
	cp -r $target_path $(pwd)
	echo "Staging $target..."
	git add $target
done

echo "Staging $(basename ${BASH_SOURCE[0]})..."
git add ${BASH_SOURCE[0]}
read -p "Enter commit message: " message
git commit -m "$message"

