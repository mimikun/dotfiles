# Startuptime memo

This is Work-PC startuptime memo

- Neovim
- Fish-shell
- PowerShell Core(Linux) (pwsh)
- Paleovim(vim)

## 2023.10.10

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 37.536200 msec
Total Max:     39.700000 msec
Total Min:     35.570000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      46.4 ms ±  25.5 ms    [User: 26.2 ms, System: 10.5 ms]
  Range (min … max):    33.6 ms … 137.7 ms    50 runs
 
```

### Neovim

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.593 s ±  0.315 s    [User: 1.251 s, System: 0.369 s]
  Range (min … max):    1.318 s …  2.818 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 155.935600 msec
Total Max:     221.260000 msec
Total Min:     135.607000 msec
```

## 2023.10.06

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 36.572800 msec
Total Max:     39.020000 msec
Total Min:     35.226000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      45.9 ms ±  32.6 ms    [User: 22.7 ms, System: 12.2 ms]
  Range (min … max):    31.9 ms … 260.6 ms    50 runs
 
```

### Neovim

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.922 s ±  1.025 s    [User: 1.406 s, System: 0.453 s]
  Range (min … max):    1.347 s …  6.238 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 133.119100 msec
Total Max:     141.177000 msec
Total Min:     130.283000 msec
```

## 2023.10.05

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 36.174100 msec
Total Max:     38.485000 msec
Total Min:     34.731000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      38.2 ms ±   6.0 ms    [User: 22.9 ms, System: 9.3 ms]
  Range (min … max):    33.9 ms …  75.3 ms    50 runs
 
```

### Neovim

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.366 s ±  0.033 s    [User: 1.064 s, System: 0.310 s]
  Range (min … max):    1.304 s …  1.427 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 132.161700 msec
Total Max:     139.386000 msec
Total Min:     129.291000 msec
```

## 2023.10.03

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 36.594600 msec
Total Max:     40.641000 msec
Total Min:     34.207000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      64.1 ms ±  90.8 ms    [User: 26.4 ms, System: 11.8 ms]
  Range (min … max):    34.8 ms … 652.9 ms    50 runs
 
```

### Neovim

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.440 s ±  0.098 s    [User: 1.101 s, System: 0.323 s]
  Range (min … max):    1.321 s …  1.963 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 133.863100 msec
Total Max:     137.348000 msec
Total Min:     129.190000 msec
```
## 2023.09.28

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 34.527900 msec
Total Max:     35.400000 msec
Total Min:     33.920000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      39.8 ms ±  10.8 ms    [User: 22.2 ms, System: 11.1 ms]
  Range (min … max):    33.5 ms … 102.6 ms    50 runs
 
```

### Neovim

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.340 s ±  0.029 s    [User: 1.063 s, System: 0.306 s]
  Range (min … max):    1.281 s …  1.416 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 133.748600 msec
Total Max:     137.138000 msec
Total Min:     130.949000 msec
```

## 2023.09.27

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 35.951100 msec
Total Max:     37.923000 msec
Total Min:     34.776000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      38.2 ms ±   4.8 ms    [User: 24.1 ms, System: 9.3 ms]
  Range (min … max):    32.9 ms …  53.0 ms    50 runs
 
```

### Neovim

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.490 s ±  0.147 s    [User: 1.088 s, System: 0.302 s]
  Range (min … max):    1.364 s …  2.269 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 130.325700 msec
Total Max:     151.570000 msec
Total Min:     125.470000 msec
```

## 2023.09.25

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 35.383100 msec
Total Max:     37.599000 msec
Total Min:     34.028000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      39.5 ms ±   5.2 ms    [User: 24.7 ms, System: 9.7 ms]
  Range (min … max):    34.6 ms …  57.1 ms    50 runs
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 'pwsh -i -c exit'
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.361 s ±  0.789 s    [User: 1.523 s, System: 0.450 s]
  Range (min … max):    1.517 s …  4.752 s    50 runs
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 127.655400 msec
Total Max:     133.857000 msec
Total Min:     125.229000 msec
```

## 2023.09.20

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 37.287700 msec
Total Max:     40.330000 msec
Total Min:     35.458000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 'fish -i -c exit'
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     141.5 ms ±   7.6 ms    [User: 136.9 ms, System: 22.0 ms]
  Range (min … max):   137.3 ms … 188.7 ms    50 runs
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 126.582000 msec
Total Max:     129.491000 msec
Total Min:     125.008000 msec
```

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

### Paleovim(vim)

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

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 'pwsh -i -c exit'
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
```
