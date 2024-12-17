#!/bin/bash

echo "======================================="
echo "    InstructLab Pre-Requisites Script   "
echo "======================================="

# Function to check and install Homebrew
check_homebrew() {
    if ! command -v brew &>/dev/null; then
        echo "❌ Homebrew not found. Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    else
        echo "✔ Homebrew is already installed."
    fi
}

# Function to check and install Python 3.11
check_python() {
    if ! command -v python3 &>/dev/null || [[ "$(python3 --version)" != *"3.11"* ]]; then
        echo "❌ Python 3.11 not found. Installing Python 3.11..."
        brew install python@3.11
    else
        echo "✔ Python 3.11 is already installed."
    fi
}

# Function to check and install Git
check_git() {
    if ! command -v git &>/dev/null; then
        echo "❌ Git not found. Installing Git..."
        brew install git
    else
        echo "✔ Git is already installed."
    fi
}

# Function to check and install GitHub CLI
check_gh() {
    if ! command -v gh &>/dev/null; then
        echo "❌ GitHub CLI not found. Installing GitHub CLI..."
        brew install gh
    else
        echo "✔ GitHub CLI is already installed."
    fi
}

# Run all checks
check_homebrew
check_python
check_git
check_gh

# Final message
echo "=================================================="
echo "  All Prerequisites are now installed! "
echo "  You can proceed with InstructLab setup."
echo "  Run: ilab install instructlab --interactivemode"
echo "  HI FROM JUSTIN HALE, RED HAT... HOPE THIS WORKS!"
echo "=================================================="
