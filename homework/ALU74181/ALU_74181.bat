call C:\Xilinx\Vivado\2018.2\settings64.bat
call xvlog -sv -nolog ALU_74181.sv
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s ALU_74181 -nolog -debug all ALU_74181_test
del *.jou,*.log
rem call xsim ALU_74181 -gui