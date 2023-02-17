#!/bin/bash

eval "$(jq -r '@sh "GROUP_NAME=\(.group_name)"')"
result=$(az group exists -n $GROUP_NAME)

jq -n --arg exists "$result" '{"exists":$exists}'
