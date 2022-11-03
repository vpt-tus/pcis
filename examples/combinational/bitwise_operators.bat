call %XILINX_SET%
call xvlog -sv -nolog bitwise_operators.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s bitwise_operators -nolog -debug all bitwise_operators_test
del *.jou,*.log
rem call xsim bitwise_operators -gui
