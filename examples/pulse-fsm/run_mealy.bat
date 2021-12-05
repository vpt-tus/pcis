call %XILINX_SET%
call xvlog -sv -nolog pulse_fsm_mealy.sv pulse_fsm_mealy_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s pulse_fsm_mealy_test -nolog -debug all pulse_fsm_mealy_test
del *.jou,*.log
rem call xsim pulse_fsm_mealy_test -gui
