call %XILINX_SET%
call xvlog -sv -nolog example_fork.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s example_fork -nolog -debug all example_fork
del *.jou,*.log
rem call xsim counter -gui
