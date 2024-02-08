;; markdown
---
aliases:
  - {{date:YYYY/MM/DD}}
  - {{date:YYYY/M/D}}
  - {{date:YYYY年MM月DD日}}
  - {{date:YYYY年M月D日}}
  - {{date:YYYY-MM-DD}}
  - {{date:YYYY-M-D}}
tags:
  - "#{{date:YYYY/MM/DD}}"
  - "#{{date:YYYY/M/D}}"
  - "#{{date:YYYY年MM月DD日}}"
  - "#{{date:YYYY年M月D日}}"
  - "#{{date:YYYY-MM-DD}}"
  - "#{{date:YYYY-M-D}}"
  - "#daily-note"
---
# {{date:YYYY年MM月DD日}}
<< [[<% moment(tp.file.title, "YYYY年MM月DD日").subtract(1, "days").format("YYYY年MM月DD日") %>]] | [[<% moment(tp.file.title, "YYYY年MM月DD日").add(1, "days").format("YYYY年MM月DD日") %>]] >>

[[電子レンジ対応表]]

## Daily TODO
<% tp.file.cursor() %>
<%* 
async function asyncSleep(ms) {
  return new Promise((resolve) => { setTimeout(() => { resolve(); }, ms); });
}

await asyncSleep(50) // waitを入れないとDaily Noteのタイトルから日付を読み込めない
app.commands.executeCommandById("obsidian-silhouette:insert-tasks")
%>

## 日記



### 仕事メモ



### 体調不良ログ




