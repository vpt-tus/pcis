call C:\Xilinx\Vivado\2018.2\settings64.bat
call xvlog -sv -nolog counter.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s run_1 -nolog -debug all work.counter_test_v1
rem call xsim run_1 -gui