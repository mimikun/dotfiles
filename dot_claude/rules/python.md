---
paths:
  - "**/*.py"
  - "**/pyproject.toml"
---

# Python

- **Package manager:** `uv` only — NEVER use `pip install`
- **Pre-commit checks:** `uv run --frozen ruff format . && ruff check . --fix && pyright && pytest`
