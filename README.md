# bao-rpi4-bench
Project using Bao hypervisor with FreeRTOS+Linux running haRTStone benchmark.

Originally based on [Bao Project's][bao] demo project but specialized for Raspberry Pi 4
running FreeRTOS and Linux. FreeRTOS executes the haRTSone benchmark to determine the performance and real time capabilities of
FreeRTOS running under a vm environment.

## Install Dependencies

```
sudo apt install build-essential bison flex git libssl-dev ninja-build \
    u-boot-tools pandoc
```
## Download and setup the toolchain

Download the latest bare-metal cross-compile toolchain for RPI4's architecture

**aarch64-none-elf-** toolchain: [Arm Developer's][arm-toolchains].

Install the toolchain. Then, set the **CROSS_COMPILE** environment variable 
with the reference toolchain prefix path:

```
export CROSS_COMPILE=/path/to/toolchain/install/dir/bin/your-toolchain-prefix-
```

## Clone Repo
```
git clone --recurse-submodules https://github.com/xX7/bao-rpi4-bench.git
```

<!-- Links -->

[arm-toolchains]: https://developer.arm.com/tools-and-software/open-source-software/developer-tools/gnu-toolchain/gnu-a/downloads
[bao]: https://github.com/bao-project
