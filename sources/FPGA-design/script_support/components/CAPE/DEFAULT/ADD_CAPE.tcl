puts "======== Add cape option: DEFAULT ========"

#-------------------------------------------------------------------------------
# Build cape's submodules
#-------------------------------------------------------------------------------
::safe_source script_support/components/CAPE/shared/APB_BUS_CONVERTER.tcl
::safe_source script_support/components/CAPE/shared/CoreAPB3_CAPE.tcl
::safe_source script_support/components/CAPE/shared/CoreGPIO_P8_UPPER.tcl
::safe_source script_support/components/CAPE/shared/P8_GPIO_UPPER.tcl
::safe_source script_support/components/CAPE/shared/CoreGPIO_P9.tcl
::safe_source script_support/components/CAPE/shared/P9_GPIO.tcl
::safe_source script_support/components/CAPE/shared/CAPE_DEFAULT_GPIOS.tcl
::safe_source script_support/components/CAPE/shared/CorePWM_C1.tcl
::safe_source script_support/components/CAPE/shared/CAPE_PWM.tcl
::safe_source script_support/components/CAPE/$cape_option/CAPE.tcl

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0

#-------------------------------------------------------------------------------
# Build the Cape module
#-------------------------------------------------------------------------------
set sd_name ${top_level_name}

puts "Marker 0"

sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MMUART_2_TXD}
sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MMUART_2_RXD}
sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:SPI_1_DO}
sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:SPI_1_SS1}
sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:SPI_1_CLK}

puts "Marker 1"

sd_instantiate_macro -sd_name {BVF_RISCV_SUBSYSTEM} -macro_name {BIBUF} -instance_name {MMUART_2_TXD_BIBUF}
sd_delete_ports -sd_name {BVF_RISCV_SUBSYSTEM} -port_names {MMUART_2_TXD}
sd_connect_pin_to_port -sd_name {BVF_RISCV_SUBSYSTEM} -pin_name {MMUART_2_TXD_BIBUF:PAD} -port_name {MMUART_2_TXD}
sd_connect_pins -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {"MMUART_2_TXD_BIBUF:D" "PF_SOC_MSS:MMUART_2_TXD_M2F"}
sd_mark_pins_unused -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {MMUART_2_TXD_BIBUF:Y}
sd_connect_pins_to_constant -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {MMUART_2_TXD_BIBUF:E} -value {VCC}

puts "Marker 2"

sd_instantiate_macro -sd_name {BVF_RISCV_SUBSYSTEM} -macro_name {BIBUF} -instance_name {MMUART_2_RXD_BIBUF}
sd_delete_ports -sd_name {BVF_RISCV_SUBSYSTEM} -port_names {MMUART_2_RXD}
sd_connect_pin_to_port -sd_name {BVF_RISCV_SUBSYSTEM} -pin_name {MMUART_2_RXD_BIBUF:PAD} -port_name {MMUART_2_RXD}
sd_connect_pins -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {"MMUART_2_RXD_BIBUF:Y" "PF_SOC_MSS:MMUART_2_RXD_F2M"}
sd_connect_pins_to_constant -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {MMUART_2_RXD_BIBUF:E} -value {VCC}
sd_connect_pins_to_constant -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {MMUART_2_RXD_BIBUF:D} -value {GND}

sd_instantiate_macro -sd_name {BVF_RISCV_SUBSYSTEM} -macro_name {BIBUF} -instance_name {MMUART_4_TXD_BIBUF}
sd_delete_ports -sd_name {BVF_RISCV_SUBSYSTEM} -port_names {MMUART_4_TXD}
sd_connect_pin_to_port -sd_name {BVF_RISCV_SUBSYSTEM} -pin_name {MMUART_4_TXD_BIBUF:PAD} -port_name {MMUART_4_TXD}
sd_connect_pins -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {"MMUART_4_TXD_BIBUF:D" "PF_SOC_MSS:MMUART_4_TXD_M2F"}
sd_mark_pins_unused -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {MMUART_4_TXD_BIBUF:Y}
sd_connect_pins_to_constant -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {MMUART_4_TXD_BIBUF:E} -value {VCC}

sd_instantiate_macro -sd_name {BVF_RISCV_SUBSYSTEM} -macro_name {BIBUF} -instance_name {MMUART_4_RXD_BIBUF}
sd_delete_ports -sd_name {BVF_RISCV_SUBSYSTEM} -port_names {MMUART_4_RXD}
sd_connect_pin_to_port -sd_name {BVF_RISCV_SUBSYSTEM} -pin_name {MMUART_4_RXD_BIBUF:PAD} -port_name {MMUART_4_RXD}
sd_connect_pins -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {"MMUART_4_RXD_BIBUF:Y" "PF_SOC_MSS:MMUART_4_RXD_F2M"}
sd_connect_pins_to_constant -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {MMUART_4_RXD_BIBUF:E} -value {VCC}
sd_connect_pins_to_constant -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {MMUART_4_RXD_BIBUF:D} -value {GND}

sd_delete_instances -sd_name {BVF_RISCV_SUBSYSTEM} -instance_names {SPI_1_DO_BIBUF}
sd_mark_pins_unused -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {PF_SOC_MSS:SPI_1_DO_OE_M2F}
sd_mark_pins_unused -sd_name {BVF_RISCV_SUBSYSTEM} -pin_names {PF_SOC_MSS:SPI_1_DO_M2F}

puts "Marker 3"
save_smartdesign -sd_name {BVF_RISCV_SUBSYSTEM}
puts "Marker 4"
sd_update_instance -sd_name ${sd_name} -instance_name {BVF_RISCV_SUBSYSTEM}
puts "Marker 5"
save_smartdesign -sd_name ${sd_name}
puts "Marker 6"
#generate_component -component_name {BVF_RISCV_SUBSYSTEM}
puts "Marker 7"

#-------------------------------------------------------------------------------
# Instantiate.
#-------------------------------------------------------------------------------

sd_instantiate_component -sd_name ${sd_name} -component_name {CAPE} -instance_name {CAPE}
sd_create_bus_port -sd_name ${sd_name} -port_name {P9} -port_direction {INOUT} -port_range {[31:11]} -port_is_pad {1}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {P9} -pin_slices {\
[11:11] [12:12] [13:13] [16:14] [17:17] [18:18] [19:19] [20:20] [21:21] [22:22]\
[23:23] [24:24] [25:25] [26:26] [27:27] [28:28] [29:29] [30:30] [31:31]}
sd_create_pin_slices -sd_name ${sd_name} -pin_name {CAPE:P9} -pin_slices {[30:30] [27:27] [25:25] [23:23] [16:14] [12:12]}

#-------------------------------------------------------------------------------
# Connections.
#-------------------------------------------------------------------------------
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P8} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_41} -port_name {}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {CAPE:P9_42} -port_name {}
save_smartdesign -sd_name ${sd_name}
sd_connect_pins -sd_name ${sd_name} -pin_names {CAPE:P9[12] P9[12]}
sd_connect_pins -sd_name ${sd_name} -pin_names {CAPE:P9[16:14] P9[16:14]}
sd_connect_pins -sd_name ${sd_name} -pin_names {CAPE:P9[23] P9[23]}
sd_connect_pins -sd_name ${sd_name} -pin_names {CAPE:P9[25] P9[25]}
sd_connect_pins -sd_name ${sd_name} -pin_names {CAPE:P9[27] P9[27]}
sd_connect_pins -sd_name ${sd_name} -pin_names {CAPE:P9[30] P9[30]}
save_smartdesign -sd_name ${sd_name}

# Clocks and resets
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_PCLK" "CAPE:PCLK"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"CLOCKS_AND_RESETS:FIC_3_FABRIC_RESET_N" "CAPE:PRESETN" }

sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART_4_TXD" "P9[13]"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART_4_RXD" "P9[11]"}

sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:GPIO_2_F2M" "CAPE:GPIO_IN"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:GPIO_2_M2F" "CAPE:GPIO_OUT"} 
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:GPIO_2_OE_M2F" "CAPE:GPIO_OE"} 

sd_connect_pins -sd_name ${sd_name} -pin_names {"CAPE:APB_SLAVE" "BVF_RISCV_SUBSYSTEM:CAPE_APB_MTARGET"}

sd_clear_pin_attributes -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M} 
sd_create_pin_slices -sd_name ${sd_name} -pin_name {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M} -pin_slices {[7:3] [47:8] [58:48]}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MSS_INT_F2M[47:8]" "CAPE:INT"} 
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M[7:3]} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {BVF_RISCV_SUBSYSTEM:MSS_INT_F2M[58:48]} -value {GND}

sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART_2_TXD" "P9[24]"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:MMUART_2_RXD" "P9[26]"}

sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_0_DI" "P9[21]"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_0_DO" "P9[18]"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_0_SS1" "P9[17]"}

sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_0_CLK" "P9[22]"}

sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_1_CLK" "P9[31]"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_1_DI" "P9[29]"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:SPI_1_SS1" "P9[28]"}

sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:I2C0_SCL" "P9[19]"}
sd_connect_pins -sd_name ${sd_name} -pin_names {"BVF_RISCV_SUBSYSTEM:I2C0_SDA" "P9[20]"}

# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1