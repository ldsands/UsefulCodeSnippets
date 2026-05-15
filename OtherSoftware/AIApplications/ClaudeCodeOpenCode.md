# Claude and Open Code

## Skills

- [Matt Pocock's ai skills some real gems here](https://github.com/mattpocock/skills)
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
