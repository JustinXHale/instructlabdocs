#!/bin/bash

# ============================================
# Combined InstructLab Installation Script
# Simulates the full onboarding flow for InstructLab
# ============================================

# Function for green 'status_ok' messages
status_ok() {
  echo -e "\033[0;32m✅ $1\033[0m"
}

# Function for red 'status_error' messages
status_error() {
  echo -e "\033[0;31m❌ $1\033[0m"
}

# Function to display commands in purple
purple_text() {
  echo -e "\033[0;35m$1\033[0m"
}

# Function to display information in light blue
light_blue_text() {
  echo -e "\033[94m$1\033[0m"
}

# Function for gold-colored prompts
gold_text() {
  echo -e "\033[1;33m$1\033[0m"
}

# Function to highlight text
highlight() {
  echo -e "\033[44m$1\033[0m"
}

# Function for consistent line spacing
add_spacing() {
  echo
}

# ============================================
# Pre-Requisites Check (Simulated Demo)
# ============================================

pre_requisites_check() {
  echo "==================================================="
  echo "  Simulating Pre-Requisite Checks for the Demo"
  echo "==================================================="
  highlight "This script includes simulated pre-requisite issues for demonstration purposes.
On a clean system, these tools will be installed if missing."
  add_spacing

  # Simulate Homebrew Check
  purple_text "Checking for Homebrew..."
  echo "Homebrew not found. Simulating installation..."
  sleep 1
  status_ok "Homebrew successfully installed (SIMULATION)."
  add_spacing

  # Simulate Python Check
  purple_text "Checking for Python 3.11..."
  echo "Python 3.11 not found. Simulating installation..."
  sleep 1
  status_ok "Python 3.11 successfully installed (SIMULATION)."
  add_spacing

  # Simulate Git Check
  purple_text "Checking for Git..."
  echo "Git not found. Simulating installation..."
  sleep 1
  status_ok "Git successfully installed (SIMULATION)."
  add_spacing

  # Simulate GitHub CLI Check
  purple_text "Checking for GitHub CLI..."
  echo "GitHub CLI not found. Simulating installation..."
  sleep 1
  status_ok "GitHub CLI successfully installed (SIMULATION)."
  add_spacing

  # Simulate VS Code Check
  purple_text "Checking for VS Code (optional)..."
  echo "VS Code not found. Simulating installation..."
  sleep 1
  status_ok "VS Code successfully installed (SIMULATION)."
  add_spacing

  # ============================================
  # Actual Checks (Validation)
  # ============================================
  echo "==================================================="
  echo "  Validating Pre-Requisites on Your System"
  echo "==================================================="

  # Check Homebrew
  if ! command -v brew &>/dev/null; then
    status_error "Homebrew not found. Installing..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    status_ok "Homebrew installed successfully."
  else
    status_ok "Homebrew is already installed."
  fi

  # Check Python 3.11
  if ! python3 --version | grep -q "3.11"; then
    status_error "Python 3.11 not found. Installing..."
    brew install python@3.11
    status_ok "Python 3.11 installed successfully."
  else
    status_ok "Python 3.11 is already installed."
  fi

  # Check Git
  if ! command -v git &>/dev/null; then
    status_error "Git not found. Installing..."
    brew install git
    status_ok "Git installed successfully."
  else
    status_ok "Git is already installed."
  fi
  

  # Check GitHub CLI
  if ! command -v gh &>/dev/null; then
    status_error "GitHub CLI not found. Installing..."
    brew install gh
    status_ok "GitHub CLI installed successfully."
  else
    status_ok "GitHub CLI is already installed."
  fi

  # Check VS Code
  if ! command -v code &>/dev/null; then
    status_error "VS Code not found. Installing..."
    brew install --cask visual-studio-code
    status_ok "VS Code installed successfully."
  else
    status_ok "VS Code is already installed."
  fi

  status_ok "All pre-requisites are installed and verified."
}

pre_requisites_check
add_spacing