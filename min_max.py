import numpy as np
import pandas as pd
from pandas import Series, DataFrame

#PATH
#input_path="/home/changwan/GMT/A_SCOPE_GPR.txt"
#input_path2="/home/changwan/GMT/B_SCAN_IMAGE_GPR.txt"
input_path3="/home/changwan/GMT/B_SCAN_IMAGE_GPR.txt"



#READ DATASET
#data=np.loadtxt(input_path)
#data2=np.loadtxt(input_path2)
data3=np.loadtxt(input_path3)



#print(data.shape)
print("shape=",data3.shape)
print("min=",np.min(data3))
print("max=",np.max(data3))


"""
print("RESHAPE THE MATRIX")
print("TYPE THE SHAPE THAT YOU WANT TO MAKE")

i = input("TYPE THE ROW = ")
j = input("TYPE THE COLUMN = ")
print("i=",i)
print("j=",j)

i = int(i)
j = int(j)
data3=data3.reshape(i,j)
print(data3.shape)

np.savetxt('B_SCAN_IMAGE_GPR2.txt', data3, fmt='%.2f')
"""

