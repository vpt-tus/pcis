call %XILINX_SET%
call xvlog -sv -nolog clk_div_test.sv clk_div.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s clk_div_test -nolog -debug all clk_div_test
del *.jou,*.log
rem call xsim clk_div_test -gui
