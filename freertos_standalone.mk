freertos_st_src:=$(srcPath)/freertos-neneco-hartstone
freertos_st_dest_image:=$(imgPath)/freertos_standalone.elf

freertos_standalone $(freertos_st_dest_image): $(freertos_st_src)
	$(MAKE) -C $(freertos_st_src)/RPI4_drivers/neneco
	cp $(freertos_st_src)/RPI4_drivers/neneco/neneco.elf $(freertos_st_dest_image)