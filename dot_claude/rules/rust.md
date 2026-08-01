---
paths:
  - "**/*.rs"
---

# Rust

- **パッケージマネージャ:** `cargo`
- **コミット前チェック:** `cargo fmt && cargo clippy -- -D warnings && cargo test`
- 本番コードで `.unwrap()` を使わない
