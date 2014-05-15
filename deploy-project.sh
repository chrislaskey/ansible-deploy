#!/usr/bin/env bash

project_name=$1
webserver=$2
dbserver=$3

if [[ -z "$project_name" ]]; then
	echo "Error: this script takes two arguments. A <project-name> must be included:"
	echo "       ${0} project-name target-webserver <optional-dbserver>"
	exit 1
fi

if [[ -z "$webserver" ]]; then
	echo "Error: this script takes two arguments. A <target-hostname> must be included:"
	echo "       ${0} project-name target-webserver <optional-dbserver>"
	exit 1
fi

if [[ -z "$dbserver" ]]; then
	dbserver="$webserver"
fi

ansible-playbook -i hosts --extra-vars "project_name=${project_name}  webserver=${webserver} dbserver=${dbserver}" deploy-project/project-"$project_name".yml
