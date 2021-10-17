call %XILINX_SET%
call xvlog -sv -nolog decoder.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s decoder -nolog -debug all decoder_test_2
del *.jou,*.log
rem call xsim decoder -gui
