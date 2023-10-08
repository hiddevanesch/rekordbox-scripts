# Define the name of the virtual environment
$venvName = ".venv"

# Check if the virtual environment directory already exists
if (!(Test-Path .venv)) {
    # Create a new Python virtual environment
    python -m venv $venvName
}

# Activate the virtual environment
$activateScript = "$venvName\Scripts\Activate"
if (Test-Path $activateScript) {
    . $activateScript
} else {
    Write-Host "Virtual environment activation script not found. Please activate the environment manually."
}

# Install dependencies from dependencies.txt
if (Test-Path "dependencies.txt") {
    pip install -r dependencies.txt
} else {
    Write-Host "dependencies.txt not found. Please provide a valid file containing dependencies."
}