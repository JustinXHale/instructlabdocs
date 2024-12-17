#!/bin/bash

# ============================================
# InstructLab Configuration Script
# Simulates the 'ilab config init' process
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

# Function to highlight text with a blue background
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
echo "==================================================="
echo "InstructLab Configuration: 'ilab config init'"
echo "==================================================="
add_spacing

echo "This guide will help you set up your environment for InstructLab."
echo "You will be prompted to provide necessary paths and choose options."
echo "Press 'ENTER' to select default values when prompted."
add_spacing

# ============================================
# Step 1: Taxonomy Repository Setup
# ============================================
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

purple_text "git remote -v"
echo "origin    https://github.com/yourusername/taxonomy (fetch)"
echo "origin    https://github.com/yourusername/taxonomy (push)"
echo "upstream  https://github.com/instructlab/taxonomy (fetch)"
echo "upstream  https://github.com/instructlab/taxonomy (push)"
add_spacing

# ============================================
# Step 2: Model Path Configuration
# ============================================
echo "-----------------------------------------------"
echo "Setting up Model Directory"
echo "-----------------------------------------------"
gold_text "Path to your model [Press ENTER for default '/Users/$USER/Documents/instructlab/models']: "

default_model_path="/Users/$USER/Documents/instructlab/models"
read -r model_path
model_path=${model_path:-$default_model_path}
add_spacing

purple_text "mkdir -p $model_path"
status_ok "Model directory simulated as created: $model_path"
add_spacing

# ==============================================
# Step 3: Generate Configuration & Profile Files
# ==============================================
echo "-----------------------------------------------"
echo "Generating Configuration Files"
echo "-----------------------------------------------"
purple_text "Simulating generation of config.yaml and system_profiles..."
sleep 1

echo "✔ Configuration files generated successfully:"
echo "- Config file: $taxonomy_path/config/config.yaml"
echo "- System profiles: $taxonomy_path/config/system_profiles"
add_spacing

# ============================================
# Completion Message
# ============================================
echo "==================================================="
status_ok "InstructLab Configuration Completed Successfully!"
light_blue_text "Next Step: Run 'ilab model download' to initialize InstructLab."
echo "==================================================="
