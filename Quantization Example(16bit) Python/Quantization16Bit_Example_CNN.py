from tensorflow.python import pywrap_tensorflow
from tensorflow.examples.tutorials.mnist import input_data
import numpy as np

my_path = 'ckpt/cnn.ckpt'

reader = pywrap_tensorflow.NewCheckpointReader(my_path)
var = reader.get_variable_to_shape_map()

c1_w = reader.get_tensor('layer1-conv1/weight')
c1_b = reader.get_tensor('layer1-conv1/bias')

c2_w = reader.get_tensor('layer3-conv2/weight')
c2_b = reader.get_tensor('layer3-conv2/bias')

c3_w = reader.get_tensor('layer5-conv3/weight')
c3_b = reader.get_tensor('layer5-conv3/bias')

f1_w = reader.get_tensor('layer6-fc2/weight')
f1_b = reader.get_tensor('layer6-fc2/bias')

s1_w = np.load('ckpt/coef.npy')
s1_b = np.load('ckpt/intercept.npy')

###### quantization 16 bit
c1_w = c1_w*(2**15)
c1_w = c1_w.astype(np.int16)
#print(np.max(np.abs(c1_w)))
c1_b = c1_b*(2**19)
c1_b = c1_b.astype(np.int16)
#print(np.max(np.abs(c1_b)))
#c1_b = c1_b<<4
## layer1>>12bit

c2_w = c2_w*(2**15)
c2_w = c2_w.astype(np.int16)
#print(np.max(np.abs(c2_w)))
c2_b = c2_b*(2**19)
c2_b = c2_b.astype(np.int16)
#print(np.max(np.abs(c2_b)))
#c2_b = c2_b<<7
## layer2>>16bit

c3_w = c3_w*(2**15)
c3_w = c3_w.astype(np.int16)
#print(np.max(np.abs(c3_w)))
c3_b = c3_b*(2**18)
c3_b = c3_b.astype(np.int16)
#print(np.max(np.abs(c3_b)))
#c3_b = c3_b<<7
## layer3>>15bit

f1_w = f1_w*(2**15)
f1_w = f1_w.astype(np.int16)
#print(np.max(np.abs(f1_w)))
f1_b = f1_b*(2**17)
f1_b = f1_b.astype(np.int16)
#print(np.max(np.abs(f1_b)))
#f1_b = f1_b<<8

s1_w = s1_w*(2**11)
s1_w = s1_w.astype(np.int16)
#print(np.max(np.abs(s1_w)))
s1_b = s1_b*(2**11)
s1_b = s1_b.astype(np.int16)
#print(np.max(np.abs(s1_b)))


L1_out = np.zeros([26, 26, 4], dtype=np.int16)
L1_pool = np.zeros([13, 13, 4], dtype=np.int16)
L2_out = np.zeros([12, 12, 8], dtype=np.int16) #标准的大小应该是11*11*4，因为池化需要偶数，所以行列多补了一层0
L2_pool = np.zeros([6, 6, 8], dtype=np.int16)
L3_out = np.zeros([4, 4, 16], dtype=np.int16)
L3_pool = np.zeros([2, 2, 16], dtype=np.int16)

S1_out = np.zeros([45], dtype=np.int32)


def cnn_func(image):
    # conv1
    for i in range(1, 27):
        for j in range(1, 27):
            for n in range(4):
                sum = c1_b[n].astype(np.int32)
                sum = sum<<4
                for ki in range(3):
                    for kj in range(3):
                        sum += c1_w[ki][kj][0][n].astype(np.int32)*image[i-1+ki][j-1+kj]
                #if sum<0:
                #    sum=0
                L1_out[i-1][j-1][n] = sum>>12

    # relu1
    for i in range(1, 27):
        for j in range(1, 27):
            for n in range(4):
                if L1_out[i-1][j-1][n] < 0:
                    L1_out[i-1][j-1][n] = 0

    # pool1
    for i in range(13):
        for j in range(13):
            for n in range(4):
                L1_pool[i][j][n] = max(L1_out[i*2][j*2][n], L1_out[i*2+1][j*2][n], L1_out[i*2][j*2+1][n], L1_out[i*2+1][j*2+1][n])

    # conv2
    for i in range(1, 12):
        for j in range(1, 12):
            for n in range(8):
                sum = c2_b[n].astype(np.int32)
                sum = sum<<7
                for m in range(4):
                    for ki in range(3):
                        for kj in range(3):
                            sum += c2_w[ki][kj][m][n].astype(np.int32)*L1_pool[i-1+ki][j-1+kj][m]
                L2_out[i-1][j-1][n] = sum>>16

    # relu2
    for i in range(1, 12):
        for j in range(1, 12):
            for n in range(8):
                if L2_out[i-1][j-1][n] < 0:
                    L2_out[i-1][j-1][n] = 0

    # pool2
    for i in range(6):
        for j in range(6):
            for n in range(8):
                L2_pool[i][j][n] = max(L2_out[i*2][j*2][n], L2_out[i*2+1][j*2][n], L2_out[i*2][j*2+1][n], L2_out[i*2+1][j*2+1][n])

    # conv3
    for i in range(1, 5):
        for j in range(1, 5):
            for n in range(16):
                sum = c3_b[n].astype(np.int32)
                sum = sum<<7
                for m in range(8):
                    for ki in range(3):
                        for kj in range(3):
                            sum += c3_w[ki][kj][m][n].astype(np.int32)*L2_pool[i-1+ki][j-1+kj][m]
                L3_out[i-1][j-1][n] = sum>>15

    # relu3
    for i in range(1, 5):
        for j in range(1, 5):
            for n in range(16):
                if L3_out[i-1][j-1][n]<0:
                    L3_out[i-1][j-1][n] = 0

    # pool3
    for i in range(2):
        for j in range(2):
            for n in range(16):
                L3_pool[i][j][n] = max(L3_out[i*2][j*2][n], L3_out[i*2+1][j*2][n], L3_out[i*2][j*2+1][n], L3_out[i*2+1][j*2+1][n])

    L3_flatten = L3_pool.flatten()

    # FC分类 CNN模式准确率为97.27%
    F1_out = np.zeros([10], dtype=np.int)
    for n in range(10):
        sum = f1_b[n].astype(np.int32)
        sum = sum<<6
        for m in range(64):
            sum += (L3_flatten[m]>>2)*f1_w[m][n].astype(np.int32)
        F1_out[n] = sum

    '''
    # SVM分类 CNN-SVM模式准确率为100.00%
    for n in range(45):
        sum = s1_b[n].astype(np.int32)
        sum = sum<<8
        for m in range(64):
            sum += (L3_flatten[m]>>2)*s1_w[n][m]
        S1_out[n] = sum

    S1_res = np.zeros([10], dtype=np.int)
    k = 0
    for i in range(9):
        for j in range(i+1, 10):
            if S1_out[k]>=0:
                S1_res[i] += 1
            else:
                S1_res[j] += 1
            k += 1
    '''
    return np.argmax(F1_out)


success = 0
failure = 0

mnist = input_data.read_data_sets('Mnist', one_hot=True) #mnist_data
xs = mnist.test.images
ys = mnist.test.labels

for i in range(0, 10000):
    x = xs[i]*255
    re_x = x.reshape([28, 28])
    re_x = re_x.astype(np.int16)
    pre_y = cnn_func(re_x)
    if pre_y == np.argmax(ys[i]):
        success += 1
    else:
        failure += 1
    if (i + 1) % 100 == 0:
        print(i)

print('*'*20)
print('success:', success)
print('failure:', failure)
