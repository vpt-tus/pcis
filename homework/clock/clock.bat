call %XILINX_SET%
call xvlog -sv -nolog clock_test.sv clock.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s clock -nolog -debug all clock_test
del *.jou,*.log
rem call xsim clock -gui
