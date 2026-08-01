---
name: todoist
description: >-
  Rules for creating, rewording and rescheduling the user's Todoist tasks — the
  end-condition format every self-contained task must carry, the one test for
  judging whether a proposed condition is decidable, what to offer when it is
  not, and where to leave a line when a task gets cut off partway. Use whenever
  the user says todo, ToDo, タスク or Todoist, whenever a task is being created
  or reworded, and whenever a Todoist write tool is about to be called.
---

# Todoist — タスクの作り方と終了条件

`~/.claude/CLAUDE.md` の「✅ Todoist」節が**同期ルールと `no-ai` の扱い**を持っている。
**それをここに写さないこと。** ここが持つのは、タスクを作る・書き換えるときの手順だけ。

## 終了条件（2026-08-01 運用開始）

出典は知人Dの提案（第1部）。経緯と「扱わない項目」は
`~/ghq/github.com/mimikun/mimikun.agent-system/todo.md` の
「「やり切る」のフォーマット作り」にある。**そちらをここに写さないこと。**

**やり切った = 自分以外の何かが「終わった」と判定できる状態に到達すること。**
自己完結タスクは判定者がいないので、終了条件を先に書かないと原理的にやり切れない。

**終了条件が既に明確なタスクには何もしない。** ゴミ出し、繰り返しの定型作業、
フォーム送信のように、外部が完了を判定するものは対象外。手を入れると雑音が増えるだけ。

### 不明確なときの手順

1. **本人に考えてもらう。うながして、待つ。自分から終了条件を書かない。**
   目的を持っているのは本人であり、そこだけが判定基準の根拠になる。
   これは `CLAUDE.md` の「案を出す」既定の例外にあたる。
2. **出てきた条件を評価する。判定基準は1つ —
   本人以外の誰かが読んで、終わったかどうか判定できるか。**
   - 適切なら、そのまま記入する
   - 不適切なら、**不適切だと伝えたうえで**、次の3つから提案する
     - **A**: 書けるところまで小さく割る（「勉強する」→「第3章を読む」）
     - **B**: 時間で切る（「30分やったら完了」）
     - **C**: いったん保留にし、書けるようになってから着手する

### 記入様式

```txt
タイトル: 終了条件の明確な、わかりやすいタイトル
説明:     タイトルが長くなりすぎたときだけ、補足する説明文章
```

- **終了条件はタイトルに入れる。** 本人が見ているのはタイトルだけなので、
  説明欄に置くと読まれない。
- **説明欄は補足であって再掲ではない。** タイトルの内容を書き直さない。
- **完了日時は書かない。** Todoist が完了時に自動で持つ。

### 途中で切れたとき

1回で終わらせようとしない。切れたときは「今日わかったこと」または
「今日進んだところ」を**1行だけ、そのタスクのコメント欄**に残して終わる。
**1行あればその日は完了。** 全部終わったかは関係ない。

## 構造の注意

- 親タスクを別プロジェクトへ移動すると、サブタスクも一緒に付いていく。
  `projectId` の更新はトップレベルのタスクにだけ行う。
