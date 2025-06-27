#!/bin/bash

# Load environment variables
if [ -f .env ]; then
        export $(grep -v '^#' .env | xargs)
fi

# Set the repository directory
REPO_DIR="/home/ec2-user/CommitSense"

# Change to the repository directory
cd "$REPO_DIR" || exit 1

# # Collect commits since midnight
COMMITS=$(git log --since="midnight" --pretty=format:"%h – %s by %an")

# Create the email body
if [ -z "$COMMITS" ]; then
        BODY="No commits have been made today."
else
        BODY="Here are today’s commits (since 00:00):\n\n$COMMITS"
fi
# Send email
echo -e "$BODY" | mail -s "[$(basename "$REPO_DIR")] Daily Commit Report for $(date +%Y-%m-%d)" "$MAIL_RECIPIENT"
