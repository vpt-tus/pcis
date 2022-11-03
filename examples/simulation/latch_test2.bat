call %XILINX_SET%
call xvlog -sv -nolog latch.sv latch_test2.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s latch -nolog -debug all latch_test2
del *.jou,*.log
rem call xsim latch -gui
