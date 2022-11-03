call %XILINX_SET%
call xvlog -sv -nolog flip_flop.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s flip_flop -nolog -debug all flip_flop_test1
del *.jou,*.log
rem call xsim flip_flop -gui
