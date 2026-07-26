# General Rules (language-agnostic)

Applies to every project. Language-specific checks live in sibling `rules/<lang>.md`
files that load only when matching files are touched.

## 🚫 Absolute Rules (NEVER)

- NEVER push directly to main/master; use feature branches
- NEVER hardcode API keys, passwords, or secrets
- NEVER commit code with failing tests or lint errors
- NEVER delete production data without explicit confirmation
- NEVER skip review for auth/authorization code

## ✅ Required (YOU MUST)

- Write tests for new features and bug fixes
- Run quality checks before marking a task done
- Document breaking changes and public APIs
- Proactively suggest improvements (patterns, perf, missing error handling)

## 🌐 Language Policy (code)

- **Code, comments, docstrings, commit messages:** English
- **README / file content:** follow project preference

## 🌳 Git & Commits

- **Workflow:** Explore → Plan → Code → Commit. Feature branches; use worktrees
  for parallel work (`git worktree add ../project-<type>-<desc> <branch>`).
- **Commits:** Conventional Commits — `feat(scope): subject`, `fix`, `docs`,
  `perf`, `refactor`.
- **PRs:** focus on problem & solution; no co-authored-by / tool mentions.

## 🤖 Claude Code's own configuration

- The live config is `~/.claude/settings.json`, and it is chezmoi-managed
  (`dot_claude/private_settings.json`). Editing the file directly creates drift —
  run `chezmoi add` afterwards, or use `chezmoi edit`. **Do not judge whether something is
  backed up by whether it is a git repo.**
- `~/ghq/github.com/mimikun/mimikun.claude-code-config/` is abandoned. Do not read or edit it.
- **Verify every setting key and env var against the binary before recommending it:**
  `grep -c '<name>' (readlink -f (which claude))`. The `env` block of settings.json is a
  free-form passthrough, so Claude Code cannot warn about a name it does not read, and a
  wrong one stays silently inert forever. This actually happened —
  `CLAUDE_CODE_HIDE_ACCOUNT_INFO` was set for months and never existed
  (filed as P07 in `mimikun.agent-system`; the working flag is `IS_DEMO`).
- `~/.claude/hooks/check-settings-env.sh` re-runs that check at session start, but it only
  sees settings.json. Naming a setting in conversation is not covered — grep first.
