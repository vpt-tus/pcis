call %XILINX_SET%
call xvlog -sv -nolog edge_detector_delay.sv edge_detector_delay_test.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s edge_detector_delay -nolog -debug all edge_detector_delay_test
del *.jou,*.log
call xsim edge_detector_delay -gui
