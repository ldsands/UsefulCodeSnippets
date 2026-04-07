# Claude and Open Code

## Claude Code

### Notes, Tips, and Guides

- [A script that applies "fixes" to claude code that re-enables previous instructions that increase Claude Code's accuracy but also token usage](https://gist.github.com/roman01la/483d1db15043018096ac3babf5688881)
    - In the wake of the leaks some changes were found that decreased the token usage but also made it not as good as a lot of coding tasks as it was before ([more here](https://www.reddit.com/r/ClaudeCode/comments/1seo9gg/anthropic_stayed_quiet_until_someone_showed/))
    - commands to download and apply `git clone https://gist.github.com/roman01la/483d1db15043018096ac3babf5688881.git` then you can use the commands below

        ```sh
        git clone https://gist.github.com/roman01la/483d1db15043018096ac3babf5688881.git
        ./patch-claude-code.sh              # apply patches
        ./patch-claude-code.sh --watch # apply + auto-repatch after updates (macOS/Linux)
        ./patch-claude-code.sh --restore    # undo everything
        ./patch-claude-code.sh --check # check if patches are applied
        ./patch-claude-code.sh --dry-run    # preview without modifying
        ```

- Add some lines to the global Claude.md
    - the global Claude.md file can be found here: `~/.claude/CLAUDE.md` or here for Windows Powershell: `C:\Users\$env:USERNAME\.claude\CLAUDE.md` (same for Windows using Nushell)
    - Some things to add to the global Claude.md for my own workflows

    ```nushell
    mkdir ~/.claude
    "## Python Project Rules

    - NEVER use my system python instead use uv managed python (e.g. uv run ...)

    ## Other General Instructions

    - When making commits NEVER put in anything like 'Coauthord by ...' or anything similar

    " | save --append ~/.claude/CLAUDE.md
    ```

    - Some things to add to the global Claude.md based on some suggestions ([more about this here](https://www.reddit.com/r/ClaudeCode/comments/1sed183/boris_cherny_explains_some_recent_changes_to/))
        - For linux

        ```nushell
        mkdir ~/.claude

        "## Code Quality
            - Prefer correct, complete implementations over minimal ones.
            - Use appropriate data structures and algorithms - don't brute-force what has a known better solution.
            - When fixing a bug, fix the root cause, not the symptom.
            - If something I asked for requires error handling or validation to work reliably, include it without asking.

        - \"correct, complete over minimal\" - directly counters the \"simplest approach first\" default without saying \"write more code.\" It's a quality signal, not a quantity signal.
        - \"appropriate data structures\" - this is the AABB tree vs brute-force issue from the *gist. Nudges toward doing it right when the right way is known.
        - \"root cause not symptom\" - prevents band-aid fixes that break again later. Future-proofing in one line.
        - \"include error handling if needed\" - the default prompt says \"don't add error handling for scenarios that can't happen,\" which is fine, but for a non-expert dev it's better to err on the side of resilience." | save --append ~/.claude/CLAUDE.md
        ```

        - For Windows Powershell

        ```pwsh
        # to add all this to windows version in PWSH
        $targetDir = "C:\Users\$env:USERNAME\.claude"
        New-Item -ItemType Directory -Force -Path $targetDir | Out-Null

        $claudeSettings = @"
        ## Code Quality
            - Prefer correct, complete implementations over minimal ones.
            - Use appropriate data structures and algorithms - don't brute-force what has a known better solution.
            - When fixing a bug, fix the root cause, not the symptom.
            - If something I asked for requires error handling or validation to work reliably, include it without asking.

        - "correct, complete over minimal" - directly counters the "simplest approach first" default without saying "write more code." It's a quality signal, not a quantity signal.
        - "appropriate data structures" - this is the AABB tree vs brute-force issue from the *gist. Nudges toward doing it right when the right way is known.
        - "root cause not symptom" - prevents band-aid fixes that break again later. Future-proofing in one line.
        - "include error handling if needed" - the default prompt says "don't add error handling for scenarios that can't happen," which is fine, but for a non-expert dev it's better to err on the side of resilience.

        "@

        Add-Content -Path "$targetDir\CLAUDE.md" -Value $claudeSettings -Encoding UTF8
        ```

### Claude Code Plugins

- Extensions to use and install
    - [Superpowers](https://claude.com/plugins/superpowers) "Claude learns brainstorming, subagent development with code review, debugging, TDD, and skill authoring through Superpowers." (does agents which drastically reduces context rot)
    - [Context7](https://claude.com/plugins/context7) "Upstash Context7 MCP server for live docs lookup. Pull version-specific docs and code examples from source repos into LLM context." (give up to date coding context)
    - [code-simplifier](https://claude.com/plugins/code-simplifier) "Code clarity agent: simplifies and refines recently modified code while preserving functionality and consistency."
    - [sequential thinking](https://github.com/modelcontextprotocol/servers/tree/main/src/sequentialthinking) "An MCP server implementation that provides a tool for dynamic and reflective problem-solving through a structured thinking process." (install using a prompt to claude "please install the sequential thinking mcp server")

## Open Code

- Should ideally use from within WSL rather than directly from within Windows
- Installation
    - Linux `curl -fsSL https://opencode.ai/install | bash`
    - [Windows download the executable at this link](https://opencode.ai/download) or you can use WSL
- Connecting to my local vLLM instance
    - [I got a lot of this from this blog post](https://dev.to/tobrun/configure-local-llm-with-opencode-1gdb)
    - go to this file which will likely need to be created: `~/.local/share/opencode/auth.json`
    - add the code below (the key here is a placeholder convention)

    ```json
    {
        "vllm": {
            "type": "api",
            "key": "sk-local"
        }
    }
    ```

    - Now go to this file which will likely need to be created: `~/.config/opencode/opencode.jsonc` you can use jsonc for comments
    - add the code below

    ```jsonc
    {
    "$schema": "<https://opencode.ai/config.json>",
        "provider": {
            "vllm": {
                "npm": "@ai-sdk/openai-compatible",
                "name": "vLLM",
                "options": {
                    "baseURL": "<http://localhost:6060/v1>"
                    // curl <http://127.0.0.1:6060/v1/models>
                },
                "models": {
                    "cyankiwi/Qwen3.5-2B-AWQ-4bit": {
                        "name": "cyankiwi/Qwen3.5-2B-AWQ-4bit",
                        "options": {
                            "max_tokens": 262144
                        }
                    },
                    "cyankiwi/gemma-4-26B-A4B-it-AWQ-4bit": {
                        "name": "cyankiwi/gemma-4-26B-A4B-it-AWQ-4bit",
                        "options": {
                            "max_tokens": 256000
                        }
                    }
                }
            }
        }
    }
    ```
