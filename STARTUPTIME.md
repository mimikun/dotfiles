# Startuptime memo

This is Work-PC startuptime memo

- Neovim
- Fish-shell
- PowerShell Core(Linux) (pwsh)
- Paleovim(vim)

## 2024.08.06

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 427.333900 msec
Total Max:     453.908000 msec
Total Min:     409.081000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     175.4 ms ±   6.1 ms    [User: 152.8 ms, System: 27.9 ms]
  Range (min … max):   166.4 ms … 196.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.931 s ±  0.181 s    [User: 1.042 s, System: 0.381 s]
  Range (min … max):    1.750 s …  2.869 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.403500 msec
Total Max:     43.732000 msec
Total Min:     40.243000 msec
```

## 2024.08.02

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 413.331000 msec
Total Max:     442.156000 msec
Total Min:     399.880000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     179.2 ms ±  10.5 ms    [User: 152.6 ms, System: 31.4 ms]
  Range (min … max):   165.8 ms … 218.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.073 s ±  0.153 s    [User: 1.072 s, System: 0.382 s]
  Range (min … max):    1.837 s …  2.687 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.859400 msec
Total Max:     42.233000 msec
Total Min:     38.843000 msec
```

## 2024.08.01

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 423.776600 msec
Total Max:     466.354000 msec
Total Min:     404.075000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     177.4 ms ±   8.8 ms    [User: 150.7 ms, System: 32.4 ms]
  Range (min … max):   167.1 ms … 211.3 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.860 s ±  0.107 s    [User: 1.037 s, System: 0.356 s]
  Range (min … max):    1.704 s …  2.435 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.217100 msec
Total Max:     52.950000 msec
Total Min:     38.486000 msec
```

## 2024.07.31

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 422.607600 msec
Total Max:     466.086000 msec
Total Min:     401.928000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     184.8 ms ±  11.5 ms    [User: 155.6 ms, System: 34.6 ms]
  Range (min … max):   170.1 ms … 218.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.036 s ±  0.120 s    [User: 1.035 s, System: 0.359 s]
  Range (min … max):    1.882 s …  2.727 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.121300 msec
Total Max:     42.733000 msec
Total Min:     38.876000 msec
```

## 2024.07.30

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 415.148400 msec
Total Max:     450.861000 msec
Total Min:     395.453000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     184.8 ms ±  10.6 ms    [User: 156.5 ms, System: 33.9 ms]
  Range (min … max):   168.8 ms … 224.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.024 s ±  0.229 s    [User: 1.049 s, System: 0.380 s]
  Range (min … max):    1.781 s …  2.977 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.714800 msec
Total Max:     46.977000 msec
Total Min:     39.580000 msec
```

## 2024.07.29

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 419.224200 msec
Total Max:     446.236000 msec
Total Min:     388.364000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     174.7 ms ±   5.3 ms    [User: 147.3 ms, System: 32.0 ms]
  Range (min … max):   166.5 ms … 186.9 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.937 s ±  0.127 s    [User: 1.040 s, System: 0.345 s]
  Range (min … max):    1.755 s …  2.618 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 44.585400 msec
Total Max:     83.278000 msec
Total Min:     38.299000 msec
```

## 2024.07.26

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 416.356000 msec
Total Max:     430.750000 msec
Total Min:     392.674000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     174.4 ms ±   5.7 ms    [User: 148.7 ms, System: 31.1 ms]
  Range (min … max):   166.6 ms … 194.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.069 s ±  0.108 s    [User: 1.041 s, System: 0.357 s]
  Range (min … max):    1.948 s …  2.593 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.538800 msec
Total Max:     41.920000 msec
Total Min:     38.848000 msec
```

## 2024.07.25

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 416.056000 msec
Total Max:     439.742000 msec
Total Min:     389.363000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     179.3 ms ±   4.4 ms    [User: 154.6 ms, System: 30.2 ms]
  Range (min … max):   171.8 ms … 191.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.994 s ±  0.168 s    [User: 1.032 s, System: 0.367 s]
  Range (min … max):    1.810 s …  2.770 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.160100 msec
Total Max:     41.454000 msec
Total Min:     38.619000 msec
```

## 2024.07.24

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 398.010800 msec
Total Max:     437.242000 msec
Total Min:     369.183000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     181.4 ms ±  10.8 ms    [User: 153.2 ms, System: 33.4 ms]
  Range (min … max):   170.4 ms … 213.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.830 s ±  0.143 s    [User: 1.065 s, System: 0.355 s]
  Range (min … max):    1.610 s …  2.591 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 43.734000 msec
Total Max:     58.013000 msec
Total Min:     40.332000 msec
```

## 2024.07.19

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 393.358900 msec
Total Max:     432.026000 msec
Total Min:     361.639000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     178.1 ms ±   7.8 ms    [User: 148.5 ms, System: 34.6 ms]
  Range (min … max):   168.4 ms … 209.3 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.083 s ±  0.083 s    [User: 0.983 s, System: 0.349 s]
  Range (min … max):    1.920 s …  2.282 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 39.782200 msec
Total Max:     41.602000 msec
Total Min:     38.289000 msec
```

## 2024.07.18

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 402.248500 msec
Total Max:     422.978000 msec
Total Min:     389.978000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     327.6 ms ±   8.9 ms    [User: 287.5 ms, System: 52.2 ms]
  Range (min … max):   316.8 ms … 357.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.078 s ±  0.164 s    [User: 1.027 s, System: 0.372 s]
  Range (min … max):    1.852 s …  2.626 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.540400 msec
Total Max:     51.764000 msec
Total Min:     38.570000 msec
```

## 2024.07.17

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 382.927600 msec
Total Max:     423.132000 msec
Total Min:     359.913000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     171.3 ms ±   6.9 ms    [User: 149.2 ms, System: 27.6 ms]
  Range (min … max):   162.4 ms … 193.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.915 s ±  0.216 s    [User: 1.004 s, System: 0.359 s]
  Range (min … max):    1.634 s …  3.100 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 43.116200 msec
Total Max:     69.369000 msec
Total Min:     39.137000 msec
```

## 2024.07.08

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 408.113400 msec
Total Max:     464.032000 msec
Total Min:     377.845000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     229.4 ms ±   7.5 ms    [User: 201.5 ms, System: 32.8 ms]
  Range (min … max):   216.6 ms … 255.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.914 s ±  0.105 s    [User: 0.952 s, System: 0.364 s]
  Range (min … max):    1.698 s …  2.221 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.871100 msec
Total Max:     75.979000 msec
Total Min:     37.174000 msec
```

## 2024.07.04

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 413.888500 msec
Total Max:     436.800000 msec
Total Min:     379.412000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     227.0 ms ±   8.2 ms    [User: 201.6 ms, System: 31.2 ms]
  Range (min … max):   217.1 ms … 255.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.705 s ±  0.155 s    [User: 0.975 s, System: 0.349 s]
  Range (min … max):    1.504 s …  2.182 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.351000 msec
Total Max:     49.891000 msec
Total Min:     37.554000 msec
```

## 2024.07.03

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 423.016200 msec
Total Max:     463.989000 msec
Total Min:     398.746000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     236.0 ms ±   7.6 ms    [User: 207.7 ms, System: 33.2 ms]
  Range (min … max):   222.8 ms … 255.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.716 s ±  0.093 s    [User: 0.960 s, System: 0.365 s]
  Range (min … max):    1.542 s …  1.969 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 42.441500 msec
Total Max:     60.856000 msec
Total Min:     39.431000 msec
```

## 2024.07.02

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 271.737100 msec
Total Max:     326.704000 msec
Total Min:     242.622000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     221.5 ms ±   7.1 ms    [User: 195.6 ms, System: 31.7 ms]
  Range (min … max):   212.9 ms … 251.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.763 s ±  0.067 s    [User: 0.947 s, System: 0.354 s]
  Range (min … max):    1.600 s …  1.907 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 39.787100 msec
Total Max:     43.977000 msec
Total Min:     38.859000 msec
```

## 2024.06.28

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 288.170600 msec
Total Max:     378.798000 msec
Total Min:     252.419000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     220.2 ms ±   5.4 ms    [User: 189.3 ms, System: 36.3 ms]
  Range (min … max):   213.0 ms … 235.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.096 s ±  0.073 s    [User: 0.989 s, System: 0.350 s]
  Range (min … max):    1.935 s …  2.291 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 39.828300 msec
Total Max:     42.134000 msec
Total Min:     37.047000 msec
```

## 2024.06.27

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 299.461600 msec
Total Max:     370.106000 msec
Total Min:     265.409000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     230.5 ms ±   9.7 ms    [User: 202.5 ms, System: 34.0 ms]
  Range (min … max):   219.6 ms … 276.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.372 s ±  1.123 s    [User: 1.088 s, System: 0.679 s]
  Range (min … max):    1.791 s …  7.695 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 42.873800 msec
Total Max:     61.123000 msec
Total Min:     39.363000 msec
```

## 2024.06.26

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 279.912500 msec
Total Max:     303.390000 msec
Total Min:     260.974000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     231.1 ms ±  10.6 ms    [User: 200.3 ms, System: 36.2 ms]
  Range (min … max):   212.0 ms … 257.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.988 s ±  0.217 s    [User: 1.005 s, System: 0.382 s]
  Range (min … max):    1.791 s …  3.025 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.713900 msec
Total Max:     44.380000 msec
Total Min:     39.859000 msec
```

## 2024.06.25

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 286.329100 msec
Total Max:     369.481000 msec
Total Min:     242.185000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     229.6 ms ±  11.4 ms    [User: 202.9 ms, System: 33.7 ms]
  Range (min … max):   208.7 ms … 262.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.810 s ±  0.138 s    [User: 0.953 s, System: 0.347 s]
  Range (min … max):    1.614 s …  2.479 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 43.099100 msec
Total Max:     74.293000 msec
Total Min:     38.588000 msec
```

## 2024.06.20

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 280.827000 msec
Total Max:     330.702000 msec
Total Min:     260.586000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     233.8 ms ±   9.4 ms    [User: 209.3 ms, System: 29.8 ms]
  Range (min … max):   223.5 ms … 268.4 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.616 s ±  1.169 s    [User: 1.233 s, System: 0.588 s]
  Range (min … max):    1.925 s …  6.895 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 39.677400 msec
Total Max:     42.810000 msec
Total Min:     37.571000 msec
```

## 2024.06.19

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 249.568600 msec
Total Max:     292.039000 msec
Total Min:     224.303000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     227.1 ms ±   8.1 ms    [User: 197.5 ms, System: 35.3 ms]
  Range (min … max):   215.5 ms … 249.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.015 s ±  0.222 s    [User: 1.073 s, System: 0.341 s]
  Range (min … max):    1.871 s …  3.384 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.563600 msec
Total Max:     55.771000 msec
Total Min:     38.265000 msec
```

## 2024.06.18

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 255.743000 msec
Total Max:     276.153000 msec
Total Min:     230.196000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     223.4 ms ±   6.3 ms    [User: 196.6 ms, System: 32.2 ms]
  Range (min … max):   213.4 ms … 249.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.846 s ±  0.059 s    [User: 0.960 s, System: 0.366 s]
  Range (min … max):    1.718 s …  1.979 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.090800 msec
Total Max:     43.391000 msec
Total Min:     39.751000 msec
```

## 2024.06.17

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 238.523400 msec
Total Max:     254.879000 msec
Total Min:     229.429000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     231.1 ms ±   9.9 ms    [User: 204.5 ms, System: 32.4 ms]
  Range (min … max):   221.0 ms … 281.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.752 s ±  0.104 s    [User: 0.973 s, System: 0.371 s]
  Range (min … max):    1.567 s …  2.175 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 45.094200 msec
Total Max:     76.915000 msec
Total Min:     39.764000 msec
```

## 2024.06.14

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 236.984100 msec
Total Max:     245.726000 msec
Total Min:     228.243000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     230.3 ms ±  11.5 ms    [User: 201.1 ms, System: 34.8 ms]
  Range (min … max):   217.9 ms … 265.4 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.210 s ±  0.086 s    [User: 1.032 s, System: 0.386 s]
  Range (min … max):    2.057 s …  2.530 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 46.713600 msec
Total Max:     64.768000 msec
Total Min:     41.274000 msec
```

## 2024.06.12

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 237.895300 msec
Total Max:     262.810000 msec
Total Min:     219.751000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     231.6 ms ±   8.6 ms    [User: 205.7 ms, System: 31.1 ms]
  Range (min … max):   218.6 ms … 265.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.850 s ±  0.081 s    [User: 0.948 s, System: 0.359 s]
  Range (min … max):    1.728 s …  2.137 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 42.716900 msec
Total Max:     46.759000 msec
Total Min:     40.228000 msec
```

## 2024.06.07

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 190.282700 msec
Total Max:     281.024000 msec
Total Min:     157.732000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     242.9 ms ±  16.6 ms    [User: 217.0 ms, System: 32.1 ms]
  Range (min … max):   215.8 ms … 291.4 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.151 s ±  0.486 s    [User: 1.064 s, System: 0.398 s]
  Range (min … max):    1.794 s …  4.302 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 43.403900 msec
Total Max:     62.547000 msec
Total Min:     39.621000 msec
```

## 2024.06.06

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 181.656700 msec
Total Max:     209.020000 msec
Total Min:     158.125000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     239.5 ms ±  16.8 ms    [User: 213.7 ms, System: 31.2 ms]
  Range (min … max):   216.9 ms … 296.3 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.868 s ±  0.442 s    [User: 0.979 s, System: 0.375 s]
  Range (min … max):    1.673 s …  4.897 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 42.548400 msec
Total Max:     68.695000 msec
Total Min:     38.826000 msec
```

## 2024.05.31

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 261.637500 msec
Total Max:     346.506000 msec
Total Min:     237.988000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     230.2 ms ±   9.7 ms    [User: 202.4 ms, System: 33.1 ms]
  Range (min … max):   215.3 ms … 274.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.977 s ±  0.269 s    [User: 0.986 s, System: 0.417 s]
  Range (min … max):    1.773 s …  3.665 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
```

## 2024.05.30

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 265.053700 msec
Total Max:     305.104000 msec
Total Min:     235.017000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     220.0 ms ±   4.9 ms    [User: 194.3 ms, System: 31.2 ms]
  Range (min … max):   211.2 ms … 231.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.797 s ±  0.043 s    [User: 0.944 s, System: 0.342 s]
  Range (min … max):    1.715 s …  1.918 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 39.330800 msec
Total Max:     41.803000 msec
Total Min:     38.455000 msec
```

## 2024.05.29

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 270.851500 msec
Total Max:     298.393000 msec
Total Min:     224.798000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     229.8 ms ±   9.7 ms    [User: 203.8 ms, System: 31.3 ms]
  Range (min … max):   216.2 ms … 257.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.773 s ±  0.175 s    [User: 1.004 s, System: 0.370 s]
  Range (min … max):    1.593 s …  2.492 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 42.041100 msec
Total Max:     45.026000 msec
Total Min:     40.434000 msec
```

## 2024.05.28

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 246.595400 msec
Total Max:     289.465000 msec
Total Min:     202.284000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     225.4 ms ±   6.2 ms    [User: 200.4 ms, System: 30.0 ms]
  Range (min … max):   214.9 ms … 245.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.615 s ±  0.051 s    [User: 0.929 s, System: 0.346 s]
  Range (min … max):    1.506 s …  1.719 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 43.506600 msec
Total Max:     81.481000 msec
Total Min:     37.311000 msec
```

## 2024.05.27

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 253.621300 msec
Total Max:     263.525000 msec
Total Min:     244.200000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     229.3 ms ±  10.4 ms    [User: 201.9 ms, System: 33.0 ms]
  Range (min … max):   214.3 ms … 270.9 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.565 s ±  4.078 s    [User: 1.216 s, System: 0.791 s]
  Range (min … max):    1.698 s … 30.548 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.886000 msec
Total Max:     51.523000 msec
Total Min:     38.520000 msec
```

## 2024.05.24

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 413.813400 msec
Total Max:     1746.880000 msec
Total Min:     241.586000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     228.1 ms ±  10.7 ms    [User: 203.6 ms, System: 29.7 ms]
  Range (min … max):   217.0 ms … 287.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      3.333 s ±  6.129 s    [User: 1.441 s, System: 1.435 s]
  Range (min … max):    1.623 s … 31.546 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.990900 msec
Total Max:     59.944000 msec
Total Min:     38.850000 msec
```

## 2024.05.23

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 296.063900 msec
Total Max:     376.885000 msec
Total Min:     239.856000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     232.7 ms ±   9.5 ms    [User: 203.3 ms, System: 34.9 ms]
  Range (min … max):   220.5 ms … 261.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.125 s ±  0.215 s    [User: 1.047 s, System: 0.371 s]
  Range (min … max):    1.939 s …  3.122 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 44.254100 msec
Total Max:     89.477000 msec
Total Min:     37.707000 msec
```

## 2024.05.22

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 265.160200 msec
Total Max:     349.590000 msec
Total Min:     221.012000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     234.7 ms ±  13.6 ms    [User: 213.0 ms, System: 27.5 ms]
  Range (min … max):   214.3 ms … 282.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.944 s ±  0.121 s    [User: 1.005 s, System: 0.378 s]
  Range (min … max):    1.766 s …  2.395 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.344200 msec
Total Max:     48.681000 msec
Total Min:     37.592000 msec
```

## 2024.05.21

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 248.556900 msec
Total Max:     284.961000 msec
Total Min:     226.548000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     230.5 ms ±   9.1 ms    [User: 202.9 ms, System: 32.5 ms]
  Range (min … max):   217.8 ms … 265.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.785 s ±  0.041 s    [User: 0.951 s, System: 0.375 s]
  Range (min … max):    1.721 s …  1.911 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.713700 msec
Total Max:     43.940000 msec
Total Min:     39.001000 msec
```

## 2024.05.20

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 246.942500 msec
Total Max:     274.787000 msec
Total Min:     215.905000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     235.6 ms ±   8.2 ms    [User: 205.1 ms, System: 35.5 ms]
  Range (min … max):   222.0 ms … 257.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.645 s ±  0.090 s    [User: 0.938 s, System: 0.373 s]
  Range (min … max):    1.465 s …  1.990 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.860000 msec
Total Max:     58.970000 msec
Total Min:     38.811000 msec
```

## 2024.05.17

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 243.839200 msec
Total Max:     273.723000 msec
Total Min:     214.709000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     228.2 ms ±   8.1 ms    [User: 204.3 ms, System: 29.4 ms]
  Range (min … max):   215.7 ms … 246.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.645 s ±  0.077 s    [User: 0.946 s, System: 0.370 s]
  Range (min … max):    1.483 s …  1.872 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.050000 msec
Total Max:     49.917000 msec
Total Min:     39.158000 msec
```

## 2024.05.16

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 281.232200 msec
Total Max:     307.512000 msec
Total Min:     247.925000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     225.8 ms ±   8.0 ms    [User: 200.7 ms, System: 30.8 ms]
  Range (min … max):   215.6 ms … 248.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.675 s ±  0.081 s    [User: 0.951 s, System: 0.345 s]
  Range (min … max):    1.528 s …  1.910 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.851800 msec
Total Max:     58.962000 msec
Total Min:     38.855000 msec
```

## 2024.05.15

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 268.294700 msec
Total Max:     316.857000 msec
Total Min:     240.890000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     236.6 ms ±  11.2 ms    [User: 208.8 ms, System: 33.6 ms]
  Range (min … max):   218.9 ms … 272.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.675 s ±  0.122 s    [User: 0.972 s, System: 0.361 s]
  Range (min … max):    1.507 s …  2.181 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.022200 msec
Total Max:     42.680000 msec
Total Min:     38.850000 msec
```

## 2024.05.14

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 270.133900 msec
Total Max:     296.225000 msec
Total Min:     249.926000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     217.8 ms ±   3.7 ms    [User: 193.4 ms, System: 29.8 ms]
  Range (min … max):   213.9 ms … 238.9 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.718 s ±  0.058 s    [User: 0.962 s, System: 0.359 s]
  Range (min … max):    1.582 s …  1.837 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 39.085400 msec
Total Max:     41.086000 msec
Total Min:     38.156000 msec
```

## 2024.05.13

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 274.005500 msec
Total Max:     305.054000 msec
Total Min:     237.379000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     221.2 ms ±   5.2 ms    [User: 194.1 ms, System: 32.6 ms]
  Range (min … max):   215.5 ms … 237.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.712 s ±  0.136 s    [User: 0.984 s, System: 0.360 s]
  Range (min … max):    1.550 s …  2.248 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 45.509400 msec
Total Max:     69.213000 msec
Total Min:     39.817000 msec
```

## 2024.05.10

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 297.695900 msec
Total Max:     477.105000 msec
Total Min:     241.092000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     233.1 ms ±  14.3 ms    [User: 203.6 ms, System: 35.2 ms]
  Range (min … max):   216.1 ms … 278.9 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.360 s ±  0.285 s    [User: 1.078 s, System: 0.368 s]
  Range (min … max):    2.075 s …  3.537 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.518800 msec
Total Max:     45.946000 msec
Total Min:     38.062000 msec
```

## 2024.05.09

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 276.384200 msec
Total Max:     308.891000 msec
Total Min:     246.246000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     237.2 ms ±  14.2 ms    [User: 208.5 ms, System: 34.3 ms]
  Range (min … max):   222.2 ms … 284.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.972 s ±  0.071 s    [User: 1.008 s, System: 0.360 s]
  Range (min … max):    1.795 s …  2.178 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.839700 msec
Total Max:     53.887000 msec
Total Min:     39.795000 msec
```

## 2024.05.08

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 296.252100 msec
Total Max:     328.018000 msec
Total Min:     271.227000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     235.0 ms ±  16.6 ms    [User: 207.5 ms, System: 32.3 ms]
  Range (min … max):   219.6 ms … 305.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.949 s ±  0.319 s    [User: 1.019 s, System: 0.446 s]
  Range (min … max):    1.683 s …  3.433 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.881100 msec
Total Max:     44.112000 msec
Total Min:     40.332000 msec
```

## 2024.05.07

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 283.156900 msec
Total Max:     318.240000 msec
Total Min:     255.235000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     231.9 ms ±   8.3 ms    [User: 209.3 ms, System: 28.2 ms]
  Range (min … max):   219.0 ms … 262.4 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.735 s ±  0.082 s    [User: 0.985 s, System: 0.373 s]
  Range (min … max):    1.586 s …  1.987 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 45.413700 msec
Total Max:     67.133000 msec
Total Min:     41.287000 msec
```

## 2024.04.25

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 264.039000 msec
Total Max:     275.102000 msec
Total Min:     249.482000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     235.7 ms ±  13.4 ms    [User: 209.0 ms, System: 32.8 ms]
  Range (min … max):   217.9 ms … 292.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.657 s ±  0.054 s    [User: 0.955 s, System: 0.349 s]
  Range (min … max):    1.560 s …  1.839 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 14.534200 msec
Total Max:     14.936000 msec
Total Min:     14.388000 msec
```

## 2024.04.24

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 611.711300 msec
Total Max:     699.159000 msec
Total Min:     581.894000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     236.5 ms ±  13.9 ms    [User: 212.5 ms, System: 30.2 ms]
  Range (min … max):   223.2 ms … 317.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.660 s ±  0.068 s    [User: 0.959 s, System: 0.369 s]
  Range (min … max):    1.483 s …  1.885 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 18.546600 msec
Total Max:     36.984000 msec
Total Min:     14.905000 msec
```

## 2024.04.23

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 644.489000 msec
Total Max:     785.655000 msec
Total Min:     611.565000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     250.7 ms ±  78.6 ms    [User: 214.7 ms, System: 41.9 ms]
  Range (min … max):   223.2 ms … 774.9 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.904 s ±  0.695 s    [User: 1.067 s, System: 0.440 s]
  Range (min … max):    1.559 s …  5.973 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 15.222600 msec
Total Max:     16.608000 msec
Total Min:     14.545000 msec
```

## 2024.04.19

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 248.896700 msec
Total Max:     270.052000 msec
Total Min:     228.250000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     231.3 ms ±   7.8 ms    [User: 205.0 ms, System: 31.9 ms]
  Range (min … max):   221.2 ms … 261.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.177 s ±  0.739 s    [User: 1.102 s, System: 0.379 s]
  Range (min … max):    1.720 s …  6.952 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 18.087900 msec
Total Max:     31.539000 msec
Total Min:     14.496000 msec
```

## 2024.04.18

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 231.411300 msec
Total Max:     257.274000 msec
Total Min:     200.100000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     226.6 ms ±   8.9 ms    [User: 206.5 ms, System: 26.1 ms]
  Range (min … max):   212.5 ms … 249.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.995 s ±  0.563 s    [User: 1.044 s, System: 0.417 s]
  Range (min … max):    1.619 s …  3.973 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 15.199500 msec
Total Max:     16.263000 msec
Total Min:     14.513000 msec
```

## 2024.04.17

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 306.820300 msec
Total Max:     339.910000 msec
Total Min:     246.849000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     311.6 ms ±  45.0 ms    [User: 272.2 ms, System: 39.5 ms]
  Range (min … max):   246.4 ms … 398.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.107 s ±  0.905 s    [User: 1.109 s, System: 0.405 s]
  Range (min … max):    1.597 s …  7.617 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 2.060000 msec
Total Max:     2.243000 msec
Total Min:     1.888000 msec
```

## 2024.04.16

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 208.751800 msec
Total Max:     232.318000 msec
Total Min:     182.163000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     226.4 ms ±  13.0 ms    [User: 199.8 ms, System: 31.8 ms]
  Range (min … max):   214.4 ms … 295.3 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.847 s ±  0.235 s    [User: 0.951 s, System: 0.370 s]
  Range (min … max):    1.642 s …  2.853 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.532000 msec
Total Max:     12.576000 msec
Total Min:     11.020000 msec
```

## 2024.04.15

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 221.158600 msec
Total Max:     335.697000 msec
Total Min:     193.078000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     256.0 ms ±  22.4 ms    [User: 226.3 ms, System: 36.3 ms]
  Range (min … max):   229.8 ms … 317.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.035 s ±  0.683 s    [User: 1.085 s, System: 0.438 s]
  Range (min … max):    1.616 s …  5.802 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.551300 msec
Total Max:     23.941000 msec
Total Min:     11.960000 msec
```

## 2024.04.12

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 204.430700 msec
Total Max:     224.091000 msec
Total Min:     185.118000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     236.0 ms ±  15.8 ms    [User: 210.3 ms, System: 32.1 ms]
  Range (min … max):   213.8 ms … 284.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      3.753 s ±  1.895 s    [User: 1.728 s, System: 0.404 s]
  Range (min … max):    1.917 s …  9.236 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.670000 msec
Total Max:     20.375000 msec
Total Min:     11.283000 msec
```

## 2024.04.11

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 217.215100 msec
Total Max:     240.882000 msec
Total Min:     191.293000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     105.1 ms ±   7.7 ms    [User: 86.9 ms, System: 16.4 ms]
  Range (min … max):    95.9 ms … 127.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.999 s ±  0.238 s    [User: 1.020 s, System: 0.370 s]
  Range (min … max):    1.739 s …  2.781 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.622300 msec
Total Max:     12.943000 msec
Total Min:     12.193000 msec
```

## 2024.04.10

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 217.388200 msec
Total Max:     270.320000 msec
Total Min:     190.058000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     206.5 ms ±  15.6 ms    [User: 181.9 ms, System: 30.3 ms]
  Range (min … max):   192.3 ms … 271.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.923 s ±  0.210 s    [User: 1.027 s, System: 0.385 s]
  Range (min … max):    1.684 s …  2.684 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.994600 msec
Total Max:     13.140000 msec
Total Min:     11.597000 msec
```

## 2024.04.09

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 195.467700 msec
Total Max:     225.440000 msec
Total Min:     173.687000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     202.7 ms ±   8.6 ms    [User: 175.9 ms, System: 31.1 ms]
  Range (min … max):   189.3 ms … 225.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.753 s ±  0.157 s    [User: 0.988 s, System: 0.365 s]
  Range (min … max):    1.571 s …  2.260 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.812000 msec
Total Max:     16.783000 msec
Total Min:     11.680000 msec
```

## 2024.04.08

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 197.865000 msec
Total Max:     226.275000 msec
Total Min:     173.935000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     202.2 ms ±  15.7 ms    [User: 179.4 ms, System: 27.5 ms]
  Range (min … max):   190.3 ms … 259.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.737 s ±  0.202 s    [User: 0.998 s, System: 0.355 s]
  Range (min … max):    1.527 s …  2.645 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 14.137000 msec
Total Max:     31.260000 msec
Total Min:     11.172000 msec
```

## 2024.04.05

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 216.651300 msec
Total Max:     244.129000 msec
Total Min:     199.033000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     229.2 ms ±  32.3 ms    [User: 200.2 ms, System: 34.4 ms]
  Range (min … max):   200.2 ms … 343.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.199 s ±  0.105 s    [User: 1.010 s, System: 0.360 s]
  Range (min … max):    2.026 s …  2.500 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.238800 msec
Total Max:     16.187000 msec
Total Min:     11.330000 msec
```

## 2024.04.03

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 189.667600 msec
Total Max:     203.889000 msec
Total Min:     172.910000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     202.8 ms ±  10.4 ms    [User: 179.9 ms, System: 27.5 ms]
  Range (min … max):   189.1 ms … 232.3 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.096 s ±  0.171 s    [User: 1.029 s, System: 0.361 s]
  Range (min … max):    1.898 s …  3.123 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 14.082600 msec
Total Max:     32.339000 msec
Total Min:     11.290000 msec
```

## 2024.04.02

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 320.316200 msec
Total Max:     930.408000 msec
Total Min:     204.956000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     222.2 ms ±  13.6 ms    [User: 195.3 ms, System: 31.6 ms]
  Range (min … max):   199.6 ms … 278.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.908 s ±  0.298 s    [User: 1.098 s, System: 0.387 s]
  Range (min … max):    1.646 s …  3.768 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.771900 msec
Total Max:     27.506000 msec
Total Min:     11.521000 msec
```

## 2024.04.01

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 215.827900 msec
Total Max:     251.029000 msec
Total Min:     181.047000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     201.9 ms ±   7.1 ms    [User: 179.4 ms, System: 27.5 ms]
  Range (min … max):   193.6 ms … 239.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.689 s ±  0.107 s    [User: 0.944 s, System: 0.377 s]
  Range (min … max):    1.529 s …  2.160 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 15.615900 msec
Total Max:     39.278000 msec
Total Min:     11.035000 msec
```

## 2024.03.29

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 202.242300 msec
Total Max:     218.579000 msec
Total Min:     184.905000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     212.0 ms ±  10.7 ms    [User: 186.6 ms, System: 30.5 ms]
  Range (min … max):   193.2 ms … 241.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.580 s ±  0.184 s    [User: 1.147 s, System: 0.390 s]
  Range (min … max):    2.318 s …  3.309 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.986800 msec
Total Max:     12.245000 msec
Total Min:     11.364000 msec
```

## 2024.03.28

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 193.402300 msec
Total Max:     227.161000 msec
Total Min:     172.022000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     204.0 ms ±  10.2 ms    [User: 174.0 ms, System: 34.8 ms]
  Range (min … max):   189.8 ms … 244.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.175 s ±  0.089 s    [User: 1.005 s, System: 0.369 s]
  Range (min … max):    2.013 s …  2.467 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.212400 msec
Total Max:     19.124000 msec
Total Min:     11.289000 msec
```

## 2024.03.27

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 176.157100 msec
Total Max:     193.446000 msec
Total Min:     146.668000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     210.9 ms ±  12.2 ms    [User: 182.8 ms, System: 33.2 ms]
  Range (min … max):   198.0 ms … 252.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.178 s ±  0.333 s    [User: 1.108 s, System: 0.405 s]
  Range (min … max):    1.905 s …  3.638 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.025400 msec
Total Max:     15.626000 msec
Total Min:     11.126000 msec
```

## 2024.03.26

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 161.396300 msec
Total Max:     226.951000 msec
Total Min:     141.885000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     215.2 ms ±  22.5 ms    [User: 183.8 ms, System: 36.4 ms]
  Range (min … max):   196.9 ms … 348.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.857 s ±  0.120 s    [User: 1.017 s, System: 0.383 s]
  Range (min … max):    1.684 s …  2.378 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.192700 msec
Total Max:     13.337000 msec
Total Min:     11.480000 msec
```

## 2024.03.25

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 160.892100 msec
Total Max:     216.751000 msec
Total Min:     139.415000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     197.6 ms ±   7.0 ms    [User: 175.1 ms, System: 27.4 ms]
  Range (min … max):   188.4 ms … 215.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.769 s ±  0.164 s    [User: 1.005 s, System: 0.378 s]
  Range (min … max):    1.542 s …  2.234 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 16.148500 msec
Total Max:     26.661000 msec
Total Min:     12.495000 msec
```

## 2024.03.21

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 162.170700 msec
Total Max:     190.052000 msec
Total Min:     132.393000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     199.4 ms ±  12.4 ms    [User: 177.7 ms, System: 26.1 ms]
  Range (min … max):   187.3 ms … 270.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.901 s ±  0.056 s    [User: 0.962 s, System: 0.337 s]
  Range (min … max):    1.764 s …  2.058 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.366200 msec
Total Max:     15.538000 msec
Total Min:     11.105000 msec
```

## 2024.03.19

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 151.677000 msec
Total Max:     175.688000 msec
Total Min:     132.236000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     197.8 ms ±   5.3 ms    [User: 171.9 ms, System: 30.9 ms]
  Range (min … max):   191.0 ms … 221.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.797 s ±  0.126 s    [User: 0.947 s, System: 0.339 s]
  Range (min … max):    1.639 s …  2.328 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 15.032000 msec
Total Max:     33.425000 msec
Total Min:     11.565000 msec
```

## 2024.03.18

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 146.472200 msec
Total Max:     207.183000 msec
Total Min:     127.773000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     216.6 ms ±  12.2 ms    [User: 191.7 ms, System: 30.0 ms]
  Range (min … max):   201.2 ms … 259.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.718 s ±  0.065 s    [User: 0.960 s, System: 0.380 s]
  Range (min … max):    1.618 s …  2.005 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.873000 msec
Total Max:     16.968000 msec
Total Min:     11.580000 msec
```

## 2024.03.15

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 146.576500 msec
Total Max:     168.664000 msec
Total Min:     134.304000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     202.5 ms ±   9.2 ms    [User: 177.2 ms, System: 30.5 ms]
  Range (min … max):   191.2 ms … 233.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.949 s ±  0.826 s    [User: 1.030 s, System: 0.376 s]
  Range (min … max):    1.572 s …  6.845 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 18.242600 msec
Total Max:     31.427000 msec
Total Min:     12.268000 msec
```

## 2024.03.14

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 141.945400 msec
Total Max:     159.462000 msec
Total Min:     130.543000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     205.2 ms ±  13.2 ms    [User: 181.4 ms, System: 29.7 ms]
  Range (min … max):   188.2 ms … 258.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.973 s ±  0.113 s    [User: 0.996 s, System: 0.368 s]
  Range (min … max):    1.833 s …  2.379 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 14.079100 msec
Total Max:     28.674000 msec
Total Min:     11.452000 msec
```

## 2024.03.13

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 145.615700 msec
Total Max:     174.693000 msec
Total Min:     124.212000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     210.8 ms ±  19.9 ms    [User: 180.0 ms, System: 34.4 ms]
  Range (min … max):   196.1 ms … 290.9 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      3.714 s ±  5.035 s    [User: 1.565 s, System: 0.970 s]
  Range (min … max):    1.784 s … 35.263 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.787400 msec
Total Max:     12.831000 msec
Total Min:     11.174000 msec
```

## 2024.03.12

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 163.213900 msec
Total Max:     191.934000 msec
Total Min:     136.279000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     203.6 ms ±  10.8 ms    [User: 175.9 ms, System: 32.4 ms]
  Range (min … max):   196.0 ms … 259.4 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.719 s ±  0.072 s    [User: 0.953 s, System: 0.349 s]
  Range (min … max):    1.595 s …  1.922 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.341200 msec
Total Max:     23.798000 msec
Total Min:     11.196000 msec
```

## 2024.03.11

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 229.528500 msec
Total Max:     343.825000 msec
Total Min:     143.966000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     382.2 ms ±  97.3 ms    [User: 322.7 ms, System: 69.1 ms]
  Range (min … max):   210.7 ms … 628.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.053 s ±  0.628 s    [User: 1.123 s, System: 0.422 s]
  Range (min … max):    1.599 s …  5.549 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.082600 msec
Total Max:     20.387000 msec
Total Min:     11.208000 msec
```

## 2024.03.07

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 134.129300 msec
Total Max:     152.900000 msec
Total Min:     113.900000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     192.5 ms ±   5.4 ms    [User: 169.3 ms, System: 28.0 ms]
  Range (min … max):   185.9 ms … 209.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.800 s ±  0.117 s    [User: 0.962 s, System: 0.361 s]
  Range (min … max):    1.620 s …  2.390 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.935600 msec
Total Max:     17.013000 msec
Total Min:     11.093000 msec
```

## 2024.03.06

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 140.680000 msec
Total Max:     168.642000 msec
Total Min:     115.157000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     194.7 ms ±   3.6 ms    [User: 168.8 ms, System: 30.4 ms]
  Range (min … max):   188.6 ms … 204.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.701 s ±  0.043 s    [User: 0.946 s, System: 0.349 s]
  Range (min … max):    1.627 s …  1.806 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.342100 msec
Total Max:     18.510000 msec
Total Min:     11.027000 msec
```

## 2024.03.05

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 130.902800 msec
Total Max:     144.810000 msec
Total Min:     110.046000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     209.2 ms ±  11.4 ms    [User: 180.7 ms, System: 34.4 ms]
  Range (min … max):   198.5 ms … 259.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.662 s ±  0.083 s    [User: 0.973 s, System: 0.344 s]
  Range (min … max):    1.508 s …  1.977 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.370400 msec
Total Max:     11.729000 msec
Total Min:     11.178000 msec
```

## 2024.03.04

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 131.513100 msec
Total Max:     164.663000 msec
Total Min:     111.721000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     198.4 ms ±   5.4 ms    [User: 167.3 ms, System: 38.0 ms]
  Range (min … max):   191.0 ms … 223.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.843 s ±  0.068 s    [User: 0.966 s, System: 0.350 s]
  Range (min … max):    1.683 s …  2.096 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.363700 msec
Total Max:     19.274000 msec
Total Min:     11.438000 msec
```

## 2024.02.26

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 143.193100 msec
Total Max:     176.021000 msec
Total Min:     118.038000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     202.6 ms ±   6.3 ms    [User: 174.3 ms, System: 34.2 ms]
  Range (min … max):   195.0 ms … 225.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.631 s ±  0.100 s    [User: 0.918 s, System: 0.371 s]
  Range (min … max):    1.462 s …  2.127 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.916300 msec
Total Max:     34.441000 msec
Total Min:     11.168000 msec
```

## 2024.02.22

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 141.574700 msec
Total Max:     158.983000 msec
Total Min:     129.661000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     230.8 ms ±  16.0 ms    [User: 200.6 ms, System: 37.3 ms]
  Range (min … max):   206.0 ms … 278.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.825 s ±  0.915 s    [User: 1.366 s, System: 0.492 s]
  Range (min … max):    1.825 s …  6.708 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.886900 msec
Total Max:     13.198000 msec
Total Min:     11.077000 msec
```

## 2024.02.21

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 138.243300 msec
Total Max:     166.158000 msec
Total Min:     115.191000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     222.0 ms ±  28.7 ms    [User: 195.0 ms, System: 33.9 ms]
  Range (min … max):   193.5 ms … 318.4 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.151 s ±  0.149 s    [User: 1.090 s, System: 0.374 s]
  Range (min … max):    1.957 s …  2.677 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.326600 msec
Total Max:     28.027000 msec
Total Min:     11.170000 msec
```

## 2024.02.20

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 146.757400 msec
Total Max:     164.778000 msec
Total Min:     121.067000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     216.2 ms ±  19.0 ms    [User: 186.1 ms, System: 36.6 ms]
  Range (min … max):   197.9 ms … 301.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.991 s ±  0.157 s    [User: 1.083 s, System: 0.357 s]
  Range (min … max):    1.826 s …  2.833 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.295900 msec
Total Max:     23.713000 msec
Total Min:     11.126000 msec
```

## 2024.02.19

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 141.008600 msec
Total Max:     166.807000 msec
Total Min:     120.052000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     208.9 ms ±   8.7 ms    [User: 184.7 ms, System: 30.6 ms]
  Range (min … max):   199.3 ms … 244.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.881 s ±  0.216 s    [User: 1.070 s, System: 0.349 s]
  Range (min … max):    1.711 s …  3.139 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 15.826300 msec
Total Max:     41.557000 msec
Total Min:     10.866000 msec
```

## 2024.02.16

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 137.137600 msec
Total Max:     148.306000 msec
Total Min:     125.662000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     196.6 ms ±   5.8 ms    [User: 167.9 ms, System: 34.6 ms]
  Range (min … max):   189.7 ms … 223.4 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.799 s ±  0.064 s    [User: 0.936 s, System: 0.321 s]
  Range (min … max):    1.593 s …  1.902 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.581800 msec
Total Max:     12.075000 msec
Total Min:     11.276000 msec
```

## 2024.02.15

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 130.666200 msec
Total Max:     144.348000 msec
Total Min:     123.411000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     111.0 ms ±   7.0 ms    [User: 93.0 ms, System: 17.2 ms]
  Range (min … max):   104.8 ms … 143.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.724 s ±  0.115 s    [User: 0.978 s, System: 0.323 s]
  Range (min … max):    1.532 s …  2.341 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.560800 msec
Total Max:     12.696000 msec
Total Min:     11.038000 msec
```

## 2024.02.14

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 128.569800 msec
Total Max:     139.210000 msec
Total Min:     112.994000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     100.7 ms ±   3.8 ms    [User: 82.9 ms, System: 17.4 ms]
  Range (min … max):    94.0 ms … 113.3 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.688 s ±  0.272 s    [User: 0.975 s, System: 0.330 s]
  Range (min … max):    1.494 s …  2.803 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.520600 msec
Total Max:     14.539000 msec
Total Min:     11.534000 msec
```

## 2024.02.13

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 135.163000 msec
Total Max:     152.002000 msec
Total Min:     116.782000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     101.6 ms ±   4.5 ms    [User: 84.5 ms, System: 16.8 ms]
  Range (min … max):    95.1 ms … 121.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.554 s ±  0.067 s    [User: 0.922 s, System: 0.319 s]
  Range (min … max):    1.454 s …  1.743 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.196700 msec
Total Max:     25.440000 msec
Total Min:     10.821000 msec
```

## 2024.02.09

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 212.981600 msec
Total Max:     238.771000 msec
Total Min:     183.562000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     143.1 ms ±   6.4 ms    [User: 123.3 ms, System: 24.5 ms]
  Range (min … max):   135.9 ms … 164.9 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.569 s ±  0.072 s    [User: 0.932 s, System: 0.333 s]
  Range (min … max):    1.437 s …  1.764 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 14.111500 msec
Total Max:     32.464000 msec
Total Min:     11.249000 msec
```

## 2024.02.08

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 363.567500 msec
Total Max:     888.039000 msec
Total Min:     209.598000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     158.6 ms ±   5.8 ms    [User: 130.3 ms, System: 32.5 ms]
  Range (min … max):   146.4 ms … 170.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.825 s ±  0.211 s    [User: 0.964 s, System: 0.363 s]
  Range (min … max):    1.627 s …  3.067 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.822300 msec
Total Max:     14.629000 msec
Total Min:     11.305000 msec
```

## 2024.02.07

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 272.575300 msec
Total Max:     682.998000 msec
Total Min:     210.043000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     165.7 ms ±  11.1 ms    [User: 130.6 ms, System: 42.0 ms]
  Range (min … max):   146.7 ms … 193.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.822 s ±  0.198 s    [User: 1.000 s, System: 0.363 s]
  Range (min … max):    1.602 s …  2.697 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 15.295000 msec
Total Max:     45.997000 msec
Total Min:     11.422000 msec
```

## 2024.02.06

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 233.760800 msec
Total Max:     301.399000 msec
Total Min:     209.201000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     152.9 ms ±   5.5 ms    [User: 126.8 ms, System: 31.1 ms]
  Range (min … max):   143.7 ms … 173.3 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.742 s ±  0.130 s    [User: 0.977 s, System: 0.357 s]
  Range (min … max):    1.601 s …  2.167 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.111300 msec
Total Max:     27.110000 msec
Total Min:     11.007000 msec
```

## 2024.02.05

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 254.824400 msec
Total Max:     341.604000 msec
Total Min:     212.873000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     144.8 ms ±   3.8 ms    [User: 118.7 ms, System: 31.0 ms]
  Range (min … max):   136.3 ms … 154.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.572 s ±  0.052 s    [User: 0.950 s, System: 0.322 s]
  Range (min … max):    1.434 s …  1.677 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 14.046100 msec
Total Max:     24.366000 msec
Total Min:     11.602000 msec
```

## 2024.02.02

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 205.163000 msec
Total Max:     258.517000 msec
Total Min:     176.798000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     146.5 ms ±   7.8 ms    [User: 121.3 ms, System: 28.3 ms]
  Range (min … max):   138.3 ms … 185.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.726 s ±  0.202 s    [User: 0.934 s, System: 0.332 s]
  Range (min … max):    1.598 s …  3.036 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.225700 msec
Total Max:     19.789000 msec
Total Min:     11.084000 msec
```

## 2024.01.31

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 218.191700 msec
Total Max:     245.330000 msec
Total Min:     197.924000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     144.7 ms ±   5.3 ms    [User: 121.9 ms, System: 27.3 ms]
  Range (min … max):   137.8 ms … 167.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.599 s ±  0.081 s    [User: 0.931 s, System: 0.318 s]
  Range (min … max):    1.456 s …  1.863 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.338000 msec
Total Max:     12.371000 msec
Total Min:     11.001000 msec
```

## 2024.01.30

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 210.625600 msec
Total Max:     238.517000 msec
Total Min:     179.779000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     151.2 ms ±  53.5 ms    [User: 122.0 ms, System: 27.7 ms]
  Range (min … max):   134.8 ms … 517.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.567 s ±  0.079 s    [User: 0.952 s, System: 0.320 s]
  Range (min … max):    1.417 s …  1.793 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.795300 msec
Total Max:     19.140000 msec
Total Min:     11.228000 msec
```

## 2024.01.29

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 235.448700 msec
Total Max:     308.902000 msec
Total Min:     203.253000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     146.8 ms ±   4.0 ms    [User: 118.6 ms, System: 33.1 ms]
  Range (min … max):   139.2 ms … 157.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.560 s ±  0.055 s    [User: 0.938 s, System: 0.316 s]
  Range (min … max):    1.424 s …  1.698 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 14.313600 msec
Total Max:     36.763000 msec
Total Min:     11.431000 msec
```

## 2024.01.26

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 232.867400 msec
Total Max:     297.502000 msec
Total Min:     201.334000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     155.4 ms ±   9.6 ms    [User: 135.5 ms, System: 29.3 ms]
  Range (min … max):   139.9 ms … 183.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.187 s ±  0.132 s    [User: 1.059 s, System: 0.347 s]
  Range (min … max):    1.977 s …  2.582 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.145200 msec
Total Max:     14.683000 msec
Total Min:     11.981000 msec
```

## 2024.01.25

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 200.457600 msec
Total Max:     229.568000 msec
Total Min:     182.788000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     148.1 ms ±  15.8 ms    [User: 128.7 ms, System: 27.8 ms]
  Range (min … max):   135.9 ms … 218.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.159 s ±  0.087 s    [User: 1.005 s, System: 0.331 s]
  Range (min … max):    1.964 s …  2.375 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 15.558500 msec
Total Max:     42.031000 msec
Total Min:     11.045000 msec
```

## 2024.01.24

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 262.315900 msec
Total Max:     342.292000 msec
Total Min:     194.744000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     147.7 ms ±  18.1 ms    [User: 125.7 ms, System: 30.1 ms]
  Range (min … max):   132.9 ms … 228.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.076 s ±  0.069 s    [User: 0.987 s, System: 0.339 s]
  Range (min … max):    1.946 s …  2.221 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 14.666900 msec
Total Max:     32.817000 msec
Total Min:     11.728000 msec
```

## 2024.01.18

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 222.798200 msec
Total Max:     262.142000 msec
Total Min:     189.232000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     140.7 ms ±   6.7 ms    [User: 120.5 ms, System: 27.1 ms]
  Range (min … max):   132.0 ms … 167.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.854 s ±  0.085 s    [User: 0.948 s, System: 0.329 s]
  Range (min … max):    1.654 s …  2.044 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 13.169200 msec
Total Max:     28.932000 msec
Total Min:     11.104000 msec
```

## 2024.01.17

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 218.422100 msec
Total Max:     249.225000 msec
Total Min:     187.053000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     111.2 ms ±  16.8 ms    [User: 115.8 ms, System: 8.0 ms]
  Range (min … max):   101.5 ms … 196.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.793 s ±  0.086 s    [User: 0.952 s, System: 0.326 s]
  Range (min … max):    1.616 s …  1.990 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 21.117600 msec
Total Max:     57.971000 msec
Total Min:     11.593000 msec
```

## 2024.01.16

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 251.342100 msec
Total Max:     370.967000 msec
Total Min:     198.192000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     141.6 ms ±   6.5 ms    [User: 120.5 ms, System: 28.1 ms]
  Range (min … max):   133.0 ms … 169.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.751 s ±  0.061 s    [User: 1.030 s, System: 0.363 s]
  Range (min … max):    1.616 s …  1.853 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.789000 msec
Total Max:     15.141000 msec
Total Min:     11.200000 msec
```

## 2024.01.15

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 208.326300 msec
Total Max:     266.742000 msec
Total Min:     171.481000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     144.0 ms ±   5.6 ms    [User: 121.8 ms, System: 28.5 ms]
  Range (min … max):   138.9 ms … 172.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.710 s ±  0.104 s    [User: 1.041 s, System: 0.369 s]
  Range (min … max):    1.583 s …  2.188 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 12.732600 msec
Total Max:     23.433000 msec
Total Min:     10.967000 msec
```

## 2024.01.12

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 437.824000 msec
Total Max:     623.183000 msec
Total Min:     262.725000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     144.7 ms ±   5.7 ms    [User: 125.0 ms, System: 26.2 ms]
  Range (min … max):   133.1 ms … 163.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.912 s ±  0.348 s    [User: 1.099 s, System: 0.369 s]
  Range (min … max):    1.702 s …  3.407 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.695100 msec
Total Max:     12.989000 msec
Total Min:     11.010000 msec
```

## 2024.01.11

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 357.263400 msec
Total Max:     1021.567000 msec
Total Min:     208.194000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     215.4 ms ±  11.1 ms    [User: 181.2 ms, System: 39.1 ms]
  Range (min … max):   203.9 ms … 254.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.904 s ±  0.789 s    [User: 1.050 s, System: 0.360 s]
  Range (min … max):    1.519 s …  5.845 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 14.282500 msec
Total Max:     28.286000 msec
Total Min:     11.400000 msec
```

## 2024.01.10

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 210.435500 msec
Total Max:     233.166000 msec
Total Min:     176.221000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     133.8 ms ±   5.9 ms    [User: 113.0 ms, System: 26.5 ms]
  Range (min … max):   128.1 ms … 167.4 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.838 s ±  0.383 s    [User: 1.147 s, System: 0.372 s]
  Range (min … max):    1.609 s …  3.346 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.552700 msec
Total Max:     12.007000 msec
Total Min:     11.240000 msec
```

## 2024.01.09

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 181.228600 msec
Total Max:     208.208000 msec
Total Min:     166.895000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     315.0 ms ±  14.9 ms    [User: 297.8 ms, System: 47.8 ms]
  Range (min … max):   298.8 ms … 398.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.751 s ±  0.416 s    [User: 1.023 s, System: 0.337 s]
  Range (min … max):    1.456 s …  3.883 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpath vim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.803400 msec
Total Max:     12.658000 msec
Total Min:     11.134000 msec
```

## 2023.12.28

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 200.078500 msec
Total Max:     223.230000 msec
Total Min:     186.470000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     309.5 ms ±   5.8 ms    [User: 296.3 ms, System: 44.3 ms]
  Range (min … max):   300.4 ms … 322.9 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.637 s ±  0.046 s    [User: 0.994 s, System: 0.312 s]
  Range (min … max):    1.529 s …  1.748 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 11.739300 msec
Total Max:     12.436000 msec
Total Min:     11.270000 msec
```

## 2023.12.26

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 185.887700 msec
Total Max:     207.359000 msec
Total Min:     170.473000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     308.2 ms ±   8.3 ms    [User: 295.7 ms, System: 42.7 ms]
  Range (min … max):   294.9 ms … 335.3 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.525 s ±  0.042 s    [User: 0.964 s, System: 0.309 s]
  Range (min … max):    1.450 s …  1.621 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 23.399600 msec
Total Max:     133.217000 msec
Total Min:     10.941000 msec
```

## 2023.12.22

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 462.390000 msec
Total Max:     988.875000 msec
Total Min:     228.515000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     371.8 ms ± 138.7 ms    [User: 324.2 ms, System: 67.6 ms]
  Range (min … max):   300.8 ms … 1049.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      3.799 s ±  3.559 s    [User: 1.803 s, System: 1.488 s]
  Range (min … max):    1.831 s … 20.645 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 146.628300 msec
Total Max:     150.607000 msec
Total Min:     143.920000 msec
```

## 2023.12.21

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 195.832300 msec
Total Max:     235.462000 msec
Total Min:     177.146000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):     313.8 ms ±   8.3 ms    [User: 300.0 ms, System: 44.5 ms]
  Range (min … max):   300.4 ms … 332.9 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.711 s ±  0.084 s    [User: 1.006 s, System: 0.320 s]
  Range (min … max):    1.536 s …  2.027 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 139.227000 msec
Total Max:     143.756000 msec
Total Min:     135.102000 msec
```

## 2023.12.20

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 277.741700 msec
Total Max:     337.722000 msec
Total Min:     198.919000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      66.4 ms ±  18.1 ms    [User: 53.4 ms, System: 21.0 ms]
  Range (min … max):    56.5 ms … 172.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.973 s ±  0.438 s    [User: 1.195 s, System: 0.378 s]
  Range (min … max):    1.650 s …  3.564 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 553.134700 msec
Total Max:     2697.842000 msec
Total Min:     143.286000 msec
```

## 2023.12.18

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 217.407900 msec
Total Max:     300.086000 msec
Total Min:     199.995000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      59.7 ms ±   1.7 ms    [User: 51.0 ms, System: 14.5 ms]
  Range (min … max):    57.2 ms …  64.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.804 s ±  0.471 s    [User: 1.074 s, System: 0.354 s]
  Range (min … max):    1.461 s …  4.222 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 161.382700 msec
Total Max:     192.607000 msec
Total Min:     142.369000 msec
```

## 2023.12.15

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 173.972500 msec
Total Max:     190.943000 msec
Total Min:     164.604000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      61.1 ms ±   4.8 ms    [User: 47.6 ms, System: 19.0 ms]
  Range (min … max):    56.8 ms …  84.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.544 s ±  0.046 s    [User: 0.973 s, System: 0.305 s]
  Range (min … max):    1.448 s …  1.700 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 137.591900 msec
Total Max:     139.031000 msec
Total Min:     136.757000 msec
```

## 2023.12.14

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 90.153900 msec
Total Max:     121.525000 msec
Total Min:     80.383000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      59.4 ms ±   2.3 ms    [User: 46.5 ms, System: 19.1 ms]
  Range (min … max):    55.4 ms …  68.4 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.125 s ±  0.149 s    [User: 1.080 s, System: 0.335 s]
  Range (min … max):    1.971 s …  2.921 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 150.421700 msec
Total Max:     158.381000 msec
Total Min:     143.722000 msec
```

## 2023.12.13

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 101.166300 msec
Total Max:     177.412000 msec
Total Min:     83.614000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      66.5 ms ±   6.3 ms    [User: 52.7 ms, System: 21.0 ms]
  Range (min … max):    59.5 ms …  92.4 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.836 s ±  0.058 s    [User: 1.063 s, System: 0.330 s]
  Range (min … max):    1.664 s …  1.955 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 152.389700 msec
Total Max:     162.847000 msec
Total Min:     146.047000 msec
```

## 2023.12.12

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 96.397900 msec
Total Max:     132.296000 msec
Total Min:     80.132000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      63.8 ms ±   3.3 ms    [User: 52.5 ms, System: 18.9 ms]
  Range (min … max):    58.3 ms …  72.3 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.733 s ±  0.159 s    [User: 1.071 s, System: 0.328 s]
  Range (min … max):    1.563 s …  2.677 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 150.424400 msec
Total Max:     161.215000 msec
Total Min:     143.137000 msec
```

## 2023.12.11

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 87.284400 msec
Total Max:     134.981000 msec
Total Min:     76.851000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      60.1 ms ±   2.2 ms    [User: 50.3 ms, System: 16.0 ms]
  Range (min … max):    55.8 ms …  69.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.656 s ±  0.053 s    [User: 0.983 s, System: 0.314 s]
  Range (min … max):    1.520 s …  1.809 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 137.127700 msec
Total Max:     144.511000 msec
Total Min:     133.649000 msec
```

## 2023.12.08

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 83.638100 msec
Total Max:     96.773000 msec
Total Min:     74.377000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      59.9 ms ±   2.1 ms    [User: 48.9 ms, System: 16.8 ms]
  Range (min … max):    56.1 ms …  66.9 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.611 s ±  0.049 s    [User: 0.996 s, System: 0.315 s]
  Range (min … max):    1.496 s …  1.741 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 139.167900 msec
Total Max:     143.705000 msec
Total Min:     136.056000 msec
```

## 2023.12.06

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 42.910200 msec
Total Max:     48.511000 msec
Total Min:     38.627000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      60.3 ms ±   4.6 ms    [User: 50.1 ms, System: 17.1 ms]
  Range (min … max):    54.8 ms …  83.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.344 s ±  0.319 s    [User: 1.207 s, System: 0.369 s]
  Range (min … max):    1.990 s …  3.391 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 141.902300 msec
Total Max:     146.923000 msec
Total Min:     136.786000 msec
```

## 2023.12.05

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 43.842700 msec
Total Max:     53.451000 msec
Total Min:     36.715000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      59.7 ms ±   2.1 ms    [User: 50.9 ms, System: 15.3 ms]
  Range (min … max):    55.6 ms …  65.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.927 s ±  0.072 s    [User: 1.025 s, System: 0.327 s]
  Range (min … max):    1.769 s …  2.067 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 143.678300 msec
Total Max:     151.521000 msec
Total Min:     138.091000 msec
```

## 2023.12.04

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 61.609800 msec
Total Max:     124.210000 msec
Total Min:     38.353000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      62.4 ms ±   9.5 ms    [User: 52.4 ms, System: 16.6 ms]
  Range (min … max):    56.4 ms … 119.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.302 s ±  1.337 s    [User: 1.134 s, System: 0.370 s]
  Range (min … max):    1.753 s … 10.246 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 156.157300 msec
Total Max:     240.268000 msec
Total Min:     139.855000 msec
```

## 2023.12.01

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 48.968700 msec
Total Max:     68.214000 msec
Total Min:     37.335000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      58.5 ms ±   8.9 ms    [User: 47.4 ms, System: 17.5 ms]
  Range (min … max):    48.8 ms … 105.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.006 s ±  0.830 s    [User: 1.082 s, System: 0.410 s]
  Range (min … max):    1.639 s …  6.276 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 149.420100 msec
Total Max:     174.720000 msec
Total Min:     138.249000 msec
```

## 2023.11.29

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 36.095600 msec
Total Max:     39.164000 msec
Total Min:     32.818000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      31.8 ms ±   7.6 ms    [User: 20.1 ms, System: 6.8 ms]
  Range (min … max):    27.4 ms …  67.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.558 s ±  0.170 s    [User: 0.965 s, System: 0.311 s]
  Range (min … max):    1.441 s …  2.700 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 139.927000 msec
Total Max:     157.097000 msec
Total Min:     134.086000 msec
```

## 2023.11.28

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 39.506900 msec
Total Max:     47.820000 msec
Total Min:     35.513000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      31.6 ms ±   2.7 ms    [User: 20.3 ms, System: 7.8 ms]
  Range (min … max):    29.1 ms …  49.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.906 s ±  0.593 s    [User: 1.041 s, System: 0.324 s]
  Range (min … max):    1.679 s …  5.860 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 143.407100 msec
Total Max:     150.645000 msec
Total Min:     134.579000 msec
```

## 2023.11.27

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.141800 msec
Total Max:     57.143000 msec
Total Min:     37.748000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      34.2 ms ±  12.1 ms    [User: 23.4 ms, System: 5.5 ms]
  Range (min … max):    28.3 ms … 105.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.749 s ±  0.077 s    [User: 0.992 s, System: 0.329 s]
  Range (min … max):    1.625 s …  2.039 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 139.773300 msec
Total Max:     145.616000 msec
Total Min:     133.187000 msec
```

## 2023.11.22

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.230300 msec
Total Max:     49.589000 msec
Total Min:     34.876000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      29.3 ms ±   2.5 ms    [User: 19.9 ms, System: 6.1 ms]
  Range (min … max):    26.6 ms …  46.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.582 s ±  0.050 s    [User: 0.977 s, System: 0.304 s]
  Range (min … max):    1.466 s …  1.700 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 138.664900 msec
Total Max:     141.168000 msec
Total Min:     136.025000 msec
```

## 2023.11.21

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 39.310600 msec
Total Max:     53.550000 msec
Total Min:     34.376000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      30.0 ms ±   0.7 ms    [User: 21.9 ms, System: 4.7 ms]
  Range (min … max):    29.1 ms …  32.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.752 s ±  0.199 s    [User: 1.103 s, System: 0.337 s]
  Range (min … max):    1.540 s …  2.603 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 150.765000 msec
Total Max:     162.455000 msec
Total Min:     141.386000 msec
```

## 2023.11.20

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 39.718700 msec
Total Max:     50.530000 msec
Total Min:     35.900000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      29.6 ms ±   2.9 ms    [User: 20.6 ms, System: 5.7 ms]
  Range (min … max):    26.6 ms …  48.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.876 s ±  0.049 s    [User: 1.068 s, System: 0.316 s]
  Range (min … max):    1.782 s …  1.982 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 140.754600 msec
Total Max:     151.810000 msec
Total Min:     137.359000 msec
```

## 2023.11.16

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 38.223700 msec
Total Max:     44.052000 msec
Total Min:     34.513000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      31.8 ms ±   6.1 ms    [User: 22.6 ms, System: 5.6 ms]
  Range (min … max):    28.1 ms …  68.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.719 s ±  0.042 s    [User: 1.084 s, System: 0.352 s]
  Range (min … max):    1.651 s …  1.849 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 142.800200 msec
Total Max:     169.458000 msec
Total Min:     136.012000 msec
```

## 2023.11.15

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 33.817900 msec
Total Max:     35.745000 msec
Total Min:     32.203000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      29.8 ms ±   2.1 ms    [User: 19.5 ms, System: 6.7 ms]
  Range (min … max):    28.5 ms …  44.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.699 s ±  0.087 s    [User: 1.116 s, System: 0.356 s]
  Range (min … max):    1.550 s …  1.943 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 140.936300 msec
Total Max:     146.650000 msec
Total Min:     133.685000 msec
```

## 2023.11.14

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 38.257600 msec
Total Max:     52.417000 msec
Total Min:     34.631000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      31.1 ms ±   0.9 ms    [User: 22.1 ms, System: 5.7 ms]
  Range (min … max):    28.8 ms …  34.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.777 s ±  0.061 s    [User: 1.086 s, System: 0.360 s]
  Range (min … max):    1.669 s …  1.956 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 143.561900 msec
Total Max:     148.177000 msec
Total Min:     140.216000 msec
```

## 2023.11.10

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 34.627300 msec
Total Max:     36.849000 msec
Total Min:     33.411000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      30.7 ms ±   4.3 ms    [User: 20.4 ms, System: 6.8 ms]
  Range (min … max):    27.5 ms …  58.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.778 s ±  0.116 s    [User: 1.175 s, System: 0.360 s]
  Range (min … max):    1.657 s …  2.345 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 140.040700 msec
Total Max:     159.753000 msec
Total Min:     133.338000 msec
```

## 2023.11.09

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.077900 msec
Total Max:     47.694000 msec
Total Min:     38.988000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      29.9 ms ±   1.4 ms    [User: 21.7 ms, System: 5.4 ms]
  Range (min … max):    26.6 ms …  34.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.503 s ±  0.240 s    [User: 1.356 s, System: 0.396 s]
  Range (min … max):    2.234 s …  3.400 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 156.712300 msec
Total Max:     175.475000 msec
Total Min:     136.531000 msec
```

## 2023.11.08

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.970600 msec
Total Max:     55.551000 msec
Total Min:     37.410000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      39.2 ms ±  33.5 ms    [User: 22.5 ms, System: 8.1 ms]
  Range (min … max):    24.7 ms … 173.3 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.502 s ±  0.266 s    [User: 1.374 s, System: 0.421 s]
  Range (min … max):    2.333 s …  4.217 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 197.816800 msec
Total Max:     532.494000 msec
Total Min:     144.628000 msec
```

## 2023.11.07

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 38.822000 msec
Total Max:     41.877000 msec
Total Min:     36.335000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      41.7 ms ±   2.8 ms    [User: 29.1 ms, System: 8.9 ms]
  Range (min … max):    35.2 ms …  52.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.001 s ±  0.095 s    [User: 1.292 s, System: 0.382 s]
  Range (min … max):    1.811 s …  2.325 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 148.475400 msec
Total Max:     175.670000 msec
Total Min:     139.633000 msec
```

## 2023.11.06

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 39.114000 msec
Total Max:     41.180000 msec
Total Min:     36.775000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      42.1 ms ±   7.0 ms    [User: 25.5 ms, System: 12.0 ms]
  Range (min … max):    35.7 ms …  74.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.238 s ±  0.406 s    [User: 1.319 s, System: 0.444 s]
  Range (min … max):    1.887 s …  4.484 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 148.573000 msec
Total Max:     162.286000 msec
Total Min:     141.451000 msec
```

## 2023.11.02

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 40.035300 msec
Total Max:     43.529000 msec
Total Min:     37.988000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      66.1 ms ±  75.3 ms    [User: 27.0 ms, System: 21.5 ms]
  Range (min … max):    36.4 ms … 388.5 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.016 s ±  0.167 s    [User: 1.283 s, System: 0.434 s]
  Range (min … max):    1.862 s …  2.964 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 143.411800 msec
Total Max:     155.691000 msec
Total Min:     134.919000 msec
```

## 2023.11.01

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 36.502500 msec
Total Max:     39.015000 msec
Total Min:     34.890000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      45.3 ms ±  37.2 ms    [User: 24.5 ms, System: 11.4 ms]
  Range (min … max):    34.4 ms … 295.4 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.788 s ±  0.052 s    [User: 1.194 s, System: 0.373 s]
  Range (min … max):    1.671 s …  1.926 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 134.787500 msec
Total Max:     144.661000 msec
Total Min:     127.683000 msec
```

## 2023.10.31

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 36.273000 msec
Total Max:     37.573000 msec
Total Min:     35.056000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      40.2 ms ±  13.5 ms    [User: 24.1 ms, System: 9.8 ms]
  Range (min … max):    33.2 ms … 125.9 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.890 s ±  0.124 s    [User: 1.225 s, System: 0.386 s]
  Range (min … max):    1.761 s …  2.539 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 133.859700 msec
Total Max:     139.284000 msec
Total Min:     127.739000 msec
```

## 2023.10.27

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 34.394200 msec
Total Max:     35.988000 msec
Total Min:     32.969000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      39.5 ms ±   2.1 ms    [User: 25.1 ms, System: 10.0 ms]
  Range (min … max):    35.2 ms …  45.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.696 s ±  0.082 s    [User: 1.092 s, System: 0.382 s]
  Range (min … max):    1.547 s …  1.960 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 133.184400 msec
Total Max:     143.363000 msec
Total Min:     128.442000 msec
```

## 2023.10.26

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.618300 msec
Total Max:     45.364000 msec
Total Min:     38.917000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      47.6 ms ±  21.2 ms    [User: 24.4 ms, System: 17.9 ms]
  Range (min … max):    37.0 ms … 171.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      2.380 s ±  1.417 s    [User: 1.373 s, System: 0.590 s]
  Range (min … max):    1.642 s …  7.944 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 146.606600 msec
Total Max:     174.412000 msec
Total Min:     129.595000 msec
```

## 2023.10.24

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 44.175900 msec
Total Max:     52.723000 msec
Total Min:     41.304000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      48.2 ms ±  20.6 ms    [User: 26.4 ms, System: 15.2 ms]
  Range (min … max):    35.3 ms … 162.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.876 s ±  0.285 s    [User: 1.197 s, System: 0.359 s]
  Range (min … max):    1.711 s …  3.706 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 137.973700 msec
Total Max:     146.434000 msec
Total Min:     131.871000 msec
```

## 2023.10.23

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 41.800200 msec
Total Max:     54.974000 msec
Total Min:     37.110000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      40.1 ms ±   5.3 ms    [User: 23.8 ms, System: 10.0 ms]
  Range (min … max):    34.9 ms …  62.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.637 s ±  0.068 s    [User: 1.077 s, System: 0.340 s]
  Range (min … max):    1.548 s …  1.938 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 127.722100 msec
Total Max:     132.158000 msec
Total Min:     124.674000 msec
```

## 2023.10.20

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 38.212600 msec
Total Max:     40.415000 msec
Total Min:     35.830000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      57.3 ms ±  69.1 ms    [User: 26.3 ms, System: 12.5 ms]
  Range (min … max):    34.9 ms … 466.2 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.588 s ±  0.062 s    [User: 1.132 s, System: 0.328 s]
  Range (min … max):    1.480 s …  1.786 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 136.478800 msec
Total Max:     143.186000 msec
Total Min:     132.980000 msec
```

## 2023.10.18

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 61.252700 msec
Total Max:     123.166000 msec
Total Min:     35.510000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      95.2 ms ±  63.0 ms    [User: 30.2 ms, System: 22.3 ms]
  Range (min … max):    36.1 ms … 287.8 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.494 s ±  0.100 s    [User: 1.092 s, System: 0.384 s]
  Range (min … max):    1.341 s …  1.771 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 135.704400 msec
Total Max:     175.452000 msec
Total Min:     125.516000 msec
```

## 2023.10.17

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 34.366500 msec
Total Max:     37.804000 msec
Total Min:     32.240000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      40.7 ms ±  10.8 ms    [User: 22.0 ms, System: 12.1 ms]
  Range (min … max):    33.0 ms …  98.1 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.336 s ±  0.047 s    [User: 1.050 s, System: 0.313 s]
  Range (min … max):    1.245 s …  1.512 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 126.049900 msec
Total Max:     128.893000 msec
Total Min:     123.275000 msec
```

## 2023.10.16

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 33.939800 msec
Total Max:     35.389000 msec
Total Min:     32.380000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      45.4 ms ±  40.3 ms    [User: 24.6 ms, System: 9.5 ms]
  Range (min … max):    36.2 ms … 320.0 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.380 s ±  0.040 s    [User: 1.084 s, System: 0.336 s]
  Range (min … max):    1.292 s …  1.472 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 133.842200 msec
Total Max:     144.355000 msec
Total Min:     129.815000 msec
```

## 2023.10.12

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 37.577200 msec
Total Max:     58.024000 msec
Total Min:     32.470000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      49.4 ms ±  25.7 ms    [User: 27.9 ms, System: 11.9 ms]
  Range (min … max):    32.5 ms … 167.6 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.468 s ±  0.079 s    [User: 1.140 s, System: 0.345 s]
  Range (min … max):    1.336 s …  1.831 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 145.150300 msec
Total Max:     176.512000 msec
Total Min:     134.615000 msec
```

## 2023.10.11

### Neovim

```shell
❯ vim-startuptime -vimpath nvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 34.598100 msec
Total Max:     39.326000 msec
Total Min:     32.921000 msec
```

### Fish-shell

```shell
❯ hyperfine -w 5 -r 50 "fish -i -c exit"
Benchmark 1: fish -i -c exit
  Time (mean ± σ):      37.2 ms ±   3.4 ms    [User: 24.3 ms, System: 7.8 ms]
  Range (min … max):    32.6 ms …  53.7 ms    50 runs
 
```

### PowerShell Core(Linux) (pwsh)

```powershell
❯ hyperfine -w 5 -r 50 pwsh -i -c exit"
Benchmark 1: pwsh -i -c exit
  Time (mean ± σ):      1.980 s ±  1.016 s    [User: 1.383 s, System: 0.339 s]
  Range (min … max):    1.474 s …  6.166 s    50 runs
 
```

### Paleovim(vim)

```shell
❯ vim-startuptime -vimpathvim | head -n 6
Extra options: []
Measured: 10 times

Total Average: 140.680900 msec
Total Max:     151.638000 msec
Total Min:     135.900000 msec
```

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

### PowerShell Core(Linux) (pwsh)

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

### PowerShell Core(Linux) (pwsh)

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

### PowerShell Core(Linux) (pwsh)

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

### PowerShell Core(Linux) (pwsh)

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

### PowerShell Core(Linux) (pwsh)

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

### PowerShell Core(Linux) (pwsh)

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

