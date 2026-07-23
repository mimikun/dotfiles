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
