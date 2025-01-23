#!/bin/bash

# List of available models (Add or modify models as needed)
models=(
    "granite-7b-lab-Q4_K_M.gguf"
    "granite-7b-lab-q4_k_m.gguf - TRAINED"
    "mistral-7b-instruct-v0.2.Q4_K.gguf"
    "merlinite-7b-lab-Q4_K_M.gguf"
)

# Function to display available models
display_models() {
    echo "Available models:"
    for i in "${!models[@]}"; do
        echo "[$i] ${models[$i]}"
    done
}

# Prompt user to select a model
echo
echo "Please select a model to serve (demo mode):"
echo
display_models
echo
read -p "Enter the number corresponding to your choice [Default: 0]: " choice
echo

# Use default option if input is empty
if [[ -z "$choice" ]]; then
    choice=0
fi

# Validate user input
if [[ $choice =~ ^[0-9]+$ ]] && (( choice >= 0 && choice < ${#models[@]} )); then
    selected_model="${models[$choice]}"
    echo "You selected: $selected_model"
    
    # Simulate serving the selected model
    echo "Simulating: ilab model serve --model '/Users/jxhale/.cache/instructlab/models/$selected_model'"
    echo "This is a demo. No actual commands are run."
else
    echo "Invalid choice. Please run the script again and select a valid number."
    exit 1
fi
