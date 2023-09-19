# Startuptime memo

This is Work-PC startuptime memo

- Neovim
- Fish-shell
- Paleovim(vim)

## 2023.09.19

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 35.043000 msec
Total Max:     36.148000 msec
Total Min:     34.108000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     141.7 ms ±  18.7 ms    [User: 139.9 ms, System: 21.2 ms]
  Range (min … max):   133.2 ms … 251.6 ms    50 runs

  Warning: Statistical outliers were detected. Consider re-running this benchmark on a quiet system without any interferences from other programs. It might help to use the '--warmup' or '--prepare' options.
```

```shell
❯ hyperfine -w 5 -r 50 'fish -i -c exit'
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      55.2 ms ±  10.9 ms    [User: 37.3 ms, System: 11.3 ms]
  Range (min … max):    48.2 ms … 124.1 ms    50 runs

  Warning: Statistical outliers were detected. Consider re-running this benchmark on a quiet system without any interferences from other programs. It might help to use the '--warmup' or '--prepare' options.
```

### Paleovim

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 127.838700 msec
Total Max:     136.544000 msec
Total Min:     125.203000 msec
```

## YYYY.MM.DD

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
```

### Paleovim

```shell
❯ vim-startuptime -vimpathvim | head -n 6
```
