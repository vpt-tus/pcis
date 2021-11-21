call %XILINX_SET%
call xvlog -sv -nolog tlight_package.sv tlight_v2.sv tlight_v2_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s tlight_v2_test -nolog -debug all tlight_v2_test
del *.jou,*.log
rem call xsim tlight_test -gui
