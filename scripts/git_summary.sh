#!/bin/bash

REPO_Path=$1

if [ -z "$REPO_Path" ]; then
	REPO_Path="."
fi

if [ ! -d "$REPO_Path/.git" ]; then
	echo "ERROR101: $REPO_Path is not a Git repo :("
	exit 1
fi
echo "Continuing....Processing....."

echo "Current Branch is $(git -C "$REPO_Path" branch --show-current)"
echo "Last 5 commits are $(git -C "$REPO_Path" log --oneline -5)"
echo "Current Status : $(git -C "$REPO_Path" status --short)"
echo "Number of uncommited changes $(git status --porcelain | wc -l)"

echo "Done."

