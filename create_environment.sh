
#!/bin/bash
# Script to set up the Submission Reminder App environment with provided content

echo "Enter your name:"
read name

# Main directory
main_dir="submission_reminder_$name"
mkdir -p "$main_dir/app" "$main_dir/modules" "$main_dir/assets" "$main_dir/config"

# -------- Create config.env --------
cat <<EOL > "$main_dir/config/config.env"
# Configuration for Submission Reminder App
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

# -------- Create functions.sh --------
cat <<'EOL' > "$main_dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOL

# -------- Create reminder.sh --------
cat <<'EOL' > "$main_dir/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOL

# -------- Create submissions.txt --------
cat <<EOL > "$main_dir/assets/submissions.txt"
student,assignment,submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
EOL

# -------- Create startup.sh --------
cat <<'EOL' > "$main_dir/startup.sh"
#!/bin/bash
echo "Starting Submission Reminder App..."
bash ./app/reminder.sh
EOL

# -------- Make all .sh files executable --------
find "$main_dir" -type f -name "*.sh" -exec chmod +x {} \;

echo "✅ Environment setup complete!"
echo "Navigate into $main_dir and run ./startup.sh to start the app."
