call %XILINX_SET%
call xvlog -sv -nolog comparator.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s comparator -nolog -debug all comparator_test_1
del *.jou,*.log
rem call xsim comparator -gui
