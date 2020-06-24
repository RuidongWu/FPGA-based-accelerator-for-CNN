# FPGA-based-accelerator-for-CNN-SVM
## Hardware
This project uses the hardware platform about Edgeboard Lite (Baidu), and the chip is xazu3eg-sfvc-1-i, which has 360 DSP units.
### FZ3-2019-12-30.pdf
Hardware schematic
### edgeboard_lite_1200M.tcl
Hardware configuration script file.

# Implementation of Different Parallelism Levels
First implementation result is used to verify our research, and the board device is implemented as following:
![image](Implementation%20of%20Different%20Parallelism%20Levels/Impl%20of%20Device1.png)
It is abviously that the implementation result can not make full use of hardware resources.
Then we should make a balance of inter layer.
