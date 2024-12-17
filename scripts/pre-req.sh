#!/bin/bash

# ============================================
# InstructLab Installation Demo Script
# Simulates the step-by-step onboarding flow
# ============================================

# Function for green 'status_ok' messages
status_ok() {
  echo -e "\033[0;32m✅ $1\033[0m"
}

# Function for red 'status_error' messages
status_error() {
  echo -e "\033[0;31m❌ $1\033[0m"
}

# Function to display commands in light purple
purple_text() {
  echo -e "\033[0;35m$1\033[0m"
}

# Function to display information in light blue
light_blue_text() {
  echo -e "\033[94m$1\033[0m"
}

# Function for gold-colored user prompts
gold_text() {
  echo -e "\033[1;33m$1\033[0m"
}

# Function for consistent line spacing
add_spacing() {
  echo
}

# ============================================
# Pre-Requisite Check Start
# ============================================

echo "============================================"
echo "   Welcome to the InstructLab Demo Script"
echo "============================================"
sleep 1
add_spacing

# Simulate Homebrew Check
purple_text "brew --version"
sleep 1
echo "Homebrew not found."

echo "Installing Homebrew..."
sleep 1
status_ok "Homebrew successfully installed."
add_spacing

# Simulate Python Check
purple_text "python3 --version"
sleep 1
echo "Python not found."

echo "Installing Python 3.11..."
sleep 1
status_ok "Python 3.11 successfully installed."
add_spacing

# Simulate Git Check
purple_text "git --version"
sleep 1
echo "Git not found."

echo "Installing Git..."
sleep 1
status_ok "Git successfully installed."
add_spacing

# Simulate VS Code Check
purple_text "code --version"
sleep 1
echo "VS Code not found."

echo "Installing VS Code ..."
sleep 1
status_ok "VS Code successfully installed."
add_spacing

# Simulate GitHub CLI Check
purple_text "gh --version"
sleep 1
echo "GitHub CLI not found."

echo "Installing GitHub CLI..."
sleep 1
status_ok "GitHub CLI successfully installed."
add_spacing

light_blue_text "Pre-requisites checks are complete!"
echo "=================================================="
status_ok "  All Prerequisites are now installed! "
status_ok "  You can proceed with InstructLab setup."
echo "=================================================="