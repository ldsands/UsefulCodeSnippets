# AI Harness Settings Configs

- [AI Harness Settings Configs](#ai-harness-settings-configs)
    - [Skills](#skills)
        - [Preferred Skills](#preferred-skills)
        - [Old Skills I No Longer Use](#old-skills-i-no-longer-use)
        - [Skills I Would Like to Try and Evaluate](#skills-i-would-like-to-try-and-evaluate)
    - [General Configurations](#general-configurations)
    - [Claude Code](#claude-code)
        - [Notes, Tips, and Guides](#notes-tips-and-guides)
        - [Claude Code Plugins](#claude-code-plugins)
    - [Codex](#codex)
    - [deepseek-harness](#deepseek-harness)
    - [Open Code](#open-code)
        - [OpenCode AGENTS.md File Notes](#opencode-agentsmd-file-notes)
        - [OpenCode Plugins and Skills](#opencode-plugins-and-skills)
    - [Goose](#goose)

## Skills

### Preferred Skills

- [Context Mode](https://github.com/mksglu/context-mode) - "Context window optimization for AI coding agents. Sandboxes tool output, 98% reduction. 15 platforms"
    - for claude code use these two commands
        - `/plugin marketplace add mksglu/context-mode`
        - `/plugin install context-mode@context-mode`
    - for opencode add to opencode.json in your project root (or ~/.config/opencode/opencode.json for global):
        - `{ "$schema": "<https://opencode.ai/config.json>", "plugin": ["context-mode"] }`
- Unslop tells models to talk more like a human and be more concise below is a prompt that will install it globally
    - `"Please fetch the raw text from [https://raw.githubusercontent.com/cursor/plugins/main/pstack/skills/unslop/SKILL.md](https://raw.githubusercontent.com/cursor/plugins/main/pstack/skills/unslop/SKILL.md) and save it to your global skills directory under a folder named unslop. Create the directory first if it doesn't exist. If you aren't sure where your global skills directory is, check your documentation or standard configuration paths."`
    - There are other skills here I need to evaluate in the future (TODO:)
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
- [CodeGraph](https://colbymchenry.github.io/codegraph/) - "A local-first code-intelligence tool that turns any codebase into a queryable knowledge graph for AI coding agents."
    - very similar to graphify but based on feedback from many most seem to prefer CodeGraph
    - To install: `curl -fsSL https://raw.githubusercontent.com/colbymchenry/codegraph/main/install.sh | sh` and `sudo npm install -g @colbymchenry/codegraph` then `codegraph install`
    - To update: `codegraph upgrade`
    - To start the graph use `codegraph init`
    - Use `codegraph index` to re-index or `codegraph sync` to update

### Old Skills I No Longer Use

For skills that I have evaluated, used and determined that I either don't need them or I've found something better.

- [graphify](https://github.com/safishamsi/graphify) - "AI coding assistant skill (Claude Code, Codex, OpenCode, Cursor, Gemini CLI, and more). Turn any folder of code, SQL schemas, R scripts, shell scripts, docs, papers, images, or videos into a queryable knowledge graph. App code + database schema + infrastructure in one graph."
    - NOTE: I use CodeGraph instead
    - Install via uv tool (`uv tool install graphifyy` or to update `uv tool upgrade graphifyy` or to uninstall `uv tool uninstall graphifyy` but note this doesn't remove it from the skills in claude or similar ai coders), then to install the skill into claude (or others) use `graphify install` then to use it you just use `/graphify` in any project should save a lot on context
- [Shape (uses very detailed grilling that creates issues then details a bunch of items needed for creating code/features/upgrades etc.)](https://github.com/TheCraigHewitt/skills/blob/main/coding/shape/SKILL.md) - More about this here: [I Automated My Entire Coding Workflow — Here's What Happened - Craig Hewitt](https://www.youtube.com/watch?v=YIfluAXBr2M)
    - NOTE: I moved on from this mostly due to the fact that harnesses and/or the models handle stuff like this much better than they used to and so I don't find that I need this as much anymore.
    - Note you need to install the skills that you can find here at another skill [called Ralph](https://github.com/TheCraigHewitt/skills/blob/main/coding/ralph/SKILL.md)
    - Ralph is the more for implementation where as Ralph is more for the implementation but also Shape accepts the defaults that claude prefers so it is the gill-me skill on autopilot
    - The order is either /grill-me or /shape then a detailed description of what you want. Then use /prd-to-issues 8 (where 8 is the github issue created). Then use /ralph afk 8 or /ralph 8 for the working through each sub issue the afk version crates a docker container in which claude will work thus not doing anything to your computer by accident.
    - I modified the ralph one to be able to work with docker on linux so instead just use this command `Install the ralph skill from my repo ldsands/CodingLLMSkills` and it should handle it

### Skills I Would Like to Try and Evaluate

Skills I think I would like and/or find useful but I have not yet tried or evaluated them.

- [babysit-pr](https://github.com/doudouOUC/babysit-pr) - "Autonomous PR babysitter skill for AI coding agents (Claude Code + Codex)"
    - I learned about this from [this video](https://www.youtube.com/watch?v=q1D90-uGvBg) sounds useful for any repos that have automated pr code review bots.

## General Configurations

- A prompt to have claude never use attribution in commits or PRs
    - `I want you to change global attribution setting for commits and prs and such so that you never do the co autherd by addition please`
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

    1. Create the file ~/.claude/statusline-command.sh with exactly this content: (shown below)

    2. Make it executable: chmod +x ~/.claude/statusline-command.sh

    3. Add this to ~/.claude/settings.json (merge into the existing JSON, don't clobber other keys):

        "statusLine": {
        "type": "command",
        "command": "bash ~/.claude/statusline-command.sh"
        }

    4. Verify it works by piping sample JSON through the script and showing me the output:

        echo '{"cwd":"/tmp/proj","context_window":{"used_percentage":75,"total_input_tokens":150000,"context_window_size":200000}}' | bash ~/.claude/statusline-command.sh

    This requires `jq` and `bc` to be installed.

    bash code below

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

## Codex

I have set this up very similarly to Claude Code.

- Tips
    - To copy a response (and thus avoid gutter issues) you can use `/copy` or `ctrl+o` or use `alt+r` to show "raw mode" which removed all formatting including removing the gutter

## deepseek-harness

- [deepseek-harness](https://github.com/deepseek-ai/deepseek-harness) - "DeepSeek Harness: Everything is a Plugin."
    - Note that this is in very active development and many things are changing very quickly as of Sep 2026
    - To install/update/run: `npx @deepseek-ai/dsh@latest web`
    - To get installed version: `npx @deepseek-ai/dsh --version` another version that uses latest `npx @deepseek-ai/dsh@latest --version`
    - To run (without updating): `npx @deepseek-ai/dsh web`
    - For now you have to also use this command `ssh -L 3080:127.0.0.1:3080 your_user@your_server_ip` on the computer you want to use it on (this will not be needed in the future but during prerelease this is required)
        - Then once you have that running you must use [this link](http://127.0.0.1:3080) on the computer you ran the command above, you must leave open the shell/terminal that you used the command above as long as you want access to the harness
- Location of setting: `~/.dsh/settings.yaml`

```yaml
ui-onboarding:
  welcomeNoticeVersion: 2026-08-13.1
agent-loop:
  maxParallelToolCalls: 4
llm-pi-ai:
  providers:
    vllm:
      displayName: vllm
      api: openai-completions
      baseURL: <http://localhost/v1>
      # Private gateway: pi-ai cannot recognize this URL and would otherwise
      # detect it as OpenAI itself; state explicitly that the endpoint accepts
      # a top-level reasoning_effort field (OpenAI dialect).
      compat:
        supportsReasoningEffort: true
      # Thinking level applied when no effort is selected in the model picker
      # (mirrors the opencode "think_max // default for model" note). Applies
      # only to models that offer the level; DeepSeek-V4-Flash does not offer
      # xhigh, so it keeps the endpoint's own default.
      models:
        - id: unsloth/Qwen3.8-27B-NVFP4
          name: unsloth/Qwen3.8-27B-NVFP4
          reasoningEfforts:
            off: "none"
            low: "low"
            medium: "medium"
            xhigh: "xhigh"
        - id: nvidia/Qwen3.8-27B-NVFP4
          name: nvidia/Qwen3.8-27B-NVFP4
          reasoningEfforts:
            off: "none"
            low: "low"
            medium: "medium"
            xhigh: "xhigh"
        - id: deepseek-ai/DeepSeek-V4-Flash-Vision-Exp
          name: deepseek-ai/DeepSeek-V4-Flash-Vision-Exp
          reasoningEfforts:
            off: "none"
            high: "high"
            max: "max"
        - id: deepseek-ai/DeepSeek-V4-Flash-0731
          name: deepseek-ai/DeepSeek-V4-Flash-0731
          reasoningEfforts:
            off: "none"
            high: "high"
            max: "max"
        - id: Qwen/Qwen3.8-27B-FP8
          name: Qwen/Qwen3.8-27B-FP8
          reasoningEfforts:
            off: "none"
            low: "low"
            medium: "medium"
            xhigh: "xhigh"
        - id: local-inference-lab/Qwen3.8-Flash-Next-NVFP4
          name: local-inference-lab/Qwen3.8-Flash-Next-NVFP4
          reasoningEfforts:
            off: none
            low: low
            medium: medium
            xhigh: xhigh
      apiKeyEnv: VLLM_API_KEY
agent-default-model:
  provider: vllm
  model: Qwen/Qwen3.8-27B-FP8
```

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
    - add the code below (Note that you need to replace the localhost with the ip of the server)

    ```jsonc
    {
        "$schema": "<https://opencode.ai/config.json>",
        "provider": {
            "vllmDSpark": {
                "npm": "@ai-sdk/openai-compatible",
                "name": "vLLM_dsv4f_DSpark",
                "options": {
                    "baseURL": "<http://localhost:6060/v1>"
                    // example http://127.0.0.1:6060/v1
                    // curl <http://127.0.0.1:6060/v1/models> to get the models
                },
                "models": {
                    "deepseek-v4-flash-dspark": {
                        "name": "deepseek-v4-flash-dspark",
                        "variants": {
                            "think_none": {
                                "reasoningEffort": "none"
                            },
                            "think_high": {
                                "reasoningEffort": "high"
                            },
                            "think_max": {
                                "reasoningEffort": "max"
                            }
                        }
                    }
                }
            },
            "vllm": {
                "npm": "@ai-sdk/openai-compatible",
                "name": "vLLM_Local",
                "options": {
                    "baseURL": "<http://localhost:6060/v1>"
                    // example http://127.0.0.1:6060/v1
                    // curl <http://127.0.0.1:6060/v1/models> to get the models
                },
                "models": {
                    "google/gemma-4-31B-it": {
                        "name": "google/gemma-4-31B-it",
                        "variants": {
                            "thinking_disabled": {
                                "enable_thinking": "False",
                            },
                            "thinking_enabled": {
                                "enable_thinking": "True",
                            }
                        }
                    },
                    "Qwen/Qwen3.8-27B-FP8": {
                        "name": "Qwen/Qwen3.8-27B-FP8",
                        "variants": {
                            "think_none": {
                                "temperature": 0.7,
                                "top_p": 0.8,
                                "presence_penalty": 1.5,
                                "extra_body": {
                                    "reasoning_effort": "none",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_low": {
                                "temperature": 0.7,
                                "top_p": 0.8,
                                "presence_penalty": 1.5,
                                "extra_body": {
                                    "reasoning_effort": "low",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_high": {
                                "temperature": 1.0,
                                "top_p": 0.95,
                                "presence_penalty": 0.0,
                                "extra_body": {
                                    "reasoning_effort": "medium",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_max": {
                                "temperature": 1.0,
                                "top_p": 0.95,
                                "presence_penalty": 0.0,
                                "extra_body": {
                                    "reasoning_effort": "xhigh", // default for model
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            }
                        }
                    },
                    "local-inference-lab/Qwen3.8-Flash-Next-NVFP4": {
                        "name": "local-inference-lab/Qwen3.8-Flash-Next-NVFP4",
                        "variants": {
                            "think_none": {
                                "temperature": 0.7,
                                "top_p": 0.8,
                                "presence_penalty": 1.5,
                                "extra_body": {
                                    "reasoning_effort": "none",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_low": {
                                "temperature": 0.7,
                                "top_p": 0.8,
                                "presence_penalty": 1.5,
                                "extra_body": {
                                    "reasoning_effort": "low",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_high": {
                                "temperature": 1.0,
                                "top_p": 0.95,
                                "presence_penalty": 0.0,
                                "extra_body": {
                                    "reasoning_effort": "medium",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_xhigh": {
                                "temperature": 1.0,
                                "top_p": 0.95,
                                "presence_penalty": 0.0,
                                "extra_body": {
                                    "reasoning_effort": "xhigh", // default for model
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            }
                        }
                    },
                    "unsloth/Qwen3.8-27B-NVFP4": {
                        "name": "unsloth/Qwen3.8-27B-NVFP4",
                        "variants": {
                            "think_none": {
                                "temperature": 0.7,
                                "top_p": 0.8,
                                "presence_penalty": 1.5,
                                "extra_body": {
                                    "reasoning_effort": "none",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_low": {
                                "temperature": 0.7,
                                "top_p": 0.8,
                                "presence_penalty": 1.5,
                                "extra_body": {
                                    "reasoning_effort": "low",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_high": {
                                "temperature": 1.0,
                                "top_p": 0.95,
                                "presence_penalty": 0.0,
                                "extra_body": {
                                    "reasoning_effort": "medium",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_max": {
                                "temperature": 1.0,
                                "top_p": 0.95,
                                "presence_penalty": 0.0,
                                "extra_body": {
                                    "reasoning_effort": "xhigh", // default for model
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            }
                        }
                    },
                    "nvidia/Qwen3.8-27B-NVFP4": {
                        "name": "nvidia/Qwen3.8-27B-NVFP4",
                        "variants": {
                            "think_none": {
                                "temperature": 0.7,
                                "top_p": 0.8,
                                "presence_penalty": 1.5,
                                "extra_body": {
                                    "reasoning_effort": "none",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_low": {
                                "temperature": 0.7,
                                "top_p": 0.8,
                                "presence_penalty": 1.5,
                                "extra_body": {
                                    "reasoning_effort": "low",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_high": {
                                "temperature": 1.0,
                                "top_p": 0.95,
                                "presence_penalty": 0.0,
                                "extra_body": {
                                    "reasoning_effort": "medium",
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            },
                            "think_max": {
                                "temperature": 1.0,
                                "top_p": 0.95,
                                "presence_penalty": 0.0,
                                "extra_body": {
                                    "reasoning_effort": "xhigh", // default for model
                                    "top_k": 20,
                                    "min_p": 0.0,
                                    "repetition_penalty": 1.0
                                }
                            }
                        }
                    },
                    "Mia-AiLab/GLM-5.3-Flash-EXL3-4bpw-TensorFold": {
                        "name": "Mia-AiLab/GLM-5.3-Flash-EXL3-4bpw-TensorFold",
                        "variants": {
                            "think_low": {
                                "reasoningEffort": "low"
                            },
                            "think_high": {
                                "reasoningEffort": "high"
                            },
                            "think_max": {
                                "reasoningEffort": "max"
                            }
                        }
                    },
                    "deepseek-ai/DeepSeek-V4-Flash-0731": {
                        "name": "deepseek-ai/DeepSeek-V4-Flash-0731",
                        "variants": {
                            "think_none": {
                                "reasoningEffort": "none"
                            },
                            "think_high": {
                                "reasoningEffort": "high"
                            },
                            "think_max": {
                                "reasoningEffort": "max"
                            }
                        }
                    },
                    "deepseek-ai/DeepSeek-V4-Flash-Vision-Exp": {
                        "name": "deepseek-ai/DeepSeek-V4-Flash-Vision-Exp",
                        "variants": {
                            "think_none": {
                                "reasoningEffort": "none"
                            },
                            "think_high": {
                                "reasoningEffort": "high"
                            },
                            "think_max": {
                                "reasoningEffort": "max"
                            }
                        }
                    },
                    "deepseek-ai/DeepSeek-V4-Flash-DSpark": {
                        "name": "deepseek-ai/DeepSeek-V4-Flash-DSpark",
                        "variants": {
                            "think_none": {
                                "reasoningEffort": "none"
                            },
                            "think_high": {
                                "reasoningEffort": "high"
                            },
                            "think_max": {
                                "reasoningEffort": "max"
                            }
                        }
                    },
                    "deepseek-ai/DeepSeek-V4-Flash": {
                        "name": "deepseek-ai/DeepSeek-V4-Flash",
                        "variants": {
                            "think_none": {
                                "reasoningEffort": "none"
                            },
                            "think_high": {
                                "reasoningEffort": "high"
                            },
                            "think_max": {
                                "reasoningEffort": "max"
                            }
                        }
                    }
                }
            }
        }
    }
    ```

- I also do not like the default keyboard shortcuts so I changed several of them (change this file `~/.config/opencode/tui.json` to do )

    ```json
    {
      "$schema": "https://opencode.ai/tui.json",
        "keybinds": {
          "app_exit": "ctrl+q",
          "input_buffer_end": "ctrl+end",
          "input_buffer_home": "ctrl+home",
          "input_line_end": "end,ctrl+e",
          "input_line_home": "home,ctrl+a",
          "input_newline": "alt+return,shift+return,ctrl+j",
          "messages_first": "alt+home,ctrl+g",
          "messages_last": "alt+end,ctrl+alt+g"
      }
    }
    ```

### OpenCode AGENTS.md File Notes

- should be located `~/.opencode/AGENTS.md`

### OpenCode Plugins and Skills

- To use and install superpowers you can just add the text below to the file `~/.config/opencode/opencode.json`

    ```json
    {
      "$schema": "<https://opencode.ai/config.json>",
      "disabled_providers": ["openai", "gemini"],
      "lsp": true,
      "plugin": [
        "@dietrichgebert/ponytail",
        "mattpocock-skills@git+<https://github.com/mattpocock/skills.git>",
        "superpowers@git+<https://github.com/obra/superpowers.git>"
      ]
    }
    ```

- I've tried oh-my-opencode and didn't really like it

## Goose

- [Goose](https://goose-docs.ai/) - "Your native open source AI agent. Desktop app, CLI, and API — for code, workflows, and everything in between."
    - I think of goose and between Opencode and Pi in terms of stuff being "built in"
