---
paths:
  - "**/*.go"
---

# Go

- **Package manager:** `go mod`
- **Pre-commit checks:** `go fmt ./... && golangci-lint run && go test -race ./...`
- NEVER ignore returned errors
