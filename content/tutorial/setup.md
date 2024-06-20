+++
title = 'Tutorial Advance Preparation'
draft = false
+++

We're excited for you to get hands-on experience with Tock during out tutorial
session! To make the tutorial as productive as possible, we recommend you
**complete the following steps in advance**.


## Install Toolchains and Dependencies

1.  Install needed command line utilities. You may already have all or most of
    these installed.

        # Ubuntu
        $ sudo apt install git wget zip curl python3 python3-pip python3-venv

        # MacOS
        $ brew install wget pipx git

1.  Clone the Tock kernel repository and the C userspace library.

        $ git clone https://github.com/tock/tock
        $ git clone https://github.com/tock/libtock-c

1.  Install [rustup](http://rustup.rs/). This tool helps manage installations of
    the Rust compiler and related tools.

        $ curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

1.  Install toolchains to compile for ARM Cortex-M and RISC-V platforms. These
    are [arm-none-eabi
    toolchain](https://developer.arm.com/open-source/gnu-toolchain/gnu-rm/downloads)
    and riscv64-unknown-elf. This enables you to compile apps written in C.

        # Ubuntu
        $ sudo apt install gcc-arm-none-eabi gcc-riscv64-unknown-elf

        # MacOS
        $ brew install arm-none-eabi-gcc riscv64-elf-gcc

1.  Install [tockloader](https://github.com/tock/tockloader). This is an
    all-in-one tool (written in Python) for programming boards and using Tock.

        $ pipx install tockloader

    > Note: You may need to add `tockloader` to your path. If you cannot run it
    > after installation, run the following:

        $ pipx ensurepath

1.  Install `JLinkExe` to load code onto your board. `JLink` is available
    [from the Segger website](https://www.segger.com/downloads/jlink). You want
    to install the "J-Link Software and Documentation Pack". There are various
    packages available depending on operating system.


## Compile The Kernel and Applications

To verify that the tools are properly installed you should try to build the
kernel and some applications. We won't be able to test these without the
hardware, but we can verify your system can compile the Tock code. Also, the
first time requires fetching many sources so it is helpful to do this in
advance.

1.  Build the kernel. We will use the `nrf52840dk-hotp-tutorial` board.

        $ cd tock/boards/tutorials/nrf52840dk-hotp-tutorial
        $ make

    You should see output like:

    ```text
    make
       Compiling kernel v0.1.0 (/Users/bradjc/git/tock/kernel)
       Compiling cortexm v0.1.0 (/Users/bradjc/git/tock/arch/cortex-m)
       Compiling cortexv7m v0.1.0 (/Users/bradjc/git/tock/arch/cortex-v7m)
       Compiling capsules-core v0.1.0 (/Users/bradjc/git/tock/capsules/core)
       Compiling nrf5x v0.1.0 (/Users/bradjc/git/tock/chips/nrf5x)
       Compiling capsules-system v0.1.0 (/Users/bradjc/git/tock/capsules/system)
       Compiling cortexm4 v0.1.0 (/Users/bradjc/git/tock/arch/cortex-m4)
       Compiling nrf52 v0.1.0 (/Users/bradjc/git/tock/chips/nrf52)
       Compiling capsules-extra v0.1.0 (/Users/bradjc/git/tock/capsules/extra)
       Compiling nrf52840 v0.1.0 (/Users/bradjc/git/tock/chips/nrf52840)
       Compiling components v0.1.0 (/Users/bradjc/git/tock/boards/components)
       Compiling nrf52_components v0.1.0 (/Users/bradjc/git/tock/boards/nordic/nrf52_components)
       Compiling nrf52840dk v0.1.0 (/Users/bradjc/git/tock/boards/nordic/nrf52840dk)
       Compiling nrf52840dk-hotp-tutorial v0.1.0 (/Users/bradjc/git/tock/boards/tutorials/nrf52840dk-hotp-tutorial)
        Finished `release` profile [optimized + debuginfo] target(s) in 28.28s
       text	   data	    bss	    dec	    hex	filename
     155650	     36	  32852	 188538	  2e07a	/Users/bradjc/git/tock/target/thumbv7em-none-eabi/release/nrf52840dk-hotp-tutorial
    9226327a4fbab3781df0ae6fa73e32fa61204697ad53352c4d2324fdb82f252b  /Users/bradjc/git/tock/target/thumbv7em-none-eabi/release/nrf52840dk-hotp-tutorial.bin
    ```

2.  Build an example application. This will fetch the needed sources. We can use
    any application, but for simplicity we will use `blink`.

        $ cd libtock-c/examples/blink
        $ make

    You should see a lot of output and it should end like:

    ```text
      CC        main.c
      LD        build/cortex-m0/cortex-m0.elf
      CC        main.c
      LD        build/cortex-m3/cortex-m3.elf
      CC        main.c
      LD        build/cortex-m4/cortex-m4.elf
      CC        main.c
      LD        build/cortex-m7/cortex-m7.elf
      CC        main.c
      LD        build/rv32imac/rv32imac.0x20040080.0x80002800.elf
      LD        build/rv32imac/rv32imac.0x403B0080.0x3FCC0000.elf
      CC        main.c
      LD        build/rv32imc/rv32imc.0x41000080.0x42008000.elf
      LD        build/rv32imc/rv32imc.0x00080080.0x40008000.elf
      LD        build/rv32imc/rv32imc.0x20030080.0x10005000.elf
      LD        build/rv32imc/rv32imc.0x20030880.0x10008000.elf
      LD        build/rv32imc/rv32imc.0x20032080.0x10008000.elf
      LD        build/rv32imc/rv32imc.0x20034080.0x10008000.elf
      LD        build/rv32imac/rv32imac.0x40430080.0x80004000.elf
      LD        build/rv32imac/rv32imac.0x40440080.0x80007000.elf
     E2T        build/blink.tab
    Application size report for arch family cortex-m:
       text	   data	    bss	    dec	    hex	filename
       6928	    260	   2728	   9916	   26bc	build/cortex-m0/cortex-m0.elf
       6492	    260	   2728	   9480	   2508	build/cortex-m3/cortex-m3.elf
       6620	    260	   2728	   9608	   2588	build/cortex-m4/cortex-m4.elf
       6620	    260	   2728	   9608	   2588	build/cortex-m7/cortex-m7.elf
      26660	   1040	  10912	  38612	   96d4	(TOTALS)
    Application size report for arch family rv32i:
       text	   data	    bss	    dec	    hex	filename
       8392	     92	   2732	  11216	   2bd0	build/rv32imac/rv32imac.0x20040080.0x80002800.elf
       8392	     92	   2732	  11216	   2bd0	build/rv32imac/rv32imac.0x403B0080.0x3FCC0000.elf
      10964	     92	   2732	  13788	   35dc	build/rv32imc/rv32imc.0x41000080.0x42008000.elf
      10964	     92	   2732	  13788	   35dc	build/rv32imc/rv32imc.0x00080080.0x40008000.elf
      10964	     92	   2732	  13788	   35dc	build/rv32imc/rv32imc.0x20030080.0x10005000.elf
      10964	     92	   2732	  13788	   35dc	build/rv32imc/rv32imc.0x20030880.0x10008000.elf
      10964	     92	   2732	  13788	   35dc	build/rv32imc/rv32imc.0x20032080.0x10008000.elf
      10964	     92	   2732	  13788	   35dc	build/rv32imc/rv32imc.0x20034080.0x10008000.elf
       8392	     92	   2732	  11216	   2bd0	build/rv32imac/rv32imac.0x40430080.0x80004000.elf
       8392	     92	   2732	  11216	   2bd0	build/rv32imac/rv32imac.0x40440080.0x80007000.elf
      99352	    920	  27320	 127592	  1f268	(TOTALS)
    ```

3.  Finally, build an example OpenThread application. This will compile the
    OpenThread library.

        $ cd libtock-c/examples/openthread/openthread_hello
        $ make

## Wrap-Up

You should now be set to hit the ground running at the tutorial!

If you weren't able to complete these steps, it's ok! We will be around to help
during the tutorial.



