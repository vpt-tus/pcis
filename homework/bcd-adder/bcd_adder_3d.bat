call %XILINX_SET%
call xvlog -sv -nolog bcd_pkg.sv, bcd_adder_1d.sv, bcd_adder_3d.sv, bcd_adder_3d_test.sv
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s bcd bcd_adder_3d -nolog -debug all bcd_adder_3d_test
del *.jou,*.log
rem call xsim bcd_adder_3d -gui
