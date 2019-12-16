call C:\Xilinx\Vivado\2019.1\settings64.bat
call xvlog -sv -nolog timer_switch.sv timer_switch_test_1.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s timer_switch_test_1 -nolog -debug all timer_switch_test_1
del *.jou,*.log
if ERRORLEVEL 1 (
  exit
)
rem call xsim timer_switch_test_1 -gui