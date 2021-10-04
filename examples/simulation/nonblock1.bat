call %XILINX_SET%
call xvlog -sv -nolog nonblock1.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s nonblock1 -nolog -debug all nonblock1
del *.jou,*.log
call xsim nonblock1 -gui
