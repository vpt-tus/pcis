call %XILINX_SET%
call xvlog -sv -nolog gray2bin.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s gray2bin -nolog -debug all gray2bin_test_1
rem call xsim gray2bin -gui
