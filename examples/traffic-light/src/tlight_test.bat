call C:\Xilinx\Vivado\2020.1\settings64.bat
call xvlog -sv -nolog tlight_package.sv tlight_v2.sv tlight_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s tlight_test -nolog -debug all tlight_test
del *.jou,*.log
rem call xsim tlight_test -gui