call %XILINX_SET%
call xvlog -sv -nolog fsm1_reg.sv fsm1_reg_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s fsm1_reg -nolog -debug all fsm1_reg_test
del *.jou,*.log
rem call xsim fsm1_reg -gui
