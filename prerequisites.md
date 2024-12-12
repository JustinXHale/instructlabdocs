# Prerequisites Instructions for InstructLab (MacOS)

These instructions guide MacOS users with M-Series chips to prepare their environment before installing and running InstructLab. 

---

## Step 1: Verify Homebrew Installation

Homebrew is a package manager for macOS. To check if Homebrew is installed, open your terminal and run:

```
brew --version
```

If Homebrew is installed: You will see a version number. Proceed to Step 2.
If Homebrew is not installed: Install Homebrew with the following command:

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

## Step 2: Verify Python3 Installation
InstructLab requires Python version 3.11.x. Check your Python version with:

```
python3 --version
```

If the version is 3.11.x or higher: Proceed to Step 3.
If the version is lower than 3.11.x or not installed: Install Python3 using Homebrew:

```
brew install python@3.11
```

## Step 3: Verify Git Installation
Git is required to clone repositories. Check if Git is installed by running:

```
git --version
```
If Git is installed: You will see a version number. Proceed to Step 4.
If Git is not installed: Install Git using Homebrew:

```
brew install git
```

# Step 4 (optional): Recommended: Install VSCode
While not mandatory, Visual Studio Code (VSCode) provides a user-friendly text editor for managing files and directories. You can skip this step if you already have a preferred text editor.
Install it with:

```
brew install --cask visual-studio-code
```

# Step 5 (Optional): Verify GitHub CLI is installed
While not mandatory or required. Install the GitHub CLI will simply futre GitHub task, like connecting your account. Check if GitHub is installed by running:

```
gh --version
```

If Github CLI is not installed, install via Homebrew:

```
brew install gh
```

# Summary Checklist
### Before proceeding, ensure the following:

[x] Homebrew is installed (brew --version). <br>
[x] Python3 (version 3.11.x) is installed (python3 --version). <br>
[x] Git is installed (git --version). <br>
[x] VSCode is installed. <br>
[x] GitHub CLI is installed <br>

# Proceed to next steps

Once these steps are complete, you’re ready to begin the InstructLab installation process by running:

```
ilab install instructlab
```

Next page [Installation Guide](install.md)