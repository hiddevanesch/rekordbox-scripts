#!/bin/bash

# do not forget to make this file executable:
# chmod +x setup.sh

# Define the name of the virtual environment
venvName=".venv"

# Check if the virtual environment directory already exists
if [ ! -d "$venvName" ]; then
    # Create a new Python virtual environment
    python -m venv "$venvName"
fi

# Activate the virtual environment
activateScript="$venvName/bin/activate"
if [ -f "$activateScript" ]; then
    source "$activateScript"
else
    echo "Virtual environment activation script not found. Please activate the environment manually."
fi

# Install dependencies from dependencies.txt
if [ -f "dependencies.txt" ]; then
    pip install -r dependencies.txt
else
    echo "dependencies.txt not found. Please provide a valid file containing dependencies."
fi
