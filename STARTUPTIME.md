# Startuptime memo

This is Work-PC startuptime memo

- Neovim
- Fish-shell
- PowerShell Core(Linux) (pwsh)
- Paleovim(vim)

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

