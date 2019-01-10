@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto d1170346f38641b58896d1b68a80ecd2 -m64 --debug typical --relax -L xil_defaultlib -L secureip --snapshot fibo_tb_behav xil_defaultlib.fibo_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
