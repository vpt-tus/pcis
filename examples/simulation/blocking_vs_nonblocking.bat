call %XILINX_SET%
call xvlog -sv -nolog blocking_vs_nonblocking.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s blocking_vs_nonblocking -nolog -debug all blocking_vs_nonblocking_test
del *.jou,*.log
rem call xsim blocking_vs_nonblocking -gui
