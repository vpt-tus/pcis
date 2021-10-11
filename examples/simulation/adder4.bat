call %XILINX_SET%
call xvlog -sv -nolog adder4.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s adder4_test -nolog -debug all adder4_test
del *.jou,*.log
rem call xsim adder4_test -gui
