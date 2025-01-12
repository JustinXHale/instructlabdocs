#!/bin/bash

# ============================================
# InstructLab Model Download Script
# Simulates 'ilab model download' process
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
echo "==================================================="
echo "      InstructLab Model Download Script"
echo "==================================================="
echo "This script will guide you through downloading models for InstructLab."
add_spacing

# ============================================
# Step 1: Hugging Face Token Validation
# ============================================
echo "-----------------------------------------------"
echo "Validating Hugging Face Token"
echo "-----------------------------------------------"

# Check if HF_TOKEN is already set
if [[ -n "$HF_TOKEN" ]]; then
  status_ok "Hugging Face token detected from previous steps."
else
  highlight "Hugging Face token not found. You will need to enter it again."
  gold_text "Enter your Hugging Face Token [Press ENTER to skip]: "
  read -r hf_token
  export HF_TOKEN="$hf_token"
  status_ok "Hugging Face token saved successfully."
fi

add_spacing
purple_text "ilab model download --hf-token $HF_TOKEN"
status_ok "Token validated. Proceeding with model download..."
add_spacing

# ============================================
# Step 2: Simulating Model Download
# ============================================
echo "-----------------------------------------------"
echo "Downloading Models... (SIMULATION)"
echo "-----------------------------------------------"
sleep 1
echo "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Tempor lectus nunc lectus mattis litora mus. Suspendisse porttitor ex commodo vivamus imperdiet fusce."
sleep 2
echo "Nullam eros hac, blandit proin tortor malesuada. Pretium litora potenti porttitor magnis nisi."
sleep 1

status_ok "Model download simulated as complete!"
add_spacing

# ============================================
# Step 3: Listing Available Models
# ============================================
echo "-----------------------------------------------"
echo "Available Model Categories"
echo "-----------------------------------------------"
echo "- Interaction Model: Designed for interactive tasks, such as responding to user inputs or real-time interactions."
echo "- Teacher Model: Used for generating training data, often serving as a reference for supervised learning tasks."
echo "- Testing/Fine-Tune Model: Optimized for fine-tuning or testing specific tasks, allowing customization for particular use cases."
add_spacing

echo "Listing downloaded models..."
purple_text "ilab model list"
add_spacing

echo "+--------------------------------------------+---------------------+---------------------------------+"
echo "| Model                                      | Last Modified       | Size        | Category          |"
echo "+--------------------------------------------+---------------------+---------------------------------+"
echo "| granite-7b-lab-Q4_K_M.gguf                 | 2024-11-04 16:52:37 | 4.1 GB     | Interaction Model  |"
echo "| mistral-7b-instruct-v0.2.Q4_K_M.gguf       | 2024-11-04 16:54:39 | 4.1 GB     | Teacher Model      |"
echo "| merlinite-7b-lab-Q4_K_M.gguf               | 2024-11-04 16:55:10 | 2.5 GB     | Testing/Fine-Tune  |"
echo "+--------------------------------------------+---------------------+---------------------------------+"
status_ok "Models listed successfully."
add_spacing

# ============================================
# Step 4: Serve and Chat with Model
# ============================================
echo "==================================================="
status_ok "InstructLab installation and model download complete!"
echo "You are now ready to serve and chat with the model."
add_spacing

light_blue_text "Run the following command to start chatting:"
purple_text "ilab model serve"
add_spacing

echo "==================================================="
echo "I: Exiting Interactive Mode. Goodbye!"
