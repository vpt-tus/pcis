call %XILINX_SET%
call xvlog -sv -nolog reduction.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s reduction -nolog -debug all reduction_test
del *.jou,*.log
rem call xsim reduction -gui
