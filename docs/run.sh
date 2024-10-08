#!/bin/bash
# This is just a simple template that I use for running python scripts with
# command line arguments.
# It also creates a virtual environment and installs dependencies if they are
# not already installed.

# Check if the virtual environment exists
if [ ! -d "env" ]; then
    # Create the virtual environment
    python3 -m venv env
    # Install dependencies
    env/bin/python3 -m pip install --upgrade pip
    env/bin/python3 -m pip install -r requirements.txt
fi

# Run the python script
env/bin/python3 main.py "$@"
