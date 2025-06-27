AI Git Commit Helper
====================

A lightweight Bash script that uses AI to generate descriptive commit messages and allows you to interactively edit and push them. Supports multiple AI backends (Groq, Google Gemini) and integrates seamlessly into your Git workflow.

Features
--------

*   **AI-Generated Commit Messages**: Automatically generate JSON-formatted commit messages summarizing staged changes via AI.
    
*   **Multi-Provider Support**: Plug in Groq or Google Gemini models by setting your API keys and model names.
    
*   **Interactive Editing**: Review and modify the AI’s suggested commit message in your favorite editor before committing.
    
*   **Easy Configuration**: Load credentials and settings from a .env file.
    
*   **One-Step Commit & Push**: Stage all changes, generate a message, edit it, then commit and push with a single command.
    

Prerequisites
-------------

*   **Bash** (version 4.0+)
    
*   **Git**
    
*   **jq** for JSON parsing
    
*   **curl** for HTTP requests
    
*   **An editor** set in the $EDITOR environment variable (defaults to vi)
    

Installation
------------

1.  git clone https://github.com/yourusername/ai-git-commit-helper.gitcd ai-git-commit-helper
    
2.  chmod +x auto-commit.sh
    
3.  sudo apt update && sudo apt install -y git jq curl
    

Configuration
-------------

1.  GROQ\_API\_KEY=your\_groq\_api\_key\_hereGEMINI\_API\_KEY=your\_gemini\_api\_key\_here
    
2.  AI\_SERVICE="groq" # or "gemini"GROQ\_AI\_MODEL\_NAME="llama3-70b-8192"GEMINI\_AI\_MODEL\_NAME="gemini-1.5-pro"
    
3.  export EDITOR=nano # or vim, code, etc.
    

Usage
-----

1.  git add
    
2.  ./auto-commit.sh
    
    *   The script will generate a JSON commit message.
        
    *   It opens your editor to let you refine the message.
        
    *   After you save and exit, it commits and pushes automatically.
        

Example Workflow
----------------

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   # Stage changes  git add .  # Generate, edit, commit, and push  ./auto-commit.sh   `

Troubleshooting
---------------

*   **No changes staged for commit.**: Make sure you have at least one file added via git add.
    
*   **Authentication errors**: Verify your API keys in .env and ensure network connectivity to the AI endpoints.
    
*   **JSON parsing errors**: The AI output must be valid JSON. If you see parsing failures, check that your AI prompt or response hasn’t introduced trailing commas.
    

Contributing
------------

1.  Fork the repo and create a new branch: git checkout -b feature-name
    
2.  Make your changes and commit them.
    
3.  Submit a pull request describing your improvements.
    

License
-------

This project is licensed under the MIT License.

