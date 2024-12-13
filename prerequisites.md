<table style="border: none; width: 100%;">
  <tr>
    <td style="text-align: left; width: 50%;">
      <a href="https://justinxhale.github.io/instructlabdocs/">Back to Home</a>
    </td>
    <td style="text-align: right; width: 50%;">
      <a href="https://justinxhale.github.io/instructlabdocs/install.html">Next Page: Installation Guide</a>
    </td>
  </tr>
</table>

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

If the version is 3.11.x  Proceed to Step 3.
If the version is not 3.11.x or not installed: Install Python3 using Homebrew:

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
While not mandatory, Visual Studio Code (VSCode) provides a user-friendly text editor for managing files and directories. You can skip this step if you already have a preferred text editor. Check if VS Code is installed by running:

```
code --version
```
If VS Code is installed: You will see a version number. Proceed to Step 4.
If VS Dode is not installed: Install VS Code using Homebrew:

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
[x] VSCode is installed. (code --version) <br>
[x] GitHub CLI is installed (gh --version) <br>

# Proceed to next steps

Once these steps are complete, you’re ready to begin the InstructLab installation process by running:

```
ilab install instructlab --interactivemode
```

<table style="border: none; width: 100%;">
  <tr>
    <td style="text-align: left; width: 50%;">
      <a href="https://justinxhale.github.io/instructlabdocs/">Back to Home</a>
    </td>
    <td style="text-align: right; width: 50%;">
      <a href="https://justinxhale.github.io/instructlabdocs/install.html">Next Page: Installation Guide</a>
    </td>
  </tr>
</table>