call %XILINX_SET%
call xvlog -sv -nolog mux_4x1.sv mux_4x1_test.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s mux_4x1 -nolog -debug all mux_4x1_test
del *.jou,*.log
rem call xsim mux_4x1 -gui
