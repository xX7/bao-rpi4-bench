
firmware_repo:=https://github.com/raspberrypi/firmware.git
firmware_version:=1.20210201
firmware_images:=$(curPath)/firmware-rpi

atf_src:=$(srcPath)/arm-trusted-firmware
atf_dest_image:=$(imgPath)/bl31.bin
atf_plat:=$(PLATFORM)

uboot_src:=$(srcPath)/u-boot
uboot_defconfig:=rpi_4_defconfig
uboot_dest_image:=$(imgPath)/u-boot.bin

atf $(atf_dest_image): $(atf_src)
	$(MAKE) -C $(atf_src) bl31 PLAT=$(atf_plat)
	cp $(atf_src)/build/$(atf_plat)/release/bl31.bin $(atf_dest_image)


u-boot $(uboot_dest_image): $(uboot_src)
	$(MAKE) -C $(uboot_src) $(uboot_defconfig)
	echo 'CONFIG_CMD_CACHE=y' >> $(uboot_src)/.config
	$(MAKE) -C $(uboot_src) -j$(nproc) 
	cp $(uboot_src)/u-boot.bin $(uboot_dest_image)

$(firmware_images):
	git clone --depth 1 --branch $(firmware_version) $(firmware_repo) $(firmware_images)

#instuctions:=$(bao_demos)/platforms/$(PLATFORM)/README.md

platform: $(uboot_dest_image) $(atf_dest_image) $(firmware_images)
#	$(call print-instructions, $(instuctions), 1, false)
#	$(call print-instructions, $(instuctions), 2, false)
#	$(call print-instructions, $(instuctions), 3, true)