#!/bin/bash

set -euo pipefail

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
NC='\033[0m'

if [ ! -d ".git" ]; then
    echo -e "${RED}This is not a git repository.${NC}"
    exit 1
fi

echo -e "${YELLOW}Fetching remote branches...${NC}"
git fetch -p

current_branch=$(git branch --show-current)
branches=$(git branch --merged | grep -v "\*" | grep -v "$current_branch" | grep -v master | grep -v main | grep -v acceptance | grep -v develop)

if [ -z "$branches" ]; then
    echo "No branches to delete."
else
    echo -e "The following branches will be deleted:"
    echo -e "${RED}$branches${NC}"

    read -r -p "Are you sure you want to delete these branches? [y/N]" confirm
    if [ -n "$confirm" ] && [[ "$confirm" = [yY] ]]; then
        echo "$branches" | xargs git branch -d
        echo -e "${GREEN}Branches deleted.${NC}"
    else
        echo -e "${GREEN}No branches were deleted.${NC}"
    fi
fi
