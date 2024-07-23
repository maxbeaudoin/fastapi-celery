#!/bin/bash

# Assuming the first argument passed to the script is the service name
serviceName=$1

# Get the service directory
servicePath="$(pwd)/$serviceName"

# Navigate to the service directory
cd "$servicePath"

# Activate the virtual environment and install dependencies
source venv/bin/activate
pip install -r requirements.txt
echo "Dependencies installed"

# Reminder to deactivate the virtual environment
echo "Remember to run 'deactivate' after you're done setting up."