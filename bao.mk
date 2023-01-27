bao_src:=$(srcPath)/bao-hypervisor
bao_cfg_file:=bao_rpi4_linux_freertos
bao_cfg:=$(confPath)/$(bao_cfg_file).c
bao_cfg_repo:=$(imgPath)/build-config
bao_cfg_dest:=$(bao_cfg_repo)/$(bao_cfg_file).c
bao_image:=$(imgPath)/bao.bin

$(bao_cfg_repo):
	@mkdir -p $(bao_cfg_repo)

$(bao_cfg_dest): | $(bao_cfg_repo)
	cp -L $(bao_cfg) $(bao_cfg_dest)

bao $(bao_image): $(bao_cfg_dest) $(bao_src) 
	$(MAKE) -C $(bao_src)\
		PLATFORM=$(PLATFORM)\
		CONFIG_REPO=$(bao_cfg_repo)\
		CONFIG=$(bao_cfg_file) CONFIG_BUILTIN=y\
		CPPFLAGS=-DIMG_PATH=$(imgPath)
	cp $(bao_src)/bin/$(PLATFORM)/builtin-configs/$(bao_cfg_file)/bao.bin $(bao_image)