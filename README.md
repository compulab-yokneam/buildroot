# CompuLab Buildroot

* Disclaimer

| !IMPORTANT! | This is a development branch; provided for demo purpose only|
|---|---|

## Configuring the build

* WorkDir:
```
mkdir compulab-br2 && cd compulab-br2
```

* Set a CompuLab machine:

| Machine | Command Line |
|---|---|
|ucm-imx8m-plus|```export MACHINE=ucm-imx8m-plus```|
|som-imx8m-plus|```export MACHINE=som-imx8m-plus```|
|iot-gate-imx8plus|```export MACHINE=iot-gate-imx8plus```|

* Download the code:
```
bash <(curl -L https://raw.githubusercontent.com/compulab-yokneam/buildroot/lf-6.1.36-2.1.0/tools/run.me)
```

* Goto the compulab-buildroot folder:
```
cd compulab-buildroot-*
```

* Issue defconfig:
```
make ${MACHINE}_defconfig
```

* Issue build:
```
make -j `nproc`
```

## Known issues:

* ATF<br>
Issue) The BuildRoot toolchain fails at compiling the `arm-trusted-firmware`<br>
Solution) To compile the `arm-trusted-firmware` using an external toolcahin:<br>

|NOTE|It is up to a developer to install an external toolchain; this procedure does not cover this step|
|---|---|

|Steps|Description|Command to issue|
|---|---|---|
|1|issue buildroot build|make -j `nproc`|
|2|buildroot fails|-|
|3|goto `arm-trusted-firmware`|pushd output/build/arm-trusted-firmware-custom|
|4|set cross environment|export ARCH=arm64 CROSS_COMPILE=/opt/gcc-arm-10.3-2021.07-x86_64-aarch64-none-elf/bin/aarch64-none-elf-|
|5|issue atf build|make PLAT=imx8mp TARGET_BOARD= ARM_ARCH_MAJOR=8 ARCH=aarch64 all bl31|
|6|get back to the build root|popd|
|7|issue buildroot build again|make -j `nproc`|
