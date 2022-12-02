
linux_repo:=https://github.com/torvalds/linux.git
linux_version:=v5.11
linux_src:=$(srcPath)/linux-$(linux_version)

linux_cfg_frag:=$(confPath)/linux_cfg_aarch64_rpi4.config
linux_patches:=$(wildcard $(confPath)/linux_patches/$(linux_version)/*.patch)

linux_dts:=$(confPath)/linux_rpi4.dts
linux_dtb:=$(imgPath)/linux_rpi4.dtb
linux_dest_image:=$(imgPath)/linux.bin

buildroot_repo:=https://github.com/buildroot/buildroot.git
buildroot_version:=2022.02.2
buildroot_src:=$(srcPath)/buildroot-$(ARCH)-$(linux_version)
buildroot_defcfg:=$(confPath)/buildroot_aarch64.config
buildroot_image:=$(imgPath)/BR-Image-$(PLATFORM)

lloader_dir:=$(curPath)/lloader

export LINUX_OVERRIDE_SRCDIR=$(linux_src) 
export BAO_DEMOS_LINUX_CFG_FRAG=$(linux_cfg_frag)

$(linux_src):
	git clone --depth 1 --branch $(linux_version) $(linux_repo) $(linux_src)
	git -C $(linux_src) apply $(linux_patches)

$(buildroot_src):
	git clone --depth 1 --branch $(buildroot_version) $(buildroot_repo)\
		$(buildroot_src)


$(buildroot_image): $(linux_patches) $(linux_cfg_frag) $(buildroot_defcfg) | $(linux_src) $(buildroot_src) 
	$(MAKE) -C $(buildroot_src) defconfig BR2_DEFCONFIG=$(buildroot_defcfg)
	$(MAKE) -C $(buildroot_src) linux-reconfigure all
	mv $(buildroot_src)/output/images/Image $(buildroot_image)

# Compiling linux.dts into linux.dtb
$(linux_dtb): $(linux_dts)
	dtc $(linux_dts) > $(linux_dtb)

# Merging of buildroot image with .dtb to final linux binary
$(linux_dest_image): $(buildroot_image) $(linux_dtb)
	$(MAKE) -C $(lloader_dir) ARCH=$(ARCH) IMAGE=$(buildroot_image)\
		DTB=$(linux_dtb) TARGET=$(linux_dest_image)

linux: $(linux_dest_image)