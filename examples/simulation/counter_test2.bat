call %XILINX_SET%
call xvlog -sv -nolog counter.sv counter_test2.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s counter -nolog -debug all counter_test_2
del *.jou,*.log
rem call xsim counter -gui
