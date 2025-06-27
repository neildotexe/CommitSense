CommitSense
===========

A Bash-based AI assistant for crafting and pushing Git commit messages with one command.

Repository Structure
--------------------

*   auto-commit.sh – Core script that:
    
    *   Captures staged diffs (git diff --cached).
        
    *   Sends them to an AI (Groq or Gemini).
        
    *   Parses the JSON response for commit\_message and file summaries.
        
    *   Opens the draft in your $EDITOR for final edits.
        
    *   Commits and pushes to the remote.
        
*   daily\_commit.sh – Cron-driven report generator that:
    
    *   Loads your .env for credentials.
        
    *   Collects today’s commits (git log --since="midnight").
        
    *   Emails a summary to MAIL\_RECIPIENT.
        
*   GROQ\_API\_KEY=your\_groq\_keyGEMINI\_API\_KEY=your\_gemini\_keyMAIL\_RECIPIENT=your\_email@example.com
    
*   LICENSE – MIT license file.
    
*   .gitignore – Patterns to exclude temporary or sensitive files.
    

Features
--------

*   **AI-Powered Commit Drafts**: Automatically generate JSON-formatted commit messages.
    
*   **Backend Flexibility**: Support for Groq and Google Gemini.
    
*   **Interactive Review**: Edit suggestions in your choice of editor.
    
*   **Daily Summaries**: Optional cron job to email daily commit reports.
    

Prerequisites
-------------

*   Bash 4.0+
    
*   Git
    
*   jq (JSON parsing)
    
*   curl (HTTP requests)
    
*   Mail utility (mail or mailx) for daily reports
    
*   Editor defined in $EDITOR (defaults to vi)
    

Installation
------------

1.  git clone https://github.com/neildotexe/CommitSense.gitcd CommitSense
    
2.  chmod +x auto-commit.sh daily\_commit.sh
    
3.  sudo apt update && sudo apt install -y git jq curl mailutils
    

Configuration
-------------

1.  cp .env.example .env# then edit .env
    
2.  AI\_SERVICE="groq" # or "gemini"
    
3.  export EDITOR=nano # or vim, code --wait, etc.
    
4.  (For daily reports) ensure MAIL\_RECIPIENT is set in .env.
    

Usage
-----

### Interactive Commit

1.  git add
    
2.  ./auto-commit.shThe script will generate, open for editing, commit, and push your message.
    

### Daily Commit Report

1.  0 18 \* \* \* /absolute/path/to/CommitSense/daily\_commit.sh >> /absolute/path/to/CommitSense/cron.log 2>&1
    
2.  The script will email a summary of that day’s commits to the address in MAIL\_RECIPIENT.
    

Troubleshooting
---------------

*   **No staged changes:** Ensure you ran git add before auto-commit.sh.
    
*   **API errors:** Verify GROQ\_API\_KEY / GEMINI\_API\_KEY in .env.
    
*   **Malformed JSON:** If the AI reply has parse errors, inspect the raw output and adjust prompts or retry.
    
*   **Email not sent:** Confirm mailutils (or similar) is installed and MAIL\_RECIPIENT is valid.
    

Contributing
------------

1.  git checkout -b feature/awesome
    
2.  git commit -am "Add awesome feature"
    
3.  Push and open a Pull Request.
    

License
-------

This project is licensed under the MIT License.
