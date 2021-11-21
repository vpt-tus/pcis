call %XILINX_SET%
call xvlog -sv -nolog tlight_v1.sv tlight_v1_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s tlight_v1_test -nolog -debug all tlight_v1_test
del *.jou,*.log
call xsim tlight_v1_test -gui
