call C:\Xilinx\Vivado\2019.1\settings64.bat
call xvlog -sv -nolog logical_operators.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s logical_operators -nolog -debug all logical_operators_test
del *.jou,*.log
rem call xsim logical_operators -gui