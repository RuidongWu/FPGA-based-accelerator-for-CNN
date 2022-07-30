/*
 * sdk_main.c
 *
 *  Created on: 2020Äê3ÔÂ16ÈÕ
 *      Author: Administrator
 */

#include "IM1.h"
#include "Weight.h"
#include "stdio.h"

#include "xaxidma.h"
#include "xparameters.h"
#include "sleep.h"

//#include "xlayer2_writebackddr.h"


#define INPUT_DMA_ID	XPAR_AXIDMA_0_DEVICE_ID
#define WEIGHT_DMA_ID	XPAR_AXIDMA_1_DEVICE_ID

XAxiDma InputDma, WeightDma;
XAxiDma_Config *InputDma_CfgPtr, *WeightDma_CfgPtr;

int InputDMA_Init(void)
{
	int Status;
	InputDma_CfgPtr = XAxiDma_LookupConfig(INPUT_DMA_ID);
	Status = XAxiDma_CfgInitialize(&InputDma, InputDma_CfgPtr);
	XAxiDma_IntrDisable(&InputDma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&InputDma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DMA_TO_DEVICE);

	return Status;
}

int WeightDMA_Init(void)
{
	int Status;
	WeightDma_CfgPtr = XAxiDma_LookupConfig(WEIGHT_DMA_ID);
	Status = XAxiDma_CfgInitialize(&WeightDma, WeightDma_CfgPtr);
	XAxiDma_IntrDisable(&WeightDma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&WeightDma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DMA_TO_DEVICE);

	return Status;
}

int AllDMA_Start(void)
{
	XAxiDma_SimpleTransfer(&WeightDma, (UINTPTR) q_weight,
			(3*3*4+4 + 3*3*4*8+8 + 3*3*8*16+16 + 64*45+45)*sizeof(short int), XAXIDMA_DMA_TO_DEVICE);

	return 0;
}

int main(void)
{
	xil_printf("Application start!\r\n");
	InputDMA_Init();
	WeightDMA_Init();

	AllDMA_Start();

	while(XAxiDma_Busy(&WeightDma, XAXIDMA_DMA_TO_DEVICE))
	{
		// nop
	}
	xil_printf("Weight DMA is OK!\r\n");

	XAxiDma_SimpleTransfer(&InputDma, (UINTPTR) Layer1_im, 28*28*6*sizeof(char), XAXIDMA_DMA_TO_DEVICE);
	while(XAxiDma_Busy(&InputDma, XAXIDMA_DMA_TO_DEVICE))
	{
		// nop
	}
	xil_printf("Input DMA is OK!\r\n");

	xil_printf("Heheda!\r\n");

	return 0;
}

