
freertos_src:=$(srcPath)/freertos
freertos_dest_image:=$(imgPath)/freertos.bin

$(freertos_dest_image): $(freertos_src)
	$(MAKE) -C $(freertos_src) PLATFORM=$(PLATFORM)
	cp $(freertos_src)/build/$(PLATFORM)/freertos.bin $(freertos_dest_image)

freertos: $(freertos_dest_image)