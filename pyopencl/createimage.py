import numpy as np
from PIL import Image
def get_concat_h(im1, im2):
    dst = Image.new('RGB', (im1.width + im2.width, im1.height))
    dst.paste(im1, (0, 0))
    dst.paste(im2, (im1.width, 0))
    return dst

def get_concat_v(im1, im2):
    dst = Image.new('RGB', (im1.width, im1.height + im2.height))
    dst.paste(im1, (0, 0))
    dst.paste(im2, (0, im1.height))
    return dst

for j in range(0,8):
    for i in range(0,8):
        # read the images
        img1 = Image.open('testvideo/'+str(j*8+i)+".jpg")
        if i!=0:
            # vertically concatenates images 
            # of same width 
            im_v=get_concat_h(im_v,img1)
        else:
            im_v = img1
    if j!=0:
        im_h = get_concat_v(im_h,im_v)
    else:
        im_h = im_v
# show the output image
im_h.save('test.jpg')
