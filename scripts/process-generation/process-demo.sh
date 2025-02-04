# ============================================
# Status & Colors
# ============================================

# Green
status_ok() {
  echo "\033[1;32m✔️  $1\033[0m"
}

# Yellow
status_neutral() {
  echo "\033[1;33m➖  $1\033[0m"
}

# Red
status_error() {
  echo "\033[1;31m❌  $1\033[0m"
}

# Proceed Color
read_yellow() {
  # Print the message in yellow
  echo "\033[1;33m$1\033[0m"
  # Wait for user input
  read -p "" user_input
}

# Line Space
add_spacing() {
  echo
}

# Function to highlight text
highlight() {
  echo "\033[44m$1\033[0m"
}

# ============================================
# Welcome Message
# ============================================
echo "=================================="
echo "    Process Management - UX Demo"
echo "=================================="
add_spacing
echo "Presentation on recommended changes for various processes:"
echo "
√ ilab data generate -dt 
√ ilab process list 
√ ilab process attach --latest"
add_spacing
read_yellow "ENTER to continue..."

# ============================================
# ilab data generate -dt
# ============================================
echo "=================================="
echo "    ilab data generate -dt"
echo "=================================="
add_spacing
echo "--------------------------------"
echo " What is ilab data generate -dt"
echo "--------------------------------"
echo "This command allows users to run data generation in the background, 
freeing up their terminal for other tasks."
add_spacing

read_yellow "Proceed to UX Issues..."

echo "------------------------------"
echo " User and Experience Issue(s)"
echo "------------------------------"
echo "The detached process lacks clear messaging about pre-requisite failures, specifically 'ilab taxonomy diff'. If a user didn't run the command before hand, the process will still execute.
"
status_error "this is an issue because:"
echo "
1.Confusing Outcome: The process runs for 5 seconds without clear feedback, leaving users unsure of what happened.

2. Misleading Success: The process appears successful but doesn’t actually complete the intended task.

3. Wasted Effort: Users may spend unnecessary time troubleshooting, unaware of the missing pre-requisite.

4. Broken Flow: Running without validating pre-requisites disrupts the logical sequence of tasks.

5. Lack of Guidance: No clear message points users toward resolving the issue (e.g., running ilab taxonomy diff). "
add_spacing

read_yellow "Continue..."

echo "---------------------------"
echo " UX Recommendations"
echo "---------------------------"
add_spacing

echo "1. Validate pre-requisite (ilab taxonomy diff) before starting the process."
echo "2. Provide clear messaging if pre-requisites are not met."
echo "3. Highlight important Info"
add_spacing

read_yellow "Proceeding to 'ilab data generate -dt'..."

# Successful ilab data generate -dt
echo "------------------------------------------------"
echo " ilab data generate -dt with no taxonomy errors"
echo "------------------------------------------------"

sleep .5

echo "ilab data generate --dt"

sleep .5
status_ok "Taxonomy validation successful. Proceeding with data generation."

sleep .5
echo "INFO: 2025-01-25 00:00:00, 261"
Sleep .5
echo "instructlab.process.process:240: Started subprocess with PID 56511"
Sleep .5
echo "LOGS: /Users/username/.local/share/instructlab/logs/PATH.log"
Sleep .5
add_spacing
echo "Run 'ilab process list' to view current processes."
echo "Run 'ilab process attach --latest to view process in realtime"

add_spacing
read_yellow "Proceeding to 'ilab data generate -dt' WITH TAXONOMY ERROR"

# Failed ilab data generate -dt
echo "------------------------------------------------"
echo " ilab data generate -dt WITH TAXONOMY ERRORS"
echo "------------------------------------------------"

sleep .5
echo "ilab data generate --dt"

sleep .5
status_error "You have errors in your taxonomy that might affect generation. Run 'ilab taxonomy diff' to resolve."
highlight "Should 'ilab taxonomy diff' output me here?"
add_spacing

read -p "Press ENTER to proceed with errors or CTRL+C to cancel." temp
add_spacing
echo "INFO: 2025-01-25 00:00:00, 261"
echo "instructlab.process.process:240: Started subprocess with PID 56512"
echo "LOGS: /Users/username/.local/share/instructlab/logs/PATH-error.log"
add_spacing

read_yellow "Continue to 'ilab process list"

echo "=================================="
echo "    ilab process list"
echo "=================================="
add_spacing
echo "----------------------------"
echo " What is ilab process list"
echo "----------------------------"
echo "This command displays all running or recently completed processes, their status, and log file paths."
add_spacing

read_yellow "Proceed to User and Experience Issues..."

echo "------------------------------"
echo " User and Experience Issue(s)"
echo "------------------------------"
echo "Lack of clarity and usability in tracking and managing processes."
add_spacing

status_error "this is an issue because:"
add_spacing
echo "1. Wide Table Layout: includes long log file paths that make it difficult to read in standard terminal widths. Users may struggle to quickly scan for relevant information.

2. Once a process completes & exits, user must check logs to find old processes.

3. Type Correlation: If multiple of the same processes are running, users might not know which corresponds to what task, dataset, or model."

add_spacing
read_yellow "Proceeding to compressed table view..."

echo "------------------------------------------------"
echo " ilab process list (Compressed Table View)"
echo "------------------------------------------------"
add_spacing
echo "ilab process list"
echo "LOGS: /Users/username/.local/share/instructlab/logs/"
add_spacing

echo "+-------------+-------+------------------+-------------------+----------+"
echo "| Type        | PID   | UUID             | Log File          | Status   |"
echo "+-------------+-------+------------------+-------------------+----------+"
echo "| Generation  | 27192 | f79e513c-df38-11 | ~/logs/gen-123.log| Running  |"
echo "| Training    | 54321 | 903d09a2-df38-11 | ~/logs/train.log  | Completed|"
echo "+-------------+-------+------------------+-------------------+----------+"

add_spacing
echo "----"
echo "Goal: quickly access all necessary process details at a glance."
add_spacing
echo "Changes"
status_ok "Compressed view"
status_ok "Fits in default terminal view"
status_ok "LOG location is persistent"
highlight "Recommended at default table"
add_spacing

# Compressed with Descriptions
read_yellow "Proceeding to 'ilab process list' with Description..."

echo "------------------------------------------------"
echo " ilab process list (Compressed with Description)"
echo "------------------------------------------------"
add_spacing

echo "Command Used: ilab data generate --dt --desc "'Gen Project X files'""
add_spacing
echo "ilab process list"
echo "ilab process list"
echo "LOGS: /Users/username/.local/share/instructlab/logs/"
add_spacing

echo "+-------------+-------+------------------+-------------------+-----------------+"
echo "| Type        | PID   | UUID             | Log File          | Description     |"
echo "+-------------+-------+------------------+-------------------+-----------------+"
echo "| Generation  | 27192 | f79e513c-df38-11 | ~/logs/gen-123.log| Gen Project X..|"
echo "| Training    | 54321 | 903d09a2-df38-11 | ~/logs/train.log  | Fine-tune ABC..|"
echo "+-------------+-------+------------------+-------------------+-----------------+"

add_spacing
echo "----"
echo "Goal: provide users with additional context about each process while maintaining a compact view."
echo "Changes"
status_ok "Compressed with truncated descriptions (15 characters)"
status_ok "Maintains terminal-friendly width"
status_ok "LOG location remains persistent"
highlight "Recommended for users needing quick process identification"
add_spacing

# Expanded View
read_yellow "Proceeding to 'ilab process list --details'..."

echo "------------------------------------------------"
echo " ilab process list --details (Expanded View)"
echo "------------------------------------------------"
add_spacing
echo "ilab process list --details"
echo "LOGS: /Users/username/.local/share/instructlab/logs/"
add_spacing

# Simulated expanded table view
echo "+-------------+-------+------------------+--------------------------------+--------------------------------------------------------------------------+"
echo "| Type        | PID   | UUID             | Log File                       | Description                                                              |"
echo "+-------------+-------+------------------+--------------------------------+--------------------------------------------------------------------------+"
echo "| Generation  | 27192 | f79e513c-df38-11 | /Users/username/.local/share/instructlab/logs/gen-123.log             | Generating dataset for Project X  |"
echo "| Training    | 54321 | 903d09a2-df38-11 | /Users/username/.local/share/instructlab/logs/train-model.log         | Fine-tuning large model ABC       |"
echo "+-------------+-------+------------------+--------------------------------+--------------------------------------------------------------------------+"

echo "----"
echo "Goal: provide a fully detailed view of processes, including expanded log file paths and descriptions."
add_spacing
echo "Changes"
status_ok "Expanded table format"
status_ok "Displays full log paths and descriptions"
status_ok "More readable process differentiation"
add_spacing

# Detailed View
read_yellow "Proceeding to 'ilab process info <UUID>'..."

echo "------------------------------------------------"
echo " ilab process info <UUID> (Detailed View)"
echo "------------------------------------------------"
add_spacing

# Simulated detailed process information output
echo "ilab process info 12345"
add_spacing
echo "Type: Generation"
echo "PID: 27192"
echo "UUID: f79e513c-df38-11"
echo "Log File: /Users/username/.local/share/instructlab/logs/gen-123.log"
echo "Description: Generating dataset for Project X with default parameters."
echo "Status: Running"
add_spacing

echo "----"
echo "Goal: retrieve all available information about a specific process using its UUID."
add_spacing
echo "Changes"
status_ok "Provides full details for a single process"
status_ok "Includes expanded log path"
status_ok "Ensures traceability for active and completed processes"
highlight "Recommended for debugging and historical tracking"
add_spacing

read_yellow "Continue to 'ilab process attach --latest"

# ============================================
# ilab process attach --latest
# ============================================
echo "--------------------------------------"
echo " What is ilab process attach --latest"
echo "--------------------------------------"
echo "This command allows users to attach to the latest running process to monitor progress in real-time."
add_spacing

read_yellow "Continue..."

echo "---------------------------"
echo " User and Experience Issues"
echo "---------------------------"
echo "Users cannot detach without killing the process (confusing control flow)."
add_spacing

echo "------------------------------"
echo " ilab process attach --latest"
echo "------------------------------"
add_spacing

read_yellow "Press ENTER to demo the updated flow for 'ilab process attach --latest'..."

# Simulate process attach --latest
echo "ilab process attach --latest"
add_spacing
echo "Attaching to the latest process (PID: 12345)..."
echo "INFO: Attaching to process 12345."
add_spacing
echo "Press CTRL+C to detach and continue running in the background, or 
CTRL+D to detach and end the process."
add_spacing
echo "Progress: [#####-----] 50% Complete"
add_spacing

echo "---"
echo "Goal: Allow users to detach and reconnect without terminating entire process"
add_spacing
echo "Changes"
status_ok "1. Add clear instructions for detaching vs. killing the process."
status_ok "2. Improve messaging for detaching to processes."
add_spacing

read_yellow "Continue..."

# Selector
echo "------------------------------------------------"
echo " ilab process attach (Select from Running Processes)"
echo "------------------------------------------------"
add_spacing
echo "Available running processes:"
echo "+-------------+-------+------------------+-------------------+"
echo "| Type        | PID   | UUID             | Status           |"
echo "+-------------+-------+------------------+-------------------+"
echo "| Generation  | 27192 | f79e513c-df38-11 | Running          |"
echo "| Training    | 54321 | 903d09a2-df38-11 | Running          |"
echo "+-------------+-------+------------------+-------------------+"
add_spacing

read -p "Enter PID of the process you want to attach to: " selected_pid
echo "INFO: Attaching to process $selected_pid..."
echo "Press CTRL+C to detach and return to the terminal."
echo "Press CTRL+D to exit and stop the process."

add_spacing
read_yellow "Demo Complete! Thank you for reviewing."


echo "Presentation Complete! Thank you for reviewing."
