#some set up
import numpy as np
from PIL import Image

# load the test image
im_path = r'circle.jpg'
im = Image.open(im_path)

# Read Image into Numpy Array
im_input = np.asarray(im)

# Reshape Input to be (3,224,224) instead of (224,224,3)
tmp = np.zeros((3,224,224))
for i in range(0,224):
    for j in range(0,224):
        for k in range(0,3):
            tmp[k][i][j] = im_input[i][j][k]
#add a new axis for pytorch model
im_input = tmp[np.newaxis,:]
print(im_input.shape)
#preprocess of the input image
y = np.zeros((1,3,224,224))
for i in range(0, 3):
    for j in range(0, 224):
        for k in range(0, 224):
            y[0][i][j][k] = (im_input[0][i][j][k]/255 - 0.5)/0.5

# Collect data in rows to be written into file
x=[]
for i in range(0, 3):
    for j in range(0, 224):
        for k in range(0, 224):
            x.append(str(y[0][i][j][k])[:8])
a=np.array(x).reshape(18816,8)

with open('pic.txt', 'w') as testfile:
    for row in range(0,len(a)):
        for x in range(0, len(a[row])):
                testfile.write(a[row][x])
                testfile.write('\n')
