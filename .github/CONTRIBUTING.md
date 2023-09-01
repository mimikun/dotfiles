# dotfiles の開発について

## `Issue` や `Pull Request` について

- `Pull Request` を送る場合、必ず先に `Issue` を立て、対応する `Issue` 番号を記載してください。

## 開発方法

### Windows
#### 変更を加える側

- `just pab` でパッチ用ブランチを切る
- 色々な変更を加える
- 変更を加えた箇所を `CHANGELOG.md` に記載する
- `just patch` でパッチを生成する?
    - or
    - git-bashを立ち上げる
    - git-bash -c ./scripts/clean.sh
    - git-bash -c ./scripts/diff-patch.sh
    - .\scripts\copy2win-patch.ps1

#### 変更を受け入れる側

- `git-bash.exe` など `cmd1 < cmd2` が使える環境を立ち上げる
- `patch -p1 < foobar.patch` でパッチを当てる
- `just pab` でパッチ用ブランチを切る
- `CHANGELOG.md` を参考にコミットを積む
- master ブランチにパッチ用ブランチをマージしてリモートへ push
