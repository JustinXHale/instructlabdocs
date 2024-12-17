## instructlabdocs

This repository contains a pre-requisite script to help users quickly check and install required tools for InstructLab on MacOS. The script automates the setup of foundational tools like Homebrew, Python 3.11, Git, and GitHub CLI, ensuring a smooth onboarding experience.

# What Does the Script Do?
The script automates the following steps:

1. Checks for Homebrew and installs it if not found.
2. Checks for Python 3.11 and installs it if not found.
3. Checks for Git and installs it if not found.
4. Checks for GitHub CLI (gh) and installs it if not found.
5. Prompts users to proceed with the InstructLab installation setup.
6. Sets up a default directory for InstructLab, creates a virtual environment, and installs InstructLab.

# How to Use the Script
1. Open your Terminal on MacOS.
2. Run the following command to download and execute the script in one step:
```
curl -s https://raw.githubusercontent.com/JustinXHale/instructlabdocs/main/scripts/instructlab-demo.sh | bash
```
3. Follow the prompts provided in the terminal.
- The script will guide you step-by-step.
- If a tool is already installed, the script will skip its installation.

# Why Use This Script?
- Automates the tedious manual checks for pre-requisites.
- Reduces errors during the onboarding process.
- Provides clear prompts and color-coded feedback for better user experience.
- Saves time for both novice and experienced users.

# Additional Documentation
For detailed InstructLab onboarding steps, refer to the official documentation here:
[InstructLab Pre-Requisites Documentation](https://justinxhale.github.io/instructlabdocs/)