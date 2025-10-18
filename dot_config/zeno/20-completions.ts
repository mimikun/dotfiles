import { defineConfig } from "jsr:@yuki-yano/zeno";

export default defineConfig(({ projectRoot, currentDirectory }) => ({
  snippets: [],
  completions: [
    {
      name: "kill signal",
      patterns: ["^kill -s $"],
      sourceCommand: "kill -l | tr ' ' '\\n'"
      options: { "--prompt": "'Kill Signal> '" },
    },
    {
      name: "kill pid",
      patterns: ["^kill( .*)? $"],
      excludePatterns: [" -[lns] $"],
      sourceCommand: "LANG=C ps -ef | sed 1d",
      options: { "--multi": true, "--prompt": "'Kill Process> '" },
      callback: "awk '{print $2}'",
    },
    {
      name: "chdir",
      patterns: ["^cd $"],
      sourceCommand: "find . -path '*/.git' -prune -o -maxdepth 5 -type d -print0",
      options: {
        "--read0": true,
        "--prompt": "'Chdir> '",
        "--preview": "cd {} && ls -a | sed '/^[.]*$/d'",
      },
      callback: "cut -z -c 3-",
      callbackZero: true,
    },
  ],
}));
