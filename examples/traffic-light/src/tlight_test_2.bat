call C:\Xilinx\Vivado\2019.1\settings64.bat
call xvlog -sv -nolog tlight.sv tlight_test_2.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s tlight_test_2 -nolog -debug all tlight_test_2
del *.jou,*.log
rem call xsim tlight_test_2 -gui