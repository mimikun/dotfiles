---
name: todoist
description: >-
  Rules for creating, rewording and rescheduling the user's Todoist tasks —
  which tasks need an end condition and which to leave alone, where the
  condition goes, and where to leave a line when one gets cut off partway. Use
  whenever the user says todo, ToDo, タスク or Todoist, whenever a task is being
  created or reworded, and whenever a Todoist write tool is about to be called.
---

# Todoist — タスクへの落とし込み

**手順そのものは `~/.claude/CLAUDE.md` の「🧱 作業の刻み方」にある。**
終了条件の導出4ステップ、判定基準、A / B / C の分岐、中断の扱い、
「外れたら分かる1行」は全部あちら。**ここに写さないこと。**
ここが持つのは Todoist 固有の部分だけ。

同期ルールと `no-ai` の扱いは `CLAUDE.md` の「✅ Todoist」節にある。
出典・経緯・「扱わない項目」は
`~/ghq/github.com/mimikun/mimikun.agent-system/todo.md` の
「「やり切る」のフォーマット作り」にある。

## どのタスクに適用するか

**終了条件が既に明確なタスクには何もしない。** ゴミ出し、繰り返しの定型作業、
フォーム送信のように、外部が完了を判定するものは対象外。手を入れると雑音が増えるだけ。

**判定者が自分しかいないタスクにだけ適用する。**

## 記入様式

```txt
タイトル: 終了条件の明確な、わかりやすいタイトル
説明:     タイトルが長くなりすぎたときだけ、補足する説明文章
```

- **終了条件はタイトルに入れる。** 本人が見ているのはタイトルだけなので、
  説明欄に置くと読まれない。
- **説明欄は補足であって再掲ではない。** タイトルの内容を書き直さない。
- **完了日時は書かない。** Todoist が完了時に自動で持つ。
- **本人に考えてもらう。うながして、待つ。自分から終了条件を書かない。**
  これは `CLAUDE.md` の「案を出す」既定の例外にあたる。

## 途中で切れたとき

「今日わかったこと」または「今日進んだところ」を
**1行だけ、そのタスクのコメント欄**に残して終わる。**1行あればその日は完了。**
コメント欄なのは、タスクと同じ場所にあって次に開いたとき必ず目に入るから。

## 構造の注意

- 親タスクを別プロジェクトへ移動すると、サブタスクも一緒に付いていく。
  `projectId` の更新はトップレベルのタスクにだけ行う。
