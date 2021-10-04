call %XILINX_SET%
call xvlog -sv -nolog alu_definitions.sv, alu.sv, alu_test.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s alu -nolog -debug all alu_test
del *.jou,*.log
rem call xsim alu -gui
