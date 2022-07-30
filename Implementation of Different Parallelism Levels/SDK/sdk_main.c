/*
 * sdk_main.c
 *
 *  Created on: 2020Äê3ÔÂ16ÈÕ
 *      Author: Administrator
 */

#include "IM1.h"
#include "stdio.h"

#include "xaxidma.h"
#include "xparameters.h"
#include "sleep.h"

//#include "xlayer2_writebackddr.h"


#define INPUT_DMA_ID	XPAR_AXIDMA_0_DEVICE_ID

#define LAYER1_DMA_ID	XPAR_AXIDMA_4_DEVICE_ID
#define LAYER2_DMA_ID	XPAR_AXIDMA_3_DEVICE_ID
#define LAYER3_DMA_ID	XPAR_AXIDMA_1_DEVICE_ID
#define FC_DMA_ID		XPAR_AXIDMA_2_DEVICE_ID

XAxiDma InputDma, Layer1Dma, Layer2Dma, Layer3Dma, FcDma;
XAxiDma_Config *InputDma_CfgPtr, *Layer1Dma_CfgPtr, *Layer2Dma_CfgPtr, *FcDma_CfgPtr, *Layer3Dma_CfgPtr;

s16 Res[4][4][16]={};
s16 *pRes = (s16*)0x10000000;

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

int Layer1DMA_Init(void)
{
	int Status;
	Layer1Dma_CfgPtr = XAxiDma_LookupConfig(LAYER1_DMA_ID);
	Status = XAxiDma_CfgInitialize(&Layer1Dma, Layer1Dma_CfgPtr);
	XAxiDma_IntrDisable(&Layer1Dma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&Layer1Dma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DMA_TO_DEVICE);

	return Status;
}

int Layer2DMA_Init(void)
{
	int Status;
	Layer2Dma_CfgPtr = XAxiDma_LookupConfig(LAYER2_DMA_ID);
	Status = XAxiDma_CfgInitialize(&Layer2Dma, Layer2Dma_CfgPtr);
	XAxiDma_IntrDisable(&Layer2Dma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&Layer2Dma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DMA_TO_DEVICE);

	return Status;
}

int Layer3DMA_Init(void)
{
	int Status;
	Layer3Dma_CfgPtr = XAxiDma_LookupConfig(LAYER3_DMA_ID);
	Status = XAxiDma_CfgInitialize(&Layer3Dma, Layer3Dma_CfgPtr);
	XAxiDma_IntrDisable(&Layer3Dma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&Layer3Dma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DMA_TO_DEVICE);

	return Status;
}

int FcDMA_Init(void)
{
	int Status;
	FcDma_CfgPtr = XAxiDma_LookupConfig(FC_DMA_ID);
	Status = XAxiDma_CfgInitialize(&FcDma, FcDma_CfgPtr);
	XAxiDma_IntrDisable(&FcDma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DEVICE_TO_DMA);
	XAxiDma_IntrDisable(&FcDma, XAXIDMA_IRQ_ALL_MASK,
								XAXIDMA_DMA_TO_DEVICE);

	return Status;
}

int AllDMA_Start(void)
{
	//XAxiDma_SimpleTransfer(&InputDma, (UINTPTR) Layer1_im, 28*28*4*sizeof(char), XAXIDMA_DMA_TO_DEVICE);

	XAxiDma_SimpleTransfer(&Layer1Dma, (UINTPTR) qc1_wb, (3*3*4+4)*sizeof(short int), XAXIDMA_DMA_TO_DEVICE);
	XAxiDma_SimpleTransfer(&Layer2Dma, (UINTPTR) qc2_wb, (3*3*4*8+8)*sizeof(short int), XAXIDMA_DMA_TO_DEVICE);
	XAxiDma_SimpleTransfer(&Layer3Dma, (UINTPTR) qc3_wb, (3*3*8*16+16)*sizeof(short int), XAXIDMA_DMA_TO_DEVICE);
	XAxiDma_SimpleTransfer(&FcDma, (UINTPTR) qfc_wb, (64*10+10)*sizeof(short int), XAXIDMA_DMA_TO_DEVICE);

	return 0;
}

/*
#define WRITE_DDR_ID	XPAR_LAYER2_WRITEBACKDDR_0_DEVICE_ID
XLayer2_writebackddr WriteDDR_Unit;

int WriteDDR_Init(void)
{
	int status;
	status = XLayer2_writebackddr_Initialize(&WriteDDR_Unit, WRITE_DDR_ID);
	return status;
}
*/


void ResMEM_Clear(void)
{
	memset((void*)0x10000000,0,11*11*8*2);
	Xil_DCacheFlushRange((INTPTR)0x10000000, 11*11*8*2+16);
}

void CPU_Layer3(void)
{
	for(int i=1; i<5; i++)
	{
		for(int j=1; j<5; j++)
		{
			for(int n=0; n<16; n++)
			{
				int sum = ((s32)(qc3_b[n]))<<7;
				for(int m=0; m<8; m++)
				{
					for(int ki=0; ki<3; ki++)
					{
						for(int kj=0; kj<3; kj++)
						{
							short int a = qc3_wb[ki*3*4*8+kj*4*8+m*8+n];
							short int b = Layer3_im1[(i-1+ki)*13*4+(j-1+kj)*4+m];
							sum += a*b;
						}
					}
				}
				Res[i-1][j-1][n] = (s16)(sum>>16);
			}
		}
	}
}

int main(void)
{
	int suc=0;

	xil_printf("Application start!\r\n");
	InputDMA_Init();
	Layer1DMA_Init();
	Layer2DMA_Init();
	Layer3DMA_Init();
	FcDMA_Init();


	//ResMEM_Clear();
	/*
	WriteDDR_Init();
	XLayer2_writebackddr_Set_AXI_DDR_Data(&WriteDDR_Unit, 0x10000000);
	XLayer2_writebackddr_DisableAutoRestart(&WriteDDR_Unit);
	XLayer2_writebackddr_Start(&WriteDDR_Unit);
	*/

	AllDMA_Start();

	while(XAxiDma_Busy(&Layer1Dma, XAXIDMA_DMA_TO_DEVICE))
	{
		// nop
	}
	xil_printf("Layer1 DMA is OK!\r\n");

	while(XAxiDma_Busy(&Layer2Dma, XAXIDMA_DMA_TO_DEVICE))
	{
		// nop
	}
	xil_printf("Layer2 DMA is OK!\r\n");
	while(XAxiDma_Busy(&Layer3Dma, XAXIDMA_DMA_TO_DEVICE))
	{
		// nop
	}
	xil_printf("Layer3 DMA is OK!\r\n");
	while(XAxiDma_Busy(&FcDma, XAXIDMA_DMA_TO_DEVICE))
	{
		// nop
	}
	xil_printf("Fc DMA is OK!\r\n");

	XAxiDma_SimpleTransfer(&InputDma, (UINTPTR) Layer1_im, 28*28*6*sizeof(char), XAXIDMA_DMA_TO_DEVICE);
	while(XAxiDma_Busy(&InputDma, XAXIDMA_DMA_TO_DEVICE))
	{
		// nop
	}
	xil_printf("Input DMA is OK!\r\n");

	xil_printf("Heheda!\r\n");

	return 0;
}

