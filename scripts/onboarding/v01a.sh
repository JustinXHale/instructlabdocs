#!/bin/bash

# ============================================
# Status & Colors
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

# Gold Prompt Function
gold_prompt() {
  echo -ne "\033[1;33m$1\033[0m"
  read -r "$2"
}

# ============================================
# Welcome Message
# ============================================
echo "======================================================"
echo "    Welcome to InstructLab's guided installation"
echo "======================================================"
add_spacing
echo "This quick guided setup is designed to help you get started with InstructLab."
add_spacing
echo "When finished, you’ll be ready to: 
√ Chat with pre-trained models.
√ Add knowledge to improve models.
√ Train your own custom models."
add_spacing
echo "LET'S GET STARTED"
add_spacing

# ==========================================================
# check if the user wants to get started with pre-requisites
# ==========================================================

gold_prompt "Start setup? [YES/no]: " proceed

if [[ "$proceed" =~ ^([Yy][Ee][Ss]|[Yy])$ ]]; then
    echo ""
    light_blue_text "The following prerequisite applications will be installed:"
    echo "1. Homebrew"
    echo "2. Python"
    echo "3. Git"
    echo "4. XCode"
    echo "5. Visual Code Studio (optional)"
    echo "6. GitHub CLI (optional)"
highlight "Note: You can choose to opt out of installing optional applications later."
add_spacing

    gold_prompt "Install prerequisite applications? [YES/no]: " confirm_install

    if [[ "$confirm_install" =~ ^([Yy][Ee][Ss]|[Yy])$ ]]; then
        echo ""
        light_blue_text "Starting setup..."
    else
        status_error "Setup canceled by the user."
        exit 1
    fi
else
    status_error "Setup aborted by the user."
    exit 1
fi
# ============================================
# Pre-Requisites Check
# ============================================

pre_requisites_check() {
echo "================================"
echo "Step 1: Checking Pre-Requisites"
echo "================================"
add_spacing
# Check & Simulate Xcode Command Line Tools Check
purple_text "xcode-select --install"
sleep 1
echo "XCode not found."
echo "Simulating installation of XCode..."
status_ok "xcode-select version 2409 installed."
add_spacing

# Check for Homebrew
purple_text "brew --version"
sleep 1
status_ok "Homebrew version 4.4.xx already installed."
add_spacing

# Python Version Selection
purple_text "python3 --version"
sleep 1
echo "Select the Python version to install:"
echo "[1] Python 3.11.x (Recommended)"
echo "[2] Python 3.10.x"
gold_prompt "Enter selected version: " python_choice

case "$python_choice" in
1)
  echo "Simulating installation of Python 3.11.x..."
  sleep 1
  python_version="3.11.x"
  status_ok "Python 3.11.x installed."
  ;;
2)
  echo "Simulating installation of Python 3.10.x..."
  sleep 1
  python_version="3.10.x"
  status_ok "Python 3.10.x installed."
  ;;
*)
  status_error "Invalid choice. Please run the script again and select a valid option."
  exit 1
  ;;
esac

add_spacing

# Simulate Git Check
purple_text "git --version"
sleep 1
echo "Git not found."
echo "Simulating installation of Git..."
sleep 1
status_ok "git version 2.39.5 (Apple Git-154) installed."
add_spacing
sleep 2

echo "--------------------------------"
echo "OPTIONAL INSTALLATIONS"
echo "--------------------------------"
sleep 1

# Check for VS Code
purple_text "code --version"
echo "Visual Code Studio is a text editor for editing configuration files and managing projects."
gold_prompt "Install Visual Code Studio? [YES/no]: " install_vscode

if [[ "$install_vscode" =~ ^([Yy][Ee][Ss]|[Yy])$ ]]; then
    echo "Simulating installation of Visual Code Studio..."
    sleep 1
    status_ok "Visual Code Studio 1.96.3 (arm64) installed."
else
    status_error "Skipping Visual Code Studio installation."
fi
add_spacing

# Check for GitHub CLI 
purple_text "gh --version"
echo "GitHub CLI enables you to manage repositories and authenticate with GitHub directly from the command line."
gold_prompt "Install GitHub CLI? [YES/no]: " install_ghcli
sleep 1
if [[ "$install_ghcli" =~ ^([Yy][Ee][Ss]|[Yy])$ ]]; then
    echo "Simulating installation of GitHub CLI..."
    sleep 1
    status_ok "gh version 2.63.2 (2024-12-05) successfully installed."
else
    status_error "Skipping GitHub CLI installation."
fi
add_spacing

echo "-----------------------------------"
echo "Pre-requisites Summary"
echo "-----------------------------------"

# Final Checks for User Confirmation
status_ok "XCode 2409 installed."
status_ok "Homebrew 4.4.xx installed."
status_ok "Git 2.39.5 installed."

# Dynamic Status for Python Version
    if [[ "$python_version" == "3.11.x" ]]; then
        status_ok "Python 3.11.x installed."
    elif [[ "$python_version" == "3.10.x" ]]; then
        status_ok "Python 3.10.x installed."
    else
        status_error "Python installation skipped."
    fi

    # Dynamic Status for VS Code
    if [[ "$install_vscode" =~ ^([Yy][Ee][Ss]|[Yy])$ ]]; then
        status_ok "Visual Code Studio installed."
    else
        status_error "Visual Code Studio not installed."
    fi

    # Dynamic Status for GitHub CLI
    if [[ "$install_ghcli" =~ ^([Yy][Ee][Ss]|[Yy])$ ]]; then
        status_ok "GitHub CLI 2.63.2 installed."
    else
        status_error "GitHub CLI not installed."
    fi

    light_blue_text "Pre-requisites installed, moving to Step 2 of 5."
    sleep 1
    add_spacing
}

add_spacing
huggingface_and_github_setup() {
echo "======================================================"
echo "Step 2: Hugging Face & GitHub setup"
echo "======================================================"
add_spacing

# Hugging Face Token Setup
light_blue_text "Checking for a locally-saved Hugging Face token..."
sleep 1  
status_error "No Hugging Face token found."

echo ""
echo "To create your token, follow these steps:"
echo "1. Visit https://huggingface.co/."
echo "2. Create an account if you don’t have one."
echo "3. Go to 'Settings > Access Tokens'."
echo "4. Create a token with READ permissions."
echo "5. Copy and the token."
add_spacing

gold_text "Paste your Hugging Face Token (or press [ENTER] to skip): "

# Masked Input Loop
hf_token=""
while IFS= read -r -s -n1 char; do
    if [[ -z "$char" ]]; then
        break
    fi
    hf_token+="$char"
    echo -n "*"
done
echo ""

# Set the Hugging Face token status
if [[ -z "$hf_token" ]]; then
    status_error "No token entered. Hugging Face token setup skipped."
    hf_token_status="skipped"
else
    status_ok "Hugging Face token saved."
    hf_token_status="saved"
fi

add_spacing

# GitHub Authentication
echo "Connecting to GitHub account."
highlight "UX Note: Using 'gh auth login' to authenticate and manage contributions."

gold_text "Authenticate GitHub? [YES or press [ENTER] to skip]: "
read -r gh_input

if [[ "$gh_input" =~ ^([Yy][Ee][Ss]|[Yy])$ ]]; then

# Simulate Authentication Steps
purple_text "gh auth login (SIMULATION)"
add_spacing
echo "Follow these steps to simulate GitHub authentication:"
echo "✔ Select 'GitHub.com'"
echo "✔ Choose HTTPS as the preferred protocol."
echo "✔ Authenticate via a web browser."
echo -e "Copy this one-time code: \033[1;33m1234-5678\033[0m"
read -r -p "Press [Enter] to simulate browser authentication..." fake_input
echo "✔ Authentication complete."
echo "✔ Configured git protocol: HTTPS"
echo "✔ Logged in as RedHatUXD"
gh_status="authenticated"
else
status_error "GitHub connection was skipped."
gh_status="skipped"
fi
add_spacing

}
sleep 2

# Confirmation Summary
huggingface_and_github_confirmation() {
echo "-----------------------------------"
echo "Hugging Face & GitHub Confirmation"
echo "-----------------------------------"

# Hugging Face Confirmation
if [[ "$hf_token_status" == "saved" ]]; then
    status_ok "Hugging Face token added."
else
    status_error "Hugging Face token skipped."
fi

# GitHub Confirmation
if [[ "$gh_status" == "authenticated" ]]; then
    status_ok "GitHub authenticated."
else
    status_error "GitHub authentication skipped."
fi

light_blue_text "Step 2 completed, moving to Step 3 of 5"
add_spacing

}

# ============================================
# Install InstructLab
# ============================================
install_instructlab() {
echo "======================================================"
echo "Step 3: Installing InstructLab"
echo "======================================================"
add_spacing
sleep 1

# Default installation directory
default_dir="$HOME/instructlab"
current_dir=$(pwd)

# Prompt user to use the current directory or default
gold_prompt "Do you want to install InstructLab in the current directory ($current_dir)? [YES/no]: " use_current_dir
if [[ "$use_current_dir" =~ ^([Yy][Ee][Ss]|[Yy])$ ]]; then
    install_dir="$current_dir"
else
    add_spacing
    gold_prompt "Specify the installation directory: " custom_dir
    if [[ -z "$custom_dir" ]]; then
        install_dir="$default_dir"  # Use default directory
    else
        install_dir="$custom_dir"  # Use custom directory
    fi
fi

# Simulate directory creation
echo "Checking directory: $install_dir"
sleep 1
if [[ ! -d "$install_dir" ]]; then
    echo "Directory $install_dir does not exist. Simulating creation..."
    echo "Command: mkdir -p $install_dir"
    sleep 1
    status_ok "Simulated creation of directory $install_dir."
else
    status_ok "Directory $install_dir already exists."
fi
add_spacing

# Simulate installation process (unchanged formatting)
echo "Simulating installation of InstructLab in $install_dir..."
echo "Creating environment..."
purple_text "python3.11 -m venv --upgrade-deps venv"
add_spacing
sleep 1
echo "Activating environment..."
purple_text "source venv/bin/activate"
add_spacing
sleep 1
echo "Removing cached files..."
purple_text "pip cache remove llama_cpp_python"
add_spacing
sleep 1
echo "Installing InstructLab..."
purple_text "pip install instructlab"
sleep 2
status_ok "InstructLab version 0.23.0 installed!"
light_blue_text "Step 3 completed, moving to Step 4 of 5"
add_spacing
}


# ============================================
# Configuration Setup (Imported from config.sh)
# ============================================
sleep 2
configuration_setup() {
  echo "====================================================="
  echo "Step 4: InstructLab configuration: 'ilab config init'"
  echo "====================================================="
  add_spacing

  echo "Set up your environment for InstructLab. Provide paths and select options, or press 'ENTER' use the default configuration."
  add_spacing

  # Step 1: Taxonomy Repository Setup
  echo "-----------------------------------------------"
  echo "Setting up taxonomy-repository"
  echo "-----------------------------------------------"
  highlight "UX Note: Configuring taxonomy repository using GitHub CLI."
add_spacing

  gold_text "Path to taxonomy repo [Press [ENTER] for default '/Users/$USER/Documents/instructlab/taxonomy']: "

  default_taxonomy_path="/Users/$USER/Documents/instructlab/taxonomy"
  read -r taxonomy_path
  taxonomy_path=${taxonomy_path:-$default_taxonomy_path}

  # Simulate Path Check
  if [[ ! -d "$taxonomy_path" || -z "$(ls -A "$taxonomy_path" 2>/dev/null)" ]]; then
    status_error "The directory '$taxonomy_path' does not exist or is empty."
    add_spacing

    gold_text "Select a taxonomy setup method"
    echo "[1] Fork the taxonomy repo to your GitHub account and clone your fork. (Recommended)"
    echo "[2] Clone the upstream taxonomy repo directly (read-only mode)."
    echo "[3] Use an existing taxonomy directory."
    add_spacing

    gold_prompt "Enter the selected method: " setup_choice
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
  echo "Setting up model directory"
  echo "-----------------------------------------------"
  gold_text "Enter the path to your model, or press [ENTER] to use the default path ('/Users/$USER/Documents/instructlab/models']): "
  sleep 1

  default_model_path="/Users/$USER/Documents/instructlab/models"
  read -r model_path
  model_path=${model_path:-$default_model_path}
  sleep 1

  purple_text "mkdir -p $model_path"
  status_ok "Model directory simulated as created: $model_path"
  add_spacing
  sleep 1

  # Step 3: Generate Configuration & Profile Files
  echo "-----------------------------------------------"
  echo "Generating configuration files"
  echo "-----------------------------------------------"
  purple_text "Simulating generation of config.yaml and system_profiles..."
  sleep 1

  echo "✔ Configuration files generated:"
  echo "- Config file: $taxonomy_path/config/config.yaml"
  echo "- System profiles: $taxonomy_path/config/system_profiles"
  add_spacing
  sleep 1

  # Completion Message
  echo "--------------------------------------------------------"
  status_ok "InstructLab configuration completed!"
  light_blue_text "Step 4 completed, moving to Step 5 of 5"
  echo "-------------------------------------------------------"
add_spacing
}

# ============================================
# Model Download
# ============================================
model_download() {
  echo "======================================================"
  echo "  Step 5: Downloading models"
  echo "======================================================"
  add_spacing

  purple_text "ilab model download"
  add_spacing
  echo "Downloading models..."
  sleep 2
  status_ok "Model download completed."
  add_spacing

  # List Models
  echo "Listing available models..."
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
    pre_requisites_check                # Step 1: Pre-requisites
    huggingface_and_github_setup        # Step 2: Interactive mode (Hugging Face, GitHub auth, InstructLab install)
    huggingface_and_github_confirmation #Step 2a confirmation
    install_instructlab                 # Step 3: Install InstructLab
    configuration_setup                 # Step 4: Additional configuration
    model_download                      # Step 5: Model download
    echo "================================================"
    status_ok "InstructLab setup completed!"
    echo "================================================"
    light_blue_text "Next: Run 'ilab model serve' to start using the model.
Exiting Interactive Mode. Enjoy INSTRUCTLAB!"
add_spacing
}

# Run Main
main