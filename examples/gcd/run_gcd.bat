call %XILINX_SET%
call xvlog -sv -nolog gcd.sv gcd_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s gcd_test -nolog -debug all gcd_test
del *.jou,*.log
rem call xsim gcd_test -gui
