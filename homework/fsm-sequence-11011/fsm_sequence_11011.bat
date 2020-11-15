call C:\Xilinx\Vivado\2020.1\settings64.bat
call xvlog -sv -nolog fsm_sequence_11011_test.sv fsm_sequence_11011.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s fsm_sequence_11011 -nolog -debug all fsm_sequence_11011_test
del *.jou,*.log
rem call xsim fsm_sequence_11011 -gui