---
paths:
  - "**/*.go"
---

# Go

- **パッケージマネージャ:** `go mod`
- **コミット前チェック:** `go fmt ./... && golangci-lint run && go test -race ./...`
- 返り値のエラーを無視しない
