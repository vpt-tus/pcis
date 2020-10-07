call C:\Xilinx\Vivado\2020.1\settings64.bat
call xvlog -sv -nolog single_shot.sv single_shot_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s single_shot_test -nolog -debug all single_shot_test
del *.jou,*.log
if ERRORLEVEL 1 (
  exit
)
rem call xsim single_shot_test -gui