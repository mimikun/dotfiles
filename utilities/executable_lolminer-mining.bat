REM Mining Mode IN!
REM lock clock hz
gsudo nvidia-smi -lgc 1800
REM gsudo nvidia-smi -pl 150
REM gsudo nvidia-smi -pl 250

REM Mining start!!
lolMiner.exe ^
--algo ETHASH ^
--pool asia.cruxpool.com:5555 ^
--user 0xDBe9A0825BBB14D4aDc4e81a298D8B0cBB625596 ^
--dualmode TONDUAL ^
--dualpool wss://pplns.toncoinpool.io/stratum ^
--dualuser EQDspZaSv1XI_0HVajVk5wNzZn5SKu6SmSNKVt3SL-neMvaG ^
--watchdog exit
rem i want temp limit
rem --templimit 75

REM GAMING MODE IN!!!
REM reset clock hz
gsudo nvidia-smi -rgc
REM gsudo nvidia-smi -pl 250
pause