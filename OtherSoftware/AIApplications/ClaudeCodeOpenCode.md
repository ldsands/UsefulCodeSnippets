# Claude and Open Code

## Skills

- [Matt Pocock's ai skills some real gems here](https://github.com/mattpocock/skills)
    - to install use this command `npx skills@latest add mattpocock/skills`
    - Here is a brief summary of each skill from the mattpocock/skills repository:
    - Engineering Skills
        - diagnose: Disciplined diagnosis loop for hard bugs and performance regressions (reproduce, minimise, hypothesise, instrument, fix, regression-test).
        - grill-with-docs: Grilling session that challenges your plan against the existing domain model, sharpens terminology, and updates CONTEXT.md and ADRs inline.
        - triage: Triage issues through a state machine of triage roles.
        - improve-codebase-architecture: Find deepening opportunities in a codebase, informed by the domain language in CONTEXT.md and the decisions in docs/adr/.
        - setup-matt-pocock-skills: Scaffold the per-repo config (issue tracker, triage label vocabulary, domain doc layout) that the other engineering skills consume.
        - tdd: Test-driven development with a red-green-refactor loop. Builds features or fixes bugs one vertical slice at a time.
        - to-issues: Break any plan, spec, or PRD into independently-grabbable GitHub issues using vertical slices.
        - to-prd: Turn the current conversation context into a PRD and submit it as a GitHub issue. No interview, just synthesizes what you have already discussed.
        - zoom-out: Tell the agent to zoom out and give broader context or a higher-level perspective on an unfamiliar section of code.
        - prototype: Build a throwaway prototype to flush out a design, either a runnable terminal app for state/business-logic questions, or several radically different UI variations toggleable from one route.
    - Productivity Skills
        - caveman: Ultra-compressed communication mode. Cuts token usage around 75% by dropping filler while keeping full technical accuracy.
        - grill-me: Get relentlessly interviewed about a plan or design until every branch of the decision tree is resolved.
        - write-a-skill: Create new skills with proper structure, progressive disclosure, and bundled resources.
    - Misc Skills
        - git-guardrails-claude-code: Set up Claude Code hooks to block dangerous git commands (push, reset --hard, clean, etc.) before they execute.
        - migrate-to-shoehorn: Migrate test files from as type assertions to @total-typescript/shoehorn.
        - scaffold-exercises: Create exercise directory structures with sections, problems, solutions, and explainers.
        - setup-pre-commit: Set up Husky pre-commit hooks with lint-staged, Prettier, type checking, and tests.
- [Shape (uses very detailed grilling that creates issues then details a bunch of items needed for creating code/features/upgrades etc.)](https://github.com/TheCraigHewitt/skills/blob/main/coding/shape/SKILL.md) - More about this here: [I Automated My Entire Coding Workflow — Here's What Happened - Craig Hewitt](https://www.youtube.com/watch?v=YIfluAXBr2M)
    - Note you need to install the skills that you can find here at another skill [called Ralph](https://github.com/TheCraigHewitt/skills/blob/main/coding/ralph/SKILL.md)
    - Ralph is the more for implementation where as Ralph is more for the implementation but also Shape accepts the defaults that claude prefers so it is the gill-me skill on autopilot
    - The order is either /grill-me or /shape then a detailed description of what you want. Then use /prd-to-issues 8 (where 8 is the github issue created). Then use /ralph afk 8 or /ralph 8 for the working through each sub issue the afk version crates a docker container in which claude will work thus not doing anything to your computer by accident.
    - I modified the ralph one to be able to work with docker on linux so instead just use this command `Install the ralph skill from my repo ldsands/CodingLLMSkills` and it should handle it

## General Configurations

- To have a status bar that shows the context give this prompt to your LLM (only tested on claude code)

    ```md
    Configure my Claude Code status line by creating ~/.claude/statusline-command.sh and registering it in ~/.claude/settings.json under a statusLine block (preserve any
    existing settings). Use the statusline-setup agent.

    The script reads Claude Code's statusline JSON input from stdin and prints one line with two parts:

    Left side (modeled on a typical colored bash PS1):
    - Bold-green user@host from $(whoami) and $(hostname -s)
    - Colon separator
    - Bold-blue current working directory from the JSON input's .cwd field

    Right side — a fillable context-usage bar, right-aligned to the terminal width:
    - Format: [████░░░░░░░░░░░░░░░░] 42% (84k/200k) — a 20-character Unicode block bar, then percentage, then (used/total) tokens
    - Read from JSON: .context_window.used_percentage, .context_window.total_input_tokens, .context_window.context_window_size
    - Compact token formatter: 1.2M for ≥ 1,000,000, 84k for ≥ 1,000, raw number otherwise
    - Bar color: bold-green below 70%, bold-yellow below 90%, bold-red at 90%+
    - Right-align using tput cols; compute padding from visible character width only (strip ANSI escapes when measuring)
    - If terminal is too narrow to fit both sides on one line, let the bar wrap to a second line rather than overlap
    - If the token/percentage fields are absent (e.g. before first API call), gracefully fall back to showing just the left side

    Use jq for JSON parsing and printf for ANSI colors. Add a brief comment header in the script.
    ```

    - a newer more verbose version

    ```md
    <!-- a newer version -->
    Set up a custom Claude Code statusline for me. It should show a context-usage bar
    and token info first, followed by user@host:cwd, all on one line. The bar color
    should change based on token count: green under 100k, yellow at/above 100k, orange
    at/above 200k.

    Do this:

    1. Create the file ~/.claude/statusline-command.sh with exactly this content:

    ```bash
    #!/usr/bin/env bash
    # Claude Code status line — derived from ~/.bashrc PS1
    # Context bar uses context_window.used_percentage from the statusline JSON schema
    # (pre-calculated by Claude Code). No transcript-size fallback needed.

    input=$(cat)
    cwd=$(echo "$input" | jq -r '.cwd')

    # --- Left side ---
    user="$(whoami)"
    host="$(hostname -s)"
    left_ansi="$(printf '\033[01;32m%s@%s\033[00m:\033[01;34m%s\033[00m' "$user" "$host" "$cwd")"

    # --- Context bar (right side) ---
    used_pct=$(echo "$input" | jq -r '.context_window.used_percentage // empty')

    if [ -n "$used_pct" ]; then
        # Round to integer
        used_int=$(printf '%.0f' "$used_pct")

        # Build the bar: 20 chars wide
        bar_width=20
        filled=$(( used_int * bar_width / 100 ))
        empty=$(( bar_width - filled ))

        bar=""
        for _ in $(seq 1 $filled); do bar="${bar}█"; done
        for _ in $(seq 1 $empty);  do bar="${bar}░"; done

        # Token counts (optional — fall back gracefully if absent)
        tokens_used=$(echo "$input" | jq -r '.context_window.total_input_tokens // empty')
        tokens_total=$(echo "$input" | jq -r '.context_window.context_window_size // empty')

        # Choose color by token count: green < 100k, yellow >= 100k, orange >= 200k
        if [ -n "$tokens_used" ] && [ "$tokens_used" -ge 200000 ] 2>/dev/null; then
            bar_color='\033[01;38;5;208m'   # bold orange
        elif [ -n "$tokens_used" ] && [ "$tokens_used" -ge 100000 ] 2>/dev/null; then
            bar_color='\033[01;33m'   # bold yellow
            bar_color='\033[01;32m'   # bold green
        fi
        reset='\033[00m'

        # Format a raw token count as compact "84k" / "1.2M" style
        fmt_tokens() {
            local n=$1
            if [ "$n" -ge 1000000 ] 2>/dev/null; then
                printf '%.1fM' "$(echo "scale=1; $n / 1000000" | bc)"
            elif [ "$n" -ge 1000 ] 2>/dev/null; then
                printf '%dk' "$(( n / 1000 ))"
            else
                printf '%d' "$n"
            fi
        }

        # Build the token segment when both values are present
        if [ -n "$tokens_used" ] && [ -n "$tokens_total" ]; then
            tok_seg=" ($(fmt_tokens "$tokens_used")/$(fmt_tokens "$tokens_total"))"
        else
            tok_seg=""
        fi

        # bar_ansi is the context bar section; pwd follows it on the same line
        bar_ansi="$(printf "${bar_color}[${bar}] ${used_int}%%${tok_seg}${reset}")"

        printf '%s %s\n' "$bar_ansi" "$left_ansi"
    else
        # No context data yet — print only the pwd side
        printf '%s\n' "$left_ansi"
    fi
    ```

    1. Make it executable: chmod +x ~/.claude/statusline-command.sh

    2. Add this to ~/.claude/settings.json (merge into the existing JSON, don't clobber

  other keys):

        "statusLine": {
        "type": "command",
        "command": "bash ~/.claude/statusline-command.sh"
        }

    3. Verify it works by piping sample JSON through the script and showing me the output:

        echo '{"cwd":"/tmp/proj","context_window":{"used_percentage":75,"total_input_tokens":150000,"context_window_size":200000}}' | bash ~/.claude/statusline-command.sh

    This requires `jq` and `bc` to be installed.

    ```text

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
    - Some things I added based on some suggestions I have seen and then put this into my [CodingLLMSkills repo (private)](https://github.com/ldsands/CodingLLMSkills)
        - [I added the text from this repo on 2026-05-04 (SHA: 2c606141936f1eeef17fa3043a72095b4765b9c2)](https://raw.githubusercontent.com/forrestchang/andrej-karpathy-skills/2c606141936f1eeef17fa3043a72095b4765b9c2/CLAUDE.md)
        - Some things to add to the global Claude.md based on some suggestions ([more about this here](https://www.reddit.com/r/ClaudeCode/comments/1sed183/boris_cherny_explains_some_recent_changes_to/)) older additions but I added this to the notes above
        - Linux file location: `~/.claude/CLAUDE.md`
        - Windows file location: `C:\Users\$env:USERNAME\.claude`

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
