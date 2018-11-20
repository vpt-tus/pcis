call C:\Xilinx\Vivado\2018.2\settings64.bat
call xvlog -sv -nolog bcd_adder.sv, bcd_adder_3d.sv
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s bcd_adder_3d -nolog -debug all bcd_adder_3d_test
del *.jou,*.log
rem call xsim bcd_adder_3d -gui