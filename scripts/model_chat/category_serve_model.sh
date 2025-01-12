#!/bin/bash

# Categories array
categories=("Interaction" "Training" "Evaluation")

# Models for each category
interaction_models=("granite-7b-lab-Q4_K_M.gguf" "mistral-7b-instruct-v0.2.Q4_K_M.gguf")
training_models=("merlinite-7b-lab-Q4_K_M.gguf" "basalt-13b-train-v0.3.gguf")
evaluation_models=("fluorite-5b-eval-v0.1.gguf" "quartz-6b-eval-v0.2.gguf")

# Display categories
echo
echo "Select a category:"
for i in "${!categories[@]}"; do
    echo "[$i] ${categories[$i]}"
done

read -p "Enter the number corresponding to your choice: " category_choice
selected_category="${categories[$category_choice]}"

if [[ -z "$selected_category" ]]; then
    echo "Invalid selection. Exiting."
    exit 1
fi

echo "You selected category: $selected_category"
echo

# Display models based on selected category
case "$selected_category" in
    "Interaction")
        models=("${interaction_models[@]}")
        ;;
    "Training")
        models=("${training_models[@]}")
        ;;
    "Evaluation")
        models=("${evaluation_models[@]}")
        ;;
    *)
        echo "Invalid category. Exiting."
        exit 1
        ;;
esac

echo "Available models in $selected_category:"
for i in "${!models[@]}"; do
    echo "[$i] ${models[$i]}"
done

read -p "Enter the number corresponding to your model choice: " model_choice
selected_model="${models[$model_choice]}"
echo

if [[ -z "$selected_model" ]]; then
    echo "Invalid selection. Exiting."
    exit 1
fi

echo "You selected model: $selected_model"
echo "This is a demo. No actual commands are run."
