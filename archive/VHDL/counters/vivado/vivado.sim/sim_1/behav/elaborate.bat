@echo off
set xv_path=C:\\Xilinx\\Vivado\\2014.4\\bin
call %xv_path%/xelab  -wto 964f0534158942b5a0132de4e29e0e74 -m64 --debug typical --relax -L xil_defaultlib -L secureip --snapshot counter_8bit_test_behav xil_defaultlib.counter_8bit_test -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
