call C:\Xilinx\Vivado\2019.1\settings64.bat
call xvlog -sv -nolog example_union.sv;
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s example_union -nolog -debug all example_union
del *.jou,*.log
rem call xsim example_union -gui