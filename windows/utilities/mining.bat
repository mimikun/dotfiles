@echo off
cd /d %~dp0

REM variables
set NICEHASH_ADDRESS=NHbVXU3BvmEis6YqssanKDHpc9CKtkPyiddo
set GPU_MAX_TEMP_MINING_SOFTWARE=75
set DEVICES=hoge

REM Mining Mode IN!
gsudo nvidia-smi -pl 150

REM Mining start!!
miner.exe ^
--algo ergo ^
--server stratum+tcp://autolykos.auto.nicehash.com:9200 ^
--user %NICEHASH_ADDRESS%.worker ^
--templimit %GPU_MAX_TEMP_MINING_SOFTWARE% ^
--watchdog 0 ^
--devices %DEVICES% ^
--dalgo kheavyhash ^
--dserver stratum+tcp://kheavyhash.auto.nicehash.com:9200 ^
--duser %NICEHASH_ADDRESS%.worker ^
--api 10050

REM GAMING MODE IN!!!
gsudo nvidia-smi -pl 250

pause


