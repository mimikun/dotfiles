# Startuptime memo

This is Work-PC startuptime memo

- Neovim
- Fish-shell
- PowerShell Core(Linux) (pwsh)
- Paleovim(vim)

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

