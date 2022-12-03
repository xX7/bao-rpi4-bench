# bao-rpi4-bench

Project using Bao Hypervisor running FreeRTOS and Linux.
It is originally based on [Bao Project's][bao] demo project but restructured/forked and
exclusively for the Raspberry Pi 4.

FreeRTOS executes the haRTStone benchmark ported by [Daniel Casini, Emiliano Palermiti and Matteo Pampana][hartstone] to determine the performance and real time capabilities of
FreeRTOS running under a vm environment.

The haRTStone benchmark has been adjusted to properly work with the Raspberry Pi 4 and bao's version of FreeRTOS.

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
[hartstone]: https://github.com/CDanielC/HartstoneRTBenchmark
