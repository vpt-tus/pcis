@echo off
set xv_path=C:\\Xilinx\\Vivado\\2015.1\\bin
call %xv_path%/xelab  -wto de5b8168d0134b1f9f5e30162a5f74d6 -m64 --debug typical --relax --mt 2 -L xil_defaultlib -L secureip --snapshot johnson_tb_behav xil_defaultlib.johnson_tb -log elaborate.log
if "%errorlevel%"=="0" goto SUCCESS
if "%errorlevel%"=="1" goto END
:END
exit 1
:SUCCESS
exit 0
