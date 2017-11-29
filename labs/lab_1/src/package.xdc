# Basys3 xdc
# LED [7:0]
set_property -dict { PACKAGE_PIN U16   IOSTANDARD LVCMOS33 } [get_ports { led_pins[0] }];
set_property -dict { PACKAGE_PIN E19   IOSTANDARD LVCMOS33 } [get_ports { led_pins[1] }];
set_property -dict { PACKAGE_PIN U19   IOSTANDARD LVCMOS33 } [get_ports { led_pins[2] }];
set_property -dict { PACKAGE_PIN V19   IOSTANDARD LVCMOS33 } [get_ports { led_pins[3] }];
set_property -dict { PACKAGE_PIN W18   IOSTANDARD LVCMOS33 } [get_ports { led_pins[4] }];
set_property -dict { PACKAGE_PIN U15   IOSTANDARD LVCMOS33 } [get_ports { led_pins[5] }];
set_property -dict { PACKAGE_PIN U14   IOSTANDARD LVCMOS33 } [get_ports { led_pins[6] }];
set_property -dict { PACKAGE_PIN V14   IOSTANDARD LVCMOS33 } [get_ports { led_pins[7] }]; 
set_property -dict { PACKAGE_PIN V13   IOSTANDARD LVCMOS33 } [get_ports { led_pins[8] }]; 
set_property -dict { PACKAGE_PIN V3    IOSTANDARD LVCMOS33 } [get_ports { led_pins[9] }]; 
set_property -dict { PACKAGE_PIN W3    IOSTANDARD LVCMOS33 } [get_ports { led_pins[10] }]; 
set_property -dict { PACKAGE_PIN U3    IOSTANDARD LVCMOS33 } [get_ports { led_pins[11] }]; 
set_property -dict { PACKAGE_PIN P3    IOSTANDARD LVCMOS33 } [get_ports { led_pins[12] }]; 
set_property -dict { PACKAGE_PIN N3    IOSTANDARD LVCMOS33 } [get_ports { led_pins[13] }]; 
set_property -dict { PACKAGE_PIN P1    IOSTANDARD LVCMOS33 } [get_ports { led_pins[14] }]; 
set_property -dict { PACKAGE_PIN L1    IOSTANDARD LVCMOS33 } [get_ports { led_pins[15] }]; 

# CLK source 100 MHz
set_property -dict { PACKAGE_PIN W5    IOSTANDARD LVCMOS33 } [get_ports { clk_pin }];

# Reset - BTNC
set_property -dict { PACKAGE_PIN U18   IOSTANDARD LVCMOS33 } [get_ports { rst_pin }];