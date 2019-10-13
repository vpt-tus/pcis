call C:\Xilinx\Vivado\2019.1\settings64.bat
call xvlog -sv -nolog mux_2x1.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s mux_2x1 -nolog -debug all mux_2x1_test
del *.jou,*.log
rem call xsim mux_2x1 -gui