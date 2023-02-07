#!/usr/bin/env bash
set -e

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
echo "DIR: $DIR"

if [[ -z $1 ]]; then
  feature_branch_name="dark-mode"
else
  feature_branch_name="$1"
fi

current_branch=`git rev-parse --abbrev-ref HEAD`
echo "Current Branch: $current_branch"

feature_branch_result=`git branch --list ${feature_branch_name}`
if  [[ -z $feature_branch_exists ]]; then
  echo "Creating new feature branch: ${feature_branch_name}"
  git checkout -b ${feature_branch_name}
  current_branch=`git rev-parse --abbrev-ref HEAD`
  echo "Current Branch: $current_branch"
else
  echo "Feature branch '${feature_branch_name}' already exists, please delete it before trying again..."
  exit 2
fi

echo ""
echo "Building patch set on branch '${feature_branch_name}'"
echo "----------------------------------------------------"
echo ""
cd ${DIR}/../components
tar -xvf ${DIR}/patches.tgz octodexHeader.js
echo "done."