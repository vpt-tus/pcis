call C:\Xilinx\Vivado\2018.2\settings64.bat
call xvlog -sv -nolog fibonacci_test.sv fibonacci.sv
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s fibonacci_test -nolog -debug all fibonacci_test
del *.jou,*.log
rem call xsim fibonacci_test -gui
rem call xsim fibonacci_test -gui