call %XILINX_SET%
call xvlog -sv -nolog edge_detector.sv edge_detector_test1.sv 
if ERRORLEVEL 1 (
  exit
)
call xelab -R -s edge_detector -nolog -debug all edge_detector_test1
del *.jou,*.log
call xsim edge_detector -gui
