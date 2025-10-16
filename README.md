**Submission Reminder App**

**Description**

This project is a simple yet functional shell-based application that reminds students about upcoming assignment deadlines.
It automates environment setup, updates assignments dynamically, and helps track pending submissions — all using Bash scripting.

**create_environment.sh — The Architect**

This script is the foundation of the app.
It automatically sets up the entire directory structure and places all the required files for the reminder system.

**What it does:**

Prompts the user to enter their name.

Creates a folder named submission_reminder_{YourName}.

Builds all necessary subdirectories:

app/ – contains reminder.sh

assets/ – holds submissions.txt

config/ – includes config.env

modules/ – contains functions.sh

Adds the startup.sh script automatically.

Makes all .sh files executable.

In short: it builds the entire app environment in seconds — no manual setup required.

**copilot_shell_script.sh — The Controller**

This script acts as the user-friendly interface for updating and testing assignments dynamically.

**What it does:**

Prompts the user to enter a new assignment name.

Replaces the existing assignment value in config/config.env.

Automatically reruns startup.sh to check which students haven’t submitted for the new assignment.

Works seamlessly with any generated app folder (like submission_reminder_Nziza).

This script keeps the reminder app flexible and up-to-date with each new assignment.

**Git Branching Workflow**

To ensure a clean and professional workflow, Git branches were used effectively:

Feature Branch (feature/setup) – used for rough work, development, and testing.

Main Branch (main) – contains the final, polished submission-ready version.

**Final repository structure (main branch):**

submission_reminder_app_Nziza21/
├── create_environment.sh
├── copilot_shell_script.sh
└── README.md

**How It Works**
1. Set up the environment
bash create_environment.sh


You’ll be prompted for your name.
This creates a folder like submission_reminder_Nziza with all subdirectories and files.

**2. Run the app**
cd submission_reminder_Nziza
./startup.sh


**You’ll see:**

The current assignment name

Days remaining to submit

A list of students who haven’t submitted yet

3. Update assignment name
cd ..
./copilot_shell_script.sh


Enter the new assignment name when prompted.
The app updates config.env and automatically re-runs to show updated reminders.

**Key Design Choices**

Automated setup to avoid manual directory creation.

Dynamic assignment updates for real-time flexibility.

Branching discipline to separate development from the final output.

Simple, readable Bash logic for easy debugging and learning.

**Lessons Learned**

Proper Git branching improves organization and version control.

Bash scripting can automate even complex setups efficiently.

Using modular structures (config/, app/, modules/) keeps projects maintainable.

Testing incrementally helps isolate and fix issues quickly.

**Final Structure (Main Branch)**
submission_reminder_app_Nziza21/
├── create_environment.sh
├── copilot_shell_script.sh
└── README.md

**Final Thoughts**

This project shows how shell scripting, automation, and Git workflows can come together to form a fully functional, real-world style application.
It’s simple, scalable, and efficient — a small but complete Linux-based project.

“Automation is about freeing humans to focus on thinking — not typing.”
