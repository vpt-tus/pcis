call C:\Xilinx\Vivado\2019.1\settings64.bat
call xvlog -sv -nolog decoder.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s decoder -nolog -debug all decoder_test_1
del *.jou,*.log
rem call xsim decoder -gui