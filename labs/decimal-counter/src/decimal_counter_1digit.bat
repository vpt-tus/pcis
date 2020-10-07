call C:\Xilinx\Vivado\2020.1\settings64.bat
call xvlog -sv -nolog decimal_counter_1digit.sv decimal_counter_1digit_test.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s decimal_counter decimal_counter_1digit -nolog -debug all decimal_counter_1digit_test
rem call xsim decimal_counter_1digit -gui
del *.jou,*.log,*.wdb,*.pb
