call C:\Xilinx\Vivado\2020.1\settings64.bat
call xvlog -sv -nolog tlight.sv tlight_test_1.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s tlight_test_1 -nolog -debug all tlight_test_1
del *.jou,*.log
rem call xsim tlight_test_1 -gui