call %XILINX_SET%
call xvlog -sv -nolog shift_register.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s shift_register -nolog -debug all shift_register_test_1
del *.jou,*.log
rem call xsim shift_register -gui
