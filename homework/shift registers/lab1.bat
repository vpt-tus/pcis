call C:\Xilinx\Vivado\2018.2\settings64.bat
call xvlog -sv -nolog lab1_test.sv lab1.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s lab1 -nolog -debug all lab1_test
del *.jou,*.log
rem call xsim lab1 -gui