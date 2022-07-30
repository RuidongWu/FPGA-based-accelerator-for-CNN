/*
 * cnn_svm.c
 *
 *  Created on: 2020年6月3日
 *      Author: Administrator
 */
#include "im1.h"
#include "xparameters.h"
#include "xstatus.h"
#include "stdio.h"

#define max(a,b) a>b?a:b

short int l1_res[26][26][4];
short int l1_pooling[13][13][4];

short int l2_res[12][12][8]={0};
short int l2_pooling[6][6][8];

short int l3_res[4][4][16];
short int l3_flatten[64];

int svm_res[45];

unsigned char cnn_svm(unsigned char img[28][28])
{
	int i, j, kr, kc, m, n;
	int fi = 0;
	for (i = 0; i<26; i++)
	{
		for (j = 0; j<26; j++)
		{
			int index = 0;
			int sum[4];
			for (n = 0; n<4; n++)
			{
				sum[n] = qc1_b[n] << 4;
				//sum[n] = sum[n] << 4;
			}
			for (kr = 0; kr<3; kr++)
			{
				for (kc = 0; kc<3; kc++)
				{
					for (n = 0; n<4; n++)
					{
						sum[n] += img[i + kr][j + kc] * qc1_w[index];
						index++;
					}
				}
			}

			for (n = 0; n<4; n++)
			{
				l1_res[i][j][n] = sum[n] >> 12;
			}
		}
	}

	for (i = 0; i<13; i++)
	{
		for (j = 0; j<13; j++)
		{
			short int m0, m1, m2;
			for (n = 0; n<4; n++)
			{
				m0 = max(l1_res[i << 1][j << 1][n], l1_res[i << 1][(j << 1) + 1][n]);
				m1 = max(l1_res[(i << 1) + 1][j << 1][n], l1_res[(i << 1) + 1][(j << 1) + 1][n]);
				m2 = max(m0, m1);
				l1_pooling[i][j][n] = max(m2, 0);
			}
		}
	}

	for (i = 0; i<11; i++)
	{
		for (j = 0; j<11; j++)
		{
			int index = 0;
			int sum[8];

			for (n = 0; n<8; n++)
			{
				sum[n] = qc2_b[n] << 7;
				//sum[n] = sum[n] << 7;
			}
			for (kr = 0; kr<3; kr++)
			{
				for (kc = 0; kc<3; kc++)
				{
					for (m = 0; m<4; m++)
					{
						for (n = 0; n<8; n++)
						{
							sum[n] += l1_pooling[i + kr][j + kc][m] * qc2_w[index];
							index++;
						}
					}
				}
			}

			for (n = 0; n<8; n++)
			{
				l2_res[i][j][n] = sum[n] >> 16;
			}
		}
	}

	for (i = 0; i < 6; i++)
	{
		for (j = 0; j < 6; j++)
		{
			short int m0, m1, m2;
			for (n = 0; n<8; n++)
			{
				m0 = max(l2_res[i << 1][j << 1][n], l2_res[i << 1][(j << 1) + 1][n]);
				m1 = max(l2_res[(i << 1) + 1][j << 1][n], l2_res[(i << 1) + 1][(j << 1) + 1][n]);
				m2 = max(m0, m1);
				l2_pooling[i][j][n] = max(m2, 0);
			}
		}
	}

	for (i = 0; i < 4; i++)
	{
		for (j = 0; j < 4; j++)
		{
			int index = 0;
			int sum[16];

			for (n = 0; n<16; n++)
			{
				sum[n] = qc3_b[n] << 7;
				//sum[n] = sum[n] << 7;
			}
			for (kr = 0; kr<3; kr++)
			{
				for (kc = 0; kc<3; kc++)
				{
					for (m = 0; m<8; m++)
					{
						for (n = 0; n<16; n++)
						{
							sum[n] += l2_pooling[i + kr][j + kc][m] * qc3_w[index];
							index++;
						}
					}
				}
			}

			for (n = 0; n<16; n++)
			{
				l3_res[i][j][n] = sum[n] >> 17;// 如果此处右移15位，那么后续为(l3_flatten[m]>>2) * qsvm_w[fi];
			}
		}
	}

	for (i = 0; i < 2; i++)
	{
		for (j = 0; j < 2; j++)
		{
			short int m0, m1, m2;
			for (n = 0; n<16; n++)
			{
				m0 = max(l3_res[i << 1][j << 1][n], l3_res[i << 1][(j << 1) + 1][n]);
				m1 = max(l3_res[(i << 1) + 1][j << 1][n], l3_res[(i << 1) + 1][(j << 1) + 1][n]);
				m2 = max(m0, m1);
				l3_flatten[fi] = max(m2, 0);
				fi++;
			}
		}
	}

	for (n = 0; n < 45; n++)
	{
		svm_res[n] = qsvm_b[n] << 8;
		//svm_res[n] = svm_res[n]<<8;
	}
	fi = 0;
	for (m = 0; m < 64; m++)
	{
		for (n = 0; n < 45; n++)
		{
			svm_res[n] += (l3_flatten[m]) * qsvm_w[fi];
			fi++;
		}
	}

	fi = 0;
	unsigned char vote[10] = { 0 };
	for (i = 0; i < 9; i++)
	{
		for (j = i+1; j < 10; j++)
		{
			if (svm_res[fi] >= 0)
			{
				vote[i]++;
			}
			else
			{
				vote[j]++;
			}
			fi++;
		}
	}

	unsigned char max_i = 0;
	for (i = 1; i < 10; i++)
	{
		if (vote[i] > vote[max_i])
			max_i = i;
	}

	return max_i;
}
