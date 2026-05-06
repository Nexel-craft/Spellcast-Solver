#!/bin/bash

# Change to the directory where the script is located
cd "$(dirname "$0")"

echo "========================================================"
echo "              Spellcast Solver Launcher"
echo "========================================================"
echo ""

# Check if python3 is installed
if ! command -v python3 &> /dev/null
then
    echo "[ERROR] python3 could not be found."
    echo "Please install Python 3.10 or newer."
    exit 1
fi

# Check if .venv exists
if [ ! -f ".venv/bin/activate" ]; then
    echo "[INFO] First time setup: Creating virtual environment..."
    python3 -m venv .venv
fi

# Activate virtual environment
echo "[INFO] Activating virtual environment..."
source .venv/bin/activate

# Install dependencies
echo "[INFO] Checking dependencies..."
.venv/bin/python3 -m pip install -r requirements.txt

# Run the application
echo "[INFO] Launching Spellcast Solver..."
.venv/bin/python3 solver/main.py

# Keep terminal open if there's an error
if [ $? -ne 0 ]; then
    echo ""
    echo "[ERROR] The application crashed or an error occurred."
    read -p "Press return to exit..."
fi
