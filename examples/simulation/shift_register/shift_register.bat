call C:\Xilinx\Vivado\2018.2\settings64.bat
call xvlog -sv -nolog shift_register.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s shift_register -nolog -debug all shift_register_test_1
rem call xsim run_1 -gui