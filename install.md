<table style="border: none; width: 100%;">
  <tr>
    <td style="text-align: left; width: 50%;">
      <a href="https://justinxhale.github.io/instructlabdocs/prerequisites.html">Back to Prerequisites</a>
    </td>
    <td style="text-align: right; width: 50%;">
      <a href="#">Next Page: Running and Chating with Model</a>
    </td>
  </tr>
</table>

# Install Instructions for InstructLab (MacOS)
This guide provides step-by-step instructions for setting up InstructLab using the Interactive Mode Demo Script. The interactive mode simplifies the process by guiding users through pre-requisite checks, account setups, and configuration steps, making it suitable for both novice and advanced users.

# Installation Overview
The installation involves the following steps:

1. Pre-requisite checks and installations (e.g., Xcode, Homebrew, Python).
2. Adding a Hugging Face token and authenticating GitHub.
3. Installing InstructLab in a virtual environment.
4. Configuring taxonomy and model directories.
5. Simulating the download of models.
6. Each step is clearly outlined, providing feedback and summaries for user confirmation.

# Start Interactive Mode
Begin the setup process by running the interactive mode script.
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

# Step 1: Pre-Requisite Checks
The script simulates checking and installing necessary tools:

- Xcode Command Line Tools
- Homebrew
- Python (with version selection: 3.11.x or 3.10.x)
- Git
- Optional tools: VS Code, GitHub CLI

Example output:
```
================================
Step 1: Checking Pre-Requisites
================================
✅ X-Code 2409 successfully installed.
✅ Homebrew 4.4.xx successfully installed.
✅ Python 3.11.x successfully installed.
✅ Git 2.39.5 successfully installed.
❌ VS Code not installed.
✅ GitHub CLI 2.63.2 successfully installed.
```
Users are prompted for optional tools like VS Code and GitHub CLI, with their choices reflected in the confirmation summary.

# Step 2: Account Setups
## Hugging Face
You’ll need a Hugging Face API token to access models. The script guides you through:

1. Creating an account at Huggingface.com.
2. Navigating to Settings > Access Tokens.
3. Generating a token with READ permissions.
4. Entering the token in the CLI.
Masked input ensures security during token entry.

## GitHub Authentication
The script simulates authenticating with GitHub using gh auth login. You can skip this step or follow the interactive prompts:

- Select GitHub.com as the platform.
- Choose HTTPS as the protocol.
- Log in using your browser.

# Step 3: Installing InstructLab
The script simulates installing InstructLab into a Python virtual environment. You can:

- Install in the current directory.
- Specify a custom installation path.
- Use the default directory: ~/instructlab.

# Step 4: Configuration Setup
The script guides users through configuring taxonomy and model directories:
- Taxonomy Repository Path:
  - Fork the upstream taxonomy repo to your GitHub account.
  - Clone the fork.
  - Use an existing taxonomy directory.
- Model Directory Path:
  - Specify a directory for storing models, or press [Enter] to use the default.

Configuration includes:
- Detecting hardware profiles.
- Generating configuration files and profiles.

# Step 5: Simulating Model Download
The script simulates downloading and listing pre-trained models. 

<table style="border: none; width: 100%;">
  <tr>
    <td style="text-align: left; width: 50%;">
      <a href="https://justinxhale.github.io/instructlabdocs/prerequisites.html">Back to Prerequisites</a>
    </td>
    <td style="text-align: right; width: 50%;">
      <a href="#">Next Page: Running and Chating with Model</a>
    </td>
  </tr>
</table>