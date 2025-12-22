# SSHキー命名法則

## サーバ用

以下の法則で名付ける

`<SERVER_USER_NAME>_<SERVER_PROVIDER_NAME>_<SERVER_NAMETAG>_from_<LOCAL_MACHINE_NAME>`

結果としては

`~/.ssh/<SERVER_USER_NAME>_<SERVER_PROVIDER_NAME>_<SERVER_NAMETAG>_from_<LOCAL_MACHINE_NAME>` となる

### 例

- `user_gcp_webdev01_from_desktop`
- `root_aws_dbprod01_from_laptop`

## Git用

以下の法則で名付ける

`<GIT_PROVIDER_NAME>_from_<LOCAL_MACHINE_NAME>`

結果としては

`~/.ssh/<GIT_PROVIDER_NAME>_from_<LOCAL_MACHINE_NAME>` となる

### 例

- `gitservice_from_laptop`

---

どちらの場合でもこれ以降は長いため `~/.ssh/<LOCAL_SSH_KEY_NAME>` と表記する

## 生成コマンド

パスフレーズは状況に応じて判断
コメントはGit等で使うときのみ付与する

```shell
# サーバ用
ssh-keygen -t ed25519 -f ~/.ssh/root_sakura_webdev01_from_desktop

# Git用
ssh-keygen -t ed25519 -f ~/.ssh/gitserver_from_laptop -C test@example.invalid
```

## `~/.ssh/conf.d/<FILENAME>` 設定例

### サーバ用: `~/.ssh/conf.d/<SERVER_PROVIDER_NAME>-<SERVER_NAMETAG>`

```sshconfig
Host <SERVER_PROVIDER_NAME>_<SERVER_NAMETAG>
    HostName <SERVER_IP_ADDRESS>
    User <SERVER_USER_NAME>
    IdentityFile ~/.ssh/<LOCAL_SSH_KEY_NAME>
```

#### 例

- `~/.ssh/conf.d/aws-webdev01`
- `~/.ssh/conf.d/gcp-dbprod01`

### Git用: `~/.ssh/conf.d/<GIT_PROVIDER_NAME>`

```sshconfig
Host <GIT_PROVIDER_NAME>
    HostName <GIT_PROVIDER_IP_ADDRESS>
    IdentityFile ~/.ssh/<LOCAL_SSH_KEY_NAME>
```

#### 例

- `~/.ssh/conf.d/github`
- `~/.ssh/conf.d/codeberg`

