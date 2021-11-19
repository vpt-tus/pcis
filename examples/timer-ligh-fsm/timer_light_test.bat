call %XILINX_SET%
call xvlog -sv -nolog timer_light.sv timer_light_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s timer_light_test -nolog -debug all timer_light_test
del *.jou,*.log
if ERRORLEVEL 1 (
  exit
)
rem call xsim timer_light_test -gui
