call C:\Xilinx\Vivado\2020.1\settings64.bat
call xvlog -sv -nolog counter_dec.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s counter_dec -nolog -debug all counter_dec_test_1
del *.jou,*.log
rem call xsim counter -gui