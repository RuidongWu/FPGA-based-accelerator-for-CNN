# FPGA-based-accelerator-for-CNN-SVM
## Hardware
This project uses the hardware platform about Edgeboard Lite (Baidu), and the chip is xazu3eg-sfvc784-1-i, which has 360 DSPs and 216 BRAM_36Ks.
### FZ3-2019-12-30.pdf
Hardware schematic.
### edgeboard_lite_1200M.tcl
Hardware configuration script file for Zynq UltraScale+ MPSoC IP core in Vivado.

# Implementation of Different Parallelism Levels
First implementation result is used to verify our research, and the board device is implemented as following:  
![image](Implementation%20of%20Different%20Parallelism%20Levels/Impl%20of%20Device1.png)  
It is abviously that the implementation result can not make full use of hardware resources.  
Then we should make a balance of inter layer.

# Implementation of Inter Layer Balance(CNN)
An inter layer balance is implemented after design space exploration, and the new result of board device implmentation is following:  
![image1](Implementation%20of%20Inter%20Layer%20Balance(CNN)/Impl%20of%20Device2.png)  
From the above result, we can conduct that new implementation make full use of hardware resources.  

# Implementation of Inter Layer Balance(CNN-SVM)
Similary, CNN-SVM of inter layer balance is also deployed in this platform.  
![image2](Implementation%20of%20Inter%20Layer%20Balance(CNN-SVM)/Impl%20of%20Device3.png)  
This result is the optimal accelerator for CNN-SVM hybrid network based on FPGA.  

# PS_Standalone(CNN-SVM)
The standlone program of CNN-SVM. It is running on the PS of Edgeboard Lite. An external SD Card (FAT32) is necessary for storing the Mnist dataset files. The xilffs lib driver (FATFS) should be added when creating project board support package(BSP).

# Quantization Example(16bit) Python
This includes two examples for illustrating the quantification process. The quantization process is also applicable for SVM, and the accurancy remains unchanged.
