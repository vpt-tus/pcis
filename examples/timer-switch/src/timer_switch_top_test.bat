call %XILINX_SET%
call xvlog -sv -nolog timer_switch.sv timer_switch_top.sv single_shot.sv timer_switch_top_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s timer_switch_top_test -nolog -debug all timer_switch_top_test
del *.jou,*.log
if ERRORLEVEL 1 (
  exit
)
rem call xsim timer_switch_top_test -gui
