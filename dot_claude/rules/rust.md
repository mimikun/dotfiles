---
paths:
  - "**/*.rs"
---

# Rust

- **Package manager:** `cargo`
- **Pre-commit checks:** `cargo fmt && cargo clippy -- -D warnings && cargo test`
- NEVER use `.unwrap()` in production code
