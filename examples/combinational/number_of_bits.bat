call %XILINX_SET%
call xvlog -sv -nolog number_of_bits.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s number_of_bits -nolog -debug all number_of_bits
del *.jou,*.log
