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

# Function for consistent line spacing
add_spacing() {
  echo
}

# Function to highlight text with a blue background
highlight() {
  echo -e "\033[44m$1\033[0m"
}

# ============================================
# Welcome Message
# ============================================
echo "======================================================"
echo "  Welcome to InstructLab's Interactive Mode"
echo "  This mode will guide you through the installation."
echo "======================================================"
echo
echo "This guided setup ensures that all steps—account setup, installation, and configuration—are completed sucessfully."
echo "Whether you are new to the CLI or an experienced user, this walkthrough simplifies the process step-by-step."
add_spacing

# ============================================
# Step 1: Hugging Face Token Setup
# ============================================
echo "=================================="
echo "Setting up Hugging Face Account"
echo "=================================="
highlight "Saving your Hugging Face token locally simplifies model downloads later."

echo "Follow these steps to create your token:"
echo "1. Visit https://huggingface.co/."
echo "2. Create an account if you don’t already have one."
echo "3. Go to 'Settings > Access Tokens'."
echo "4. Create a token with 'READ' permissions and paste it below."
add_spacing

gold_text "Enter your Hugging Face Token (Press [ENTER] to skip): "
read -r hf_token
status_ok "Hugging Face token simulated as saved."
add_spacing

# ============================================
# Step 2: GitHub Authentication Setup
# ============================================
echo "===================================="
echo "Connecting to Your GitHub Account"
echo "===================================="
highlight "Using 'gh auth login' simplifies authentication and sets you up for upstream contributions."

echo "To contribute back to the upstream repository or even your personal one, you will need to connect your GitHub account.
If you do not have a free account visit htts://github.com before proceeding."
add_spacing

gold_text "Proceed to authenticate GitHub now? [Yes/Skip]: "
read -r gh_input

if [[ "$gh_input" =~ ^[Yy] ]]; then
  purple_text "gh auth login (SIMULATION)"
  add_spacing

  # Simulated Authentication Steps
  echo "Follow these steps to simulate GitHub authentication:"
  echo "✔ Select 'GitHub.com'"
  echo "✔ Choose HTTPS as the preferred protocol."
  echo "✔ Authenticate via a web browser."
  echo
  echo -e "Copy this one-time code: \033[1;33m1234-5678\033[0m"
  read -r -p "Press Enter to simulate browser authentication..." fake_input

  echo "✔ Authentication complete."
  echo "✔ Configured git protocol: HTTPS"
  echo "✔ Logged in as \033[94mJustinXHale\033[0m"
else
  status_error "GitHub connection was skipped. Continuing with the remaining setup."
fi
add_spacing

# ============================================
# Step 3: Directory Creation (Simulation)
# ============================================
echo "=========================================="
echo "Directory Creation and Environment Setup"
echo "=========================================="
highlight "Setting the default directory in 'Documents' makes InstructLab easier to locate and manage."

gold_text "Enter the path for InstructLab setup [Press ENTER for default '/Users/$USER/Documents/instructlab']: "
default_path="/Users/$USER/Documents/instructlab"
read -r dir_path
dir_path=${dir_path:-$default_path}
sleep 1

# Simulate Commands
purple_text "mkdir -p $dir_path"
echo "✔ Directory simulated as created: $dir_path"
sleep 1

purple_text "cd $dir_path"
echo "✔ Navigated to directory: $dir_path"
sleep 1
add_spacing

# ============================================
# Step 4: InstructLab Installation 
# ============================================
echo "=========================================="
echo "Installing InstructLab "
echo "=========================================="
highlight "This section sets up a Python virtual environment and installs InstructLab."
sleep 1

purple_text "python3 -m venv --upgrade-deps venv
 source venv/bin/activate
 pip uninstall instructlab
 rm -rf "~/Library/Application Support/instructlab" ~/Library/Caches/instructlab"
echo "✔ Python virtual environment set up. You are now in your python environment (venv), which is required to run Instruct Lab."
sleep 1

purple_text "pip cache remove llama_cpp_python
pip install instructlab"
sleep 1
add_spacing

# ============================================
# Completion Message
# ============================================
echo "======================================================================"
status_ok "InstructLab Version X.XX.X installation completed sucessfully!"
light_blue_text "Next Step: Run 'ilab config init' to initialize InstructLab."
echo "======================================================================"
