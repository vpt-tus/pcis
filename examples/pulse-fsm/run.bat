call %XILINX_SET%
call xvlog -sv -nolog pulse_fsm.sv pulse_fsm_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s pulse_fsm_test -nolog -debug all pulse_fsm_test
del *.jou,*.log
call xsim pulse_fsm_test -gui
