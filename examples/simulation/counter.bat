call C:\Xilinx\Vivado\2018.2\settings64.bat
call xvlog -sv -nolog counter.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s counter -nolog -debug all counter_test_1
rem call xsim counter -gui