call %XILINX_SET%
call xvlog -sv -nolog counter.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s counter -nolog -debug all counter_test_1
del *.jou,*.log
rem call xsim counter -gui
