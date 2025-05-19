set sd_name {BVF_RISCV_SUBSYSTEM}

# Disable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 0


#-------------------------------------------------------------------------------
# Connect ADC.
#-------------------------------------------------------------------------------
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:GPIO_0_12_OUT} -port_name {SD_CARD_CS}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:QSPI_SS0} -port_name {ADC_CSn}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:QSPI_CLK} -port_name {ADC_SCK}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:QSPI_DATA0} -port_name {ADC_MOSI}
sd_create_scalar_port -sd_name ${sd_name} -port_name {ADC_MISO} -port_direction {INOUT}
sd_connect_pins -sd_name ${sd_name} -pin_names {PF_SOC_MSS:QSPI_DATA1 ADC_MISO}
sd_connect_pins -sd_name ${sd_name} -pin_names {"ADC_IRQn" "PF_SOC_MSS:GPIO_1_20_IN" }
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_SOC_MSS:SPI_1_CLK_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_SOC_MSS:SPI_1_DO_M2F}
sd_mark_pins_unused -sd_name ${sd_name} -pin_names {PF_SOC_MSS:SPI_1_SS1_M2F}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_SOC_MSS:SPI_1_SS_F2M} -value {GND}
sd_connect_pins_to_constant -sd_name ${sd_name} -pin_names {PF_SOC_MSS:SPI_1_CLK_F2M} -value {GND}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:SPI_1_DI_F2M} -port_name {}
sd_rename_port -sd_name ${sd_name} -current_port_name {SPI_1_DI_F2M} -new_port_name {SPI_1_DI}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:SPI_1_SS1_M2F} -port_name {}
sd_rename_port -sd_name ${sd_name} -current_port_name {SPI_1_SS1_M2F} -new_port_name {SPI_1_SS1}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:SPI_1_CLK_M2F} -port_name {}
sd_rename_port -sd_name ${sd_name} -current_port_name {SPI_1_CLK_M2F} -new_port_name {SPI_1_CLK}
sd_connect_pin_to_port -sd_name ${sd_name} -pin_name {PF_SOC_MSS:SPI_1_DO_M2F} -port_name {}
sd_rename_port -sd_name ${sd_name} -current_port_name {SPI_1_DO_M2F} -new_port_name {SPI_1_DO}




# Re-enable auto promotion of pins of type 'pad'
auto_promote_pad_pins -promote_all 1

# Save the smartDesign
save_smartdesign -sd_name ${sd_name}
generate_component -component_name ${sd_name}
