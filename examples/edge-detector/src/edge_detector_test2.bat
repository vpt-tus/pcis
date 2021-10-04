call %XILINX_SET%
call xvlog -sv -nolog edge_detector.sv edge_detector_test2.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s test2 -nolog -debug all edge_detector_test2
del *.jou,*.log
rem call xsim test2 -gui
