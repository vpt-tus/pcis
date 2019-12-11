call C:\Xilinx\Vivado\2019.1\settings64.bat
call xvlog -sv -nolog tlight.sv tlight_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s tlight -nolog -debug all tlight_test
del *.jou,*.log
call xsim tlight -gui