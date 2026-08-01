---
paths:
  - "**/*.py"
  - "**/pyproject.toml"
---

# Python

- **パッケージマネージャ:** `uv` のみ — `pip install` は使わない
- **コミット前チェック:** `uv run --frozen ruff format . && ruff check . --fix && pyright && pytest`
