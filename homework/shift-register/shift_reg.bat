call C:\Xilinx\Vivado\2020.1\settings64.bat
call xvlog -sv -nolog shift_reg_test.sv shift_reg.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s shift_reg -nolog -debug all shift_reg_test
del *.jou,*.log
rem call xsim shift_reg -gui