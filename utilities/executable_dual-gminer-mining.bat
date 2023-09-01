REM Mining Mode IN!
REM gsudo nvidia-smi -pl 150
gsudo nvidia-smi -pl 250
gsudo nvidia-smi -lgc 1800
REM Mining start!!
miner.exe ^
--api 10050 ^
--algo ethash ^
--server asia.cruxpool.com:5555 ^
--user 0xDBe9A0825BBB14D4aDc4e81a298D8B0cBB625596 ^
--dalgo ton ^
--dserver ton.hk.hashrate.to:4003 ^
--duser EQDspZaSv1XI_0HVajVk5wNzZn5SKu6SmSNKVt3SL-neMvaG ^
--templimit 75
REM --dserver wss://pplns.toncoinpool.io/stratum
REM GAMING MODE IN!!!
gsudo nvidia-smi -pl 250
gsudo nvidia-smi -rgc
pause
