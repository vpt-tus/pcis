call %XILINX_SET%
call xvlog -sv -nolog fsm_cc4_2.sv fsm_cc4_2_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s fsm_cc4_2 -nolog -debug all fsm_cc4_2_test
del *.jou,*.log
rem call xsim fsm_cc4_2 -gui
