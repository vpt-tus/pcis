call C:\Xilinx\Vivado\2018.2\settings64.bat
call xvlog -sv -nolog bcd_adder.sv
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s bcd_adder -nolog -debug all bcd_adder_test
del *.jou,*.log
rem call xsim bcd_adder -gui