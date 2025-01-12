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
# Welcome Message
# ============================================
echo "======================================================"
echo "  Welcome to InstructLab's Interactive Mode"
echo "  This mode will guide you through the installation."
echo "======================================================"
echo
echo "This guided setup process is designed to get you up and running 
with InstructLab as quickly and efficiently as possible. Whether you’re 
new to using a command-line interface (CLI) or an experienced user, 
this interactive mode ensures everything is configured step-by-step 
without missing a detail."
echo "Here’s what we’ll cover in this setup:"
echo "
- Install pre-requisites
- Account Setup: Set up your Hugging Face and GitHub accounts for model downloads and contributions. 
- Installation: Configure directories, install the necessary dependencies, and set up InstructLab. 
- Configuration: Initialize InstructLab with default or custom options based on your hardware and preferences. 
- Model Preparation: Download and verify your models to start using InstructLab."
add_spacing
echo "Throughout this process: 
- You will be prompted with simple [Yes/No] or [Enter] options to make decisions.
- You can stop at any time by pressing Ctrl+C or re-run the wizard if needed. 
- For advanced users, manual overrides and customization options are available."
add_spacing
echo "By the end of this setup, you will be ready to: 
√ Chat with pre-trained models.
√ Add knowledge to improve models.
√ Train your own custom models."
add_spacing
echo "LET'S GET STARTED"
add_spacing

# ==========================================================
# check if the user wants to get started with pre-requisites
# ==========================================================

gold_text "Do you want to proceed with the setup? [Yes/No]: "
read -r proceed_input
if [[ ! "$proceed_input" =~ ^[Yy] ]]; then
  status_error "Setup aborted by the user. Exiting."
  exit 1
fi
# ============================================
# Pre-Requisites Check
# ============================================

pre_requisites_check() {
  echo "======================================================"
  echo "  Step 1: Checking Pre-Requisites"
  echo "======================================================"
  highlight "These steps ensure the user will have everything the need to install InstructLab via
MacOS. This pre-req has add the the installation on GitHub CLI and VS Code. Doing this ensures
our users have the right tools from start to finish."
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
echo "======================================================"

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

  # Check VS Code
  if ! command -v code &>/dev/null; then
    status_error "VS Code not found. Installing..."
    brew install --cask visual-studio-code
    status_ok "VS Code installed successfully."
  else
    status_ok "VS Code is already installed."
  fi

  # Check GitHub CLI
  if ! command -v gh &>/dev/null; then
    status_error "GitHub CLI not found. Installing..."
    brew install gh
    status_ok "GitHub CLI installed successfully."
  else
    status_ok "GitHub CLI is already installed."
  fi

  add_spacing
  status_ok "All pre-requisites are installed."
}

# ============================================
# Interactive Mode
# ============================================
add_spacing
interactive_mode() {
  echo "======================================================"
  echo "  Step 2: Interactive Installation Mode"
  echo "======================================================"
  highlight "Saving your Hugging Face token locally simplifies model downloads later."
  add_spacing

  # Hugging Face Token Setup
echo "Follow these steps to create your token:"
echo "1. Visit https://huggingface.co/."
echo "2. Create an account if you don’t have one."
echo "3. Go to 'Settings > Access Tokens'."
echo "4. Create a token with 'READ' permissions and paste it below."
add_spacing  
gold_text "Enter your Hugging Face Token (Press [ENTER] to skip): "
  read -r hf_token
  export HF_TOKEN="$hf_token"
  status_ok "Hugging Face token saved successfully."
  add_spacing

  # GitHub Authentication
echo "Connecting to GitHub Account."
highlight "Using 'gh auth login' to authenticate and prepare for upstream contributions easily."

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
  echo "✔ Logged in as RedHatUXD"
else
  status_error "GitHub connection was skipped. Continuing with remaining InstructLab setup."
fi
add_spacing

if ! gh auth status &>/dev/null; then
  gold_text "GitHub authentication required. Proceeding to 'gh auth login'..."
  purple_text "gh auth login"
  sleep 1
  gh auth login --web
  if [[ $? -eq 0 ]]; then
    status_ok "GitHub account successfully authenticated."
  else
    status_error "GitHub authentication failed. Exiting setup."
    exit 1
  fi
else
  status_ok "GitHub was successfully authenticated or skipped."
fi
add_spacing
}

# ============================================
# Configuration Setup (Imported from config.sh)
# ============================================
sleep 1
configuration_setup() {
  echo "==================================================="
  echo "InstructLab Configuration: 'ilab config init'"
  echo "==================================================="
  add_spacing

  echo "This guide will help you set up your environment for InstructLab."
  echo "You will be prompted to provide necessary paths and choose options."
  echo "Press 'ENTER' to select default values when prompted."
  add_spacing

  # Step 1: Taxonomy Repository Setup
  echo "-----------------------------------------------"
  echo "Setting up Taxonomy Repository"
  echo "-----------------------------------------------"
  highlight "We will now configure your taxonomy repository using GitHub CLI."

  gold_text "Path to taxonomy repo [Press ENTER for default '/Users/$USER/Documents/instructlab/taxonomy']: "

  default_taxonomy_path="/Users/$USER/Documents/instructlab/taxonomy"
  read -r taxonomy_path
  taxonomy_path=${taxonomy_path:-$default_taxonomy_path}

  # Simulate Path Check
  if [[ ! -d "$taxonomy_path" || -z "$(ls -A "$taxonomy_path" 2>/dev/null)" ]]; then
    status_error "The directory '$taxonomy_path' does not exist or is empty."
    add_spacing

    gold_text "How would you like to set up your taxonomy?"
    echo "[1 - Default] Fork the taxonomy repo to your GitHub account and clone your fork."
    echo "[2] Clone the upstream taxonomy repo directly (read-only mode)."
    echo "[3] Use an existing taxonomy directory."
    add_spacing

    gold_text "Enter the number of your choice [1 - Recommended]: "
    read -r setup_choice
    add_spacing

    case "$setup_choice" in
      1)
        purple_text "gh repo fork instructlab/taxonomy --clone"
        echo "Forking https://github.com/instructlab/taxonomy.git..."
        echo "Cloning https://github.com/yourusername/taxonomy.git to $taxonomy_path"
        status_ok "Fork and clone simulated successfully."
        ;;
      2)
        purple_text "git clone https://github.com/instructlab/taxonomy.git $taxonomy_path"
        echo "Cloning upstream taxonomy repository to $taxonomy_path..."
        status_ok "Cloning upstream repository simulated successfully."
        ;;
      3)
        gold_text "Using existing taxonomy directory: $taxonomy_path"
        status_ok "Existing taxonomy directory accepted."
        ;;
      *)
        status_error "Invalid choice. Exiting setup."
        exit 1
        ;;
    esac
  fi
  add_spacing

  # Simulate Remote Configuration
  echo "✔ Remote repositories configured:"
  echo "- origin: https://github.com/yourusername/taxonomy (your fork)"
  echo "- upstream: https://github.com/instructlab/taxonomy (original repository)"
  add_spacing
  sleep 1

  purple_text "git remote -v"
  echo "origin    https://github.com/yourusername/taxonomy (fetch)"
  echo "origin    https://github.com/yourusername/taxonomy (push)"
  echo "upstream  https://github.com/instructlab/taxonomy (fetch)"
  echo "upstream  https://github.com/instructlab/taxonomy (push)"
  add_spacing
  sleep 1

  # Step 2: Model Path Configuration
  echo "-----------------------------------------------"
  echo "Setting up Model Directory"
  echo "-----------------------------------------------"
  gold_text "Path to your model [Press ENTER for default '/Users/$USER/Documents/instructlab/models']: "
  sleep 1

  default_model_path="/Users/$USER/Documents/instructlab/models"
  read -r model_path
  model_path=${model_path:-$default_model_path}
  add_spacing
  sleep 1

  purple_text "mkdir -p $model_path"
  status_ok "Model directory simulated as created: $model_path"
  add_spacing
  sleep 1

  # Step 3: Generate Configuration & Profile Files
  echo "-----------------------------------------------"
  echo "Generating Configuration Files"
  echo "-----------------------------------------------"
  purple_text "Simulating generation of config.yaml and system_profiles..."
  sleep 1

  echo "✔ Configuration files generated successfully:"
  echo "- Config file: $taxonomy_path/config/config.yaml"
  echo "- System profiles: $taxonomy_path/config/system_profiles"
  add_spacing
  sleep 1

  # Completion Message
  echo "==================================================="
  status_ok "InstructLab Configuration Completed Successfully!"
  light_blue_text "Next Step: Run 'ilab model download' to initialize InstructLab."
  echo "==================================================="
}

# ============================================
# Model Download
# ============================================
model_download() {
  echo "======================================================"
  echo "  Step 4: Downloading Models"
  echo "======================================================"
  add_spacing

  purple_text "ilab model download --hf-token $HF_TOKEN"
  add_spacing
  echo "Downloading models..."
  sleep 2
  status_ok "Model download completed successfully."
  add_spacing

  # List Models
  echo "Listing available models:"
  purple_text "ilab model list"
  add_spacing
  sleep 1
  echo "granite-7b-lab-Q4_K_M.gguf    | 4.1 GB | Interaction Model"
  echo "mistral-7b-instruct-v0.2.Q4_K | 4.1 GB | Teacher Model"
  echo "merlinite-7b-lab-Q4_K_M.gguf  | 2.5 GB | Testing/Fine-Tune"
  add_spacing
}

# ============================================
# Main Function
# ============================================
main() {
  pre_requisites_check
  interactive_mode
  configuration_setup
  model_download
echo "======================================================"
  status_ok "InstructLab installation and configuration completed successfully!"
echo "======================================================"
  light_blue_text "Next Step: Run 'ilab model serve' to start using the model."
  echo "Exiting Interactive Mode. Enjoy INSTRUCTLAB!"
  add_spacing
}

# Run Main
main