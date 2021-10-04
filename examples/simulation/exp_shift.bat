call %XILINX_SET%
call xvlog -sv -nolog exp_shift.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s exp_shift -nolog -debug all exp_shift_test_1
del *.jou,*.log
rem call xsim exp_shift -gui
