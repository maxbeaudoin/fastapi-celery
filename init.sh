#!/bin/bash

# Define an array of service names
serviceNames=("api" "flower" "worker")

# Loop through each service name
for serviceName in "${serviceNames[@]}"; do
    # Create the service directory if it doesn't exist
    servicePath=$(pwd)/$serviceName
    if [ ! -d "$servicePath" ]; then
        mkdir -p "$servicePath"
        echo "Created directory for $serviceName"
    else
        echo "$serviceName directory already exists"
    fi

    # Navigate to the service directory
    cd "$servicePath"

    # Check if the virtual environment already exists before creating it
    venvPath="$servicePath/venv"
    if [ ! -d "$venvPath" ]; then
        python3.11 -m venv venv
        echo "Virtual environment created"
    else
        echo "Virtual environment already exists"
    fi

    # Create an empty requirements.txt file if it doesn't exist
    requirementsPath="$servicePath/requirements.txt"
    if [ ! -f "$requirementsPath" ]; then
        touch "$requirementsPath"
        echo "Created empty requirements.txt"
    else
        echo "requirements.txt already exists"
    fi

    # Navigate back to the original directory after each iteration
    cd - > /dev/null
done