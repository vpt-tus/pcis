call %XILINX_SET%
call xvlog -sv -nolog latch.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s latch -nolog -debug all latch_test1
del *.jou,*.log
rem call xsim latch -gui
