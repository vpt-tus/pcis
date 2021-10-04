call %XILINX_SET%
call xvlog -sv -nolog tilda_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s tilda_test -nolog -debug all tilda_test
del *.jou,*.log
rem call xsim tilda_test -gui
