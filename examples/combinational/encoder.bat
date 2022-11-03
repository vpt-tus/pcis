call %XILINX_SET%
call xvlog -sv -nolog encoder.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s encoder -nolog -debug all encoder_test
del *.jou,*.log
rem call xsim encoder -gui
