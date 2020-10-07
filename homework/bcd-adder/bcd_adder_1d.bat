call C:\Xilinx\Vivado\2020.1\settings64.bat
call xvlog -sv -nolog bcd_pkg.sv bcd_adder_1d.sv bcd_adder_1d_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s bcd bcd_adder_1d -nolog -debug all bcd_adder_1d_test
del *.jou,*.log
rem call xsim bcd_adder -gui