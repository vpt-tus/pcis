call %XILINX_SET%
call xvlog -sv -nolog pulse_fsm_moore.sv pulse_fsm_moore_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s pulse_fsm_moore_test -nolog -debug all pulse_fsm_moore_test
del *.jou,*.log
call xsim pulse_fsm_moore_test -gui
