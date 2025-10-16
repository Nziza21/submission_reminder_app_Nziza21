
#!/bin/bash

# COPILOT SHELL SCRIPT
# Updates assignment name in config.env

# Display header
echo "        COPILOT SHELL SCRIPT"

# Prompt user for new assignment name
read -p "Enter the new assignment name: " new_assignment

# Find the first submission_reminder_* folder
APP_DIR=$(find . -maxdepth 1 -type d -name "submission_reminder_*" | head -n1)

# Ensure a folder was found
if [[ -z "$APP_DIR" ]]; then
    echo "Error: Could not find any submission_reminder_* folder."
    exit 1
fi

CONFIG_FILE="$APP_DIR/config/config.env"
STARTUP_SCRIPT="$APP_DIR/startup.sh"

# Ensure config.env exists
if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Error: Config file not found at $CONFIG_FILE"
    exit 1
fi

# Update assignment in config.env
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=$new_assignment/" "$CONFIG_FILE"

echo "Assignment updated to '$new_assignment'!"
echo "New assignment set to: $(grep '^ASSIGNMENT=' "$CONFIG_FILE")"

# Run startup.sh inside the correct folder
if [[ -f "$STARTUP_SCRIPT" ]]; then
    echo ""
    echo "Running startup.sh for new assignment check..."
    (cd "$APP_DIR" && bash startup.sh)
else
    echo "⚠️ startup.sh not found in $APP_DIR"
fi

