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
bash <(curl -L https://raw.githubusercontent.com/compulab-yokneam/buildroot/master/tools/run.me)
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
