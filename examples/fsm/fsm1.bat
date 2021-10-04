call %XILINX_SET%
call xvlog -sv -nolog fsm1.sv fsm1_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s fsm1 -nolog -debug all fsm1_test
del *.jou,*.log
rem call xsim fsm1 -gui
