/*
 * Weight.h
 *
 *  Created on: 2020��5��13��
 *      Author: Administrator
 */

#ifndef SRC_WEIGHT_H_
#define SRC_WEIGHT_H_

short int q_weight[3*3*4+4 + 3*3*4*8+8 + 3*3*8*16+16 + 64*10+10] __attribute__ ((aligned (64)))={
//qc1_wb(3*3*4+4)
//kernel
12113, 18457, -4933,  5798,
13981, 15308,  6558,  9695,
 8357, 17975, 12171, 12639,
25410, 14681,  1434, -2748,
32049, 18989, 17957, -3341,
23994,  5047, 23435,  -525,
21126, 10772, 14893, -6605,
23717,  5726, 13344, -8487,
18595, -3929, 23062, -7805,

//bias
439,    83,   444, 27602,

//q2_wb(3*3*4*8+8)
//kernel
-1904,3743,8118,-2916,9633,-2689,12514,9117,
-1544,-2855,-2368,-4357,7609,-8047,11141,-3667,
1508,274,11749,8632,9259,-6800,11007,8531,
913,-2874,3024,-7581,-3050,182,-6336,402,
-7855,9787,2306,7098,530,581,7389,9196,
-4775,5915,202,3845,2443,-1275,7799,5447,
-5920,8811,10188,7335,592,4695,-3448,2491,
3410,-103,-1830,-1962,-948,-5500,-537,4764,
-7828,10146,11784,-5502,-13666,11273,-8249,3938,
-4541,7830,-2084,2226,-10042,-1158,-787,1369,
-6212,8422,5789,-6810,-4087,2615,-2592,3730,
-835,-4686,875,-1029,485,2575,909,-1444,
12008,10346,7787,2704,11252,8286,7556,2772,
-122,107,10242,2334,5003,6357,7807,4013,
3352,2860,5026,10118,7362,991,3581,10988,
3684,2577,11940,-9006,-4873,2738,235,-142,
-1585,4430,14660,7005,-4034,6627,-7881,10066,
-2862,7424,9055,-361,-5765,5724,22,6555,
2311,-1210,4272,-3728,-7043,1776,-6565,9619,
-210,-3559,8774,-5587,-1345,352,-500,-4672,
-1718,-1473,6850,-5806,-4916,4779,-5483,3878,
-5645,3110,7113,-5510,-4490,6958,-1994,6717,
1982,-1718,7728,-5680,18,1471,-4974,-860,
-1082,-3125,4063,-2760,5077,1790,-6899,-617,
14619,32,-18434,6775,9318,-2995,-3128,4124,
4947,-1334,-10799,4341,5871,7393,3128,5395,
8181,7537,-13378,8296,5634,-5024,-3617,5559,
2918,411,6124,43,2652,3193,540,-1655,
13646,-2103,-20940,2200,-3607,-4211,-12482,5271,
9379,-1650,-5724,2683,-2346,686,-6398,3249,
2063,-4161,-5127,4156,-2515,-8011,-2238,2674,
8661,-1939,2609,-1760,-3115,-3070,729,-5360,
16123,-6792,-11710,627,-3863,1249,-7268,8008,
10507,-8420,-4982,-4597,-3479,-851,-344,3774,
10802,-7477,-4147,961,49,6024,-4407,4767,
1217,-3719,4177,-5689,-1386,-4266,-1040,-4469,

//bias
-16124,-2563,14704,-23970,8371,6227,-7779,-14210,

//qc3_wb(3*3*8*16+16)
//kernel
4997,5339,14082,-2554,-3496,4801,172,391,-7603,-2318,-8893,-3760,-4351,1851,-4300,8797,
-6423,4133,-1776,-1387,1458,8071,-2281,4709,-1463,2854,-5961,3141,-6839,-1760,2234,-3645,
-6158,3527,7879,3330,3277,4812,8454,2272,2158,347,-6051,3373,5049,-3131,-8202,-102,
573,-2937,353,-878,347,8691,-1773,1844,-1615,65,3037,-652,-3848,2408,-3724,-1001,
-560,1105,-1193,2513,-6433,868,-515,-4835,2420,-4703,6222,1481,1821,-1453,-2533,-3529,
-6405,1248,-1093,2704,5048,3162,2662,5121,-4564,-4644,4262,1063,-1230,183,475,-1225,
-3125,4594,1309,1220,-3972,6053,-120,-1867,-1085,-4785,1745,931,-4675,1488,-1907,3743,
-3432,7067,9287,-4104,11009,7636,5838,10880,-2082,-3,7731,1279,-15686,-2561,-6218,11633,
-3026,1411,7395,2107,-2767,-2741,5450,273,4956,-1287,-3475,-4665,-5400,2207,4378,5004,
-2443,-1547,-11967,-1357,-9691,5009,2308,122,-614,2350,1889,1154,-1049,-5486,1446,-74,
9629,3800,-3069,-3701,-5377,4156,3843,21399,-8719,937,-8508,-10420,10844,-4647,-1035,-2150,
-6380,-2233,417,1709,1308,-371,-4531,-4263,-658,2546,13078,4511,-6395,-3570,1339,242,
-2962,-2268,-1743,6352,-1648,-5857,5275,-7429,740,-3389,7324,2927,-2514,-79,0,-495,
2201,4385,-1027,-849,589,1803,4249,8799,1573,5395,-3523,-2742,3991,-3003,2277,-3955,
-73,1737,-9976,2140,-1671,4503,2744,-5545,3701,6062,-2896,9702,-4047,-69,1298,3192,
-2277,835,2186,581,6950,-894,2768,9557,4353,-3427,15104,7126,-10319,1058,-5427,7434,
6756,3454,-4204,-4967,-3923,-1983,-6232,2795,4149,-1477,-4481,-7248,-1262,1278,-1270,1633,
1278,-822,-1175,2810,-2388,-4083,4189,-3341,3160,1392,4780,-288,-1154,2791,6506,-6095,
-1519,1764,-1765,-1084,-12460,749,3611,11876,-1392,2586,-3450,1182,8264,-3618,-3539,6401,
1206,2093,-2065,539,-2158,2857,-2537,-6791,1455,-3481,4524,2677,-3132,-1416,-439,1584,
-3644,-660,3052,-543,-2456,3578,-5867,-7757,-1757,1689,2498,-1951,146,-4289,-2632,619,
-3739,5036,-5134,-6883,-6332,-5436,10801,4026,2453,1676,929,-618,0,-3213,5479,-479,
-3040,-3640,-9323,2002,-6857,-527,4122,-5267,7351,-2938,485,-885,-607,3791,-1162,-4779,
-9009,2946,-4580,3705,9800,-6248,712,2909,829,-2956,6706,-2479,8670,-1493,-2459,-3317,
8698,-8835,-3195,-2962,4762,-1917,-12883,668,-4880,-2744,-10874,1083,10072,-3350,-27,-1996,
1212,-1146,-4857,2378,-2006,-5500,-3580,-6105,-3076,554,-6479,1974,-2450,3207,-386,-84,
5709,14162,2404,-4662,-2354,-3654,-7274,-3725,-5993,3022,-4552,696,-3210,7008,-7637,-5495,
71,-7343,-4539,5600,-1855,-54,2108,-1442,2272,-5044,1153,7341,-4579,-3096,1792,-642,
678,-6852,-5641,780,345,66,32,-3119,4488,-2123,4355,4024,-6591,-526,-1645,7863,
-2436,-1982,-1297,-259,-4348,1993,1516,-1998,4078,4026,321,-4915,1102,3597,-2533,542,
429,1690,2515,7013,-3495,-6202,5245,-4334,-332,1785,2896,-2473,-3414,3969,2294,5123,
7036,-7733,-6961,1903,-5219,3735,-6527,-7057,4369,520,-6493,-5942,3697,-1445,3204,4932,
10048,-6440,3889,-1772,-2799,3857,-4715,-3730,1162,-2434,192,4301,11095,-3013,5234,-4273,
-928,4349,-1926,288,3451,-3708,4145,-3095,5900,-1509,985,-1173,-7247,4036,493,200,
-644,1285,-2565,475,-209,-5346,-5511,-1176,-7465,-2309,-10325,-3398,-6701,6139,-2003,-7203,
3750,2796,2945,4030,2570,-4159,-1938,-5961,8566,-702,8462,-6141,2000,1476,4999,-1679,
-1176,2623,3539,-4576,-1834,-441,5222,-2388,7291,-2862,6023,3696,1177,961,3866,9894,
-1711,4293,-2335,-11,556,-7453,1703,2532,764,3012,-5711,-4713,-6224,2674,-4709,-1003,
-2553,-4367,-6910,3522,3796,-4204,2389,-714,3647,-904,-1221,7104,-1691,-2802,5393,-1263,
3468,-10850,3439,-3827,4916,-4164,8109,-4411,4754,-3297,12710,-11085,-3786,-11,-4591,2647,
1464,-914,4289,-15,3466,-1339,2791,-921,-965,-1079,1028,2731,4067,1152,9020,-4785,
-276,2874,-3067,496,2042,-2449,4840,-3989,5187,3087,-300,4473,-5091,3093,-5035,6798,
587,-6593,-7223,-3887,-3719,599,813,-2870,-2493,4240,-3056,6511,848,8843,-4703,-96,
2579,202,2253,3723,5655,500,2107,-55,-2072,934,1976,1887,7658,4721,759,-96,
-920,-1241,3984,3222,8349,-1236,3659,-1168,3610,-2244,-3065,590,-2464,699,-1665,-639,
-230,-356,-433,4053,-2904,-3279,-6648,-6124,-750,995,-3333,-825,-2158,2473,-5071,-1263,
89,-2383,-8465,-618,-497,-2202,-2484,324,-1851,-1465,1175,2066,-3021,1216,-3826,1244,
2313,-3590,-2741,-3347,1669,-5491,-191,-837,-8511,2618,2211,-1667,650,2296,-999,-3291,
-10935,-1309,137,-5,-2513,3821,-7984,3654,1338,-2392,-7271,598,5362,9156,-907,-9113,
3430,-5662,2740,-1679,6708,-655,-7427,3369,-6967,464,687,1866,1549,1888,3727,-2483,
-376,-6513,2364,-2496,11072,2001,-1994,-4964,-2676,-1485,-2339,-5318,6922,-1462,3103,701,
-1213,-1090,-2260,3468,-8603,1170,-8402,2520,5703,4289,6954,1884,4357,-3497,6235,-2443,
-3687,-5295,961,-2009,-11811,4983,-2446,-3092,8693,-4406,4013,-4049,2814,4404,765,409,
2711,499,5457,3343,8206,-2422,1248,-1552,787,-351,612,5245,-2280,-7773,2187,673,
661,-119,1212,3313,-1252,-2646,-1641,1685,-10240,1254,3708,1986,1322,3991,1618,-3747,
-3576,292,-333,5146,1862,-4324,-6133,-1933,12462,-1211,712,4979,-714,6129,4528,2523,
-2019,2318,5948,5821,-8448,-4953,-807,-4448,10819,-473,-1730,2188,-1802,-3396,491,2483,
-1923,-454,-2012,2421,3290,-1997,1749,2082,-13789,-3437,-2068,4179,1315,1301,-2635,-4214,
10271,-5241,-49,101,7918,3433,10478,6802,5761,2723,146,-889,5573,4888,3621,-2946,
-4444,985,6929,2626,-4118,571,-4092,3161,-229,-3465,3146,6717,-4458,-1178,-3940,-3557,
-3509,-4430,4654,-1077,-1456,-194,-2358,662,1263,5254,8830,1155,-2992,-1384,-3455,-812,
-4391,-574,-2136,-2944,-1720,-2849,-953,4192,-2037,-943,1480,-1070,-213,-3888,1606,2394,
-3531,1628,3198,-2163,763,22,753,4306,-14897,-4553,1723,-1803,2250,2090,-1561,-5960,
-3778,6626,4350,1412,-7349,309,-4004,10583,-595,-4775,888,8302,-738,-7945,3237,3560,
158,323,3033,45,-3845,-1232,-4002,-8580,1642,-1405,-5447,-1096,3478,-3402,1090,788,
-640,2915,-956,-751,-1369,-1310,3093,400,-4378,-126,-2568,10111,1270,4071,2108,-4081,
-1215,1623,-3891,-2405,-2304,-5762,6496,-4459,7712,804,-396,-1443,1030,1673,4737,-1192,
-3950,922,3924,-4892,-5059,-2830,1433,6826,1830,-6417,-1491,3900,-1697,-6721,3857,3649,
539,2979,1246,848,-1313,7277,-1538,5338,-758,-2546,-1447,1020,-2719,441,-1064,2214,
590,-377,-2874,-2288,-2333,1449,3137,-3459,4092,-33,-3440,485,-1611,-1031,1120,-5178,
3923,5691,-847,-1790,3227,4241,-4615,3565,-4679,-62,918,310,-3270,3019,-1905,-4258,
2663,1569,640,-5004,-6322,-1207,-12565,1014,5372,1987,-4737,849,-2417,-10207,3162,1775,

//bias
-21066,24566,13945,-7344,17381,4976,11665,-14384,-13557,282,-16720,-13638,-11567,-469,-15471,22909,

//qf_wb(64*10+10)
//weight rearrange
-2173,1246,5,-3522,
-801,6936,-341,-4242,
786,13410,6,-1685,
-3083,6674,3655,-374,
841,82,9268,692,
-995,-3411,-1907,-2072,
-10440,-148,-7356,2893,
268,6299,8930,-1185,
8396,8709,-4451,2921,
2448,-9202,-8038,-1278,
-27,-1532,-4182,-7431,
3013,-3078,-613,-5211,
6481,2975,1631,9171,
-37,-4652,8900,13488,
4471,2062,-4729,-12700,
-666,-1152,7715,-197,
-10043,2526,-2272,-16143,
8036,-4238,2038,11916,
-1849,-854,-3685,9665,
-339,-2437,3542,3513,
2941,525,2840,-5027,
-12042,-2090,1246,-2397,
-5152,-1297,-7821,7538,
-6017,4003,-11972,2529,
14819,4868,-1431,3638,
567,-248,7415,556,
5597,-1169,7676,7584,
-15391,-3128,-5321,3644,
1922,-5098,5850,2616,
14188,-1581,-814,-6230,
-1023,-743,-6523,-947,
5054,6464,-5666,-7424,
5520,-5285,271,-5249,
10762,-6142,-4644,-1905,
-6350,1062,3805,2212,
-3451,-3495,-1768,-779,
-9883,1782,1550,-674,
8443,684,3445,2270,
-4325,-6623,908,3776,
-11932,-1238,3357,3954,
7551,-275,6109,-643,
-3101,5662,-2171,-6079,
3566,1743,9937,303,
-1253,-4860,-1030,3629,
-6081,-5287,-8312,225,
5811,2696,-12460,-9196,
2895,2691,-4088,3837,
8956,4546,3260,3180,
-3447,-8086,-1886,-1339,
-7484,-1484,12057,-1550,
-4191,-171,3399,11029,
23,5534,2020,-17387,
1,-7127,-1287,-3254,
9944,-4698,1675,-5501,
1887,-3561,5334,-4736,
-7888,6533,4658,4670,
-6452,11307,-3906,-322,
-7031,1987,-1302,4504,
6962,-7997,-4538,-725,
14536,-872,-2241,3566,
-10295,1184,9187,-5543,
-5177,-6461,10194,-696,
8,1167,11478,1461,
7680,4932,-1925,-1847,
2625,-606,10440,4698,
-2383,-1646,-15734,-4079,
6441,6344,-12099,6463,
4458,-4557,6580,3278,
1801,-2783,-6467,4570,
-10897,-1599,-478,-9416,
5528,-3555,5155,2533,
1994,3745,-2253,12602,
2885,-7453,-1037,-2433,
-3650,4393,496,5581,
-10711,-5728,-4229,-2003,
6029,11057,6228,5209,
4267,3971,7124,-8169,
-2082,-3399,1747,-5242,
-2347,5640,-372,-4480,
-552,526,-1172,4201,
-3780,-1221,7018,-1529,
-2982,-5717,-2041,5567,
-1676,-3757,-4167,-465,
478,4917,1637,-1063,
-486,2584,-2700,685,
5554,3029,8019,-2620,
-5224,-12213,2839,-2393,
-1360,3229,-6694,-3128,
-852,-4991,8082,-1441,
2362,6036,-8865,-4935,
7972,5230,1180,-7991,
7397,1939,-7638,-6674,
8731,5492,-1236,-99,
981,614,-7579,1158,
-6444,-2677,3350,4838,
7271,2006,745,1882,
3183,2702,12488,-2873,
-4691,648,-4191,-3736,
-3132,1902,-111,-1572,
-4196,1558,-3495,9857,
9617,-1876,2382,8922,
-5398,-613,2707,-1621,
4723,369,127,-8695,
5127,-1795,-5901,-51,
-15655,-446,1072,5775,
4993,-754,-9610,4181,
6414,-541,1468,-3308,
-8890,2356,1477,10281,
9067,-53,512,-9905,
-9206,-4364,-737,1017,
-8951,1391,2660,5462,
-893,5867,962,-457,
-7719,-583,5982,-738,
9571,499,-27,-8966,
4240,1526,-1407,-1599,
6927,5539,1047,-1943,
-9191,9525,2364,4210,
-37,-6891,-12335,3583,
2383,-1669,-1066,2060,
-182,1729,-4660,-14155,
7380,-7858,-6730,-5526,
7507,3828,8199,-625,
8921,-3238,-2852,4279,
-2140,-963,6762,859,
2690,-2319,-2249,-2884,
-1458,4068,10895,7485,
4370,-8135,-3445,-159,
254,235,-9126,1998,
-10473,-4283,4631,-5067,
-257,4771,-697,179,
8912,-2777,6040,1622,
-1168,3151,7975,-7543,
-3731,-5654,12210,-3622,
3854,-2503,-11221,7715,
-12302,3343,7199,-396,
-1110,-3336,-9233,3722,
7102,-2034,-5016,1245,
-9891,714,4163,841,
5279,10664,-6242,5328,
-8878,-716,-7893,-6046,
-11011,-399,-2085,1990,
10627,-2804,2776,5865,
3667,-1598,-17239,3397,
-7629,-5686,-3244,-764,
2926,-405,4664,783,
806,-3815,4204,-4620,
-5030,-4791,-1439,-4010,
-1186,-1391,4913,701,
5750,1005,-6389,-305,
3816,-676,8937,2580,
4936,-894,3849,-10500,
5166,2004,6863,3897,
-5283,4334,11420,-1914,
-3739,-5210,-1572,-3079,
1773,3127,13,-3762,
-1052,-4843,1380,-3709,
2943,-3336,1497,-4934,
-3682,2425,289,2246,
-4373,-3642,-4547,-456,
1301,-1174,4032,4150,

//bias
5650,31084,11491,19824,-1195,16719,-4087,13524,23159,14901,

};


#endif /* SRC_WEIGHT_H_ */
