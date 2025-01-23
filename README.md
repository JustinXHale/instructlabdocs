## instructlabdocs

This repository contains a demo script designed to simulate the onboarding process for setting up InstructLab. The script provides an interactive experience to guide users through all necessary pre-requisite checks, installations, and configurations.

# How to Use the Script
1. Open your Terminal on MacOS.
2. Run the following command to download and execute the script in one step:
```
curl -s https://raw.githubusercontent.com/your-repo-path/v01-onboarding-demo.sh -o v01-onboarding-demo.sh
```
3. Make the Script Executable
```
chmod +x v01-onboarding-demo.sh
```
4. Run the script
```
./v01-onboarding-demo.sh
```
5. Follow the interactive prompts in your terminal.

# Features
## Interactive Setup:
- Step-by-step guidance for each part of the installation process.
- Clear prompts with color-coded feedback.

## Comprehensive Pre-Requisite Check:
- Simulates the installation of:
    - Xcode Command Line Tools
    - Homebrew
    - Python (with version selection)
    - Git
    - Optional tools like VS Code and GitHub CLI

## Hugging Face Token and GitHub Authentication:
- Guides users through creating and adding a Hugging Face token.
- Simulates GitHub authentication with gh auth login.

## InstructLab Installation:
- Simulates the setup of a Python virtual environment and the installation of InstructLab.
- Allows users to choose the installation directory or use the current/default directory.

## Configuration Setup:
- Guides users through setting up the taxonomy and model directories.
- Simulates generating configuration files for InstructLab.

## Model Download:
- Simulates downloading and listing available models.

# Additional Documentation
For detailed InstructLab onboarding steps, refer to the official documentation here:
[InstructLab Pre-Requisites Documentation](https://justinxhale.github.io/instructlabdocs/)