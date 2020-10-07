call C:\Xilinx\Vivado\2020.1\settings64.bat
call xvlog -sv -nolog two_step.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s two_step -nolog -debug all two_step
del *.jou,*.log
rem call xsim two_step -gui