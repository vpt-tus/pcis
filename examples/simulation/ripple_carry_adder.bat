call %XILINX_SET%
call xvlog -sv -nolog ripple_carry_adder.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s ripple_carry_adder -nolog -debug all ripple_carry_adder_test_1
rem call xsim ripple_carry_adder -gui
