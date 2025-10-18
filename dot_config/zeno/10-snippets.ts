import { defineConfig } from "jsr:@yuki-yano/zeno";

export default defineConfig(({ projectRoot, currentDirectory }) => ({
  snippets: [
    {
      name: "git status",
      keyword: "gs",
      snippet: "git status --short --branch",
    },
    // TODO: add it
    //# snippet with placeholder
    //- name: git commit message
    //  keyword: gcim
    //  snippet: git commit -m '{{commit_message}}'
    {
      name: "branch",
      keyword: "B",
      snippet: "git symbolic-ref --short HEAD",
      context: { lbuffer: "^git\\s+checkout\\s+" },
      evaluate: true,
    },
    {
      name: "null",
      keyword: "null",
      snippet: ">/dev/null 2>&1",
      context: { lbuffer: ".+\\s" },
    },
  ],
  completions: [],
}));
