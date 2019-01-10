@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 90b38a8267074ccfa3e6b3f945cf1799 -m64 --debug typical --relax -L xil_defaultlib -L secureip --snapshot priority_encoder_test_behav xil_defaultlib.priority_encoder_test -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
