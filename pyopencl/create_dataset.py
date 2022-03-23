import cv2
import image
def change_brightness(img, value=30):
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    h, s, v = cv2.split(hsv)
    v = cv2.add(v,value)
    v[v > 255] = 255
    v[v < 0] = 0
    final_hsv = cv2.merge((h, s, v))
    img = cv2.cvtColor(final_hsv, cv2.COLOR_HSV2BGR)
    return img
for datax in range(100,200):
    # Opens the inbuilt camera of laptop to capture video.
    cap = cv2.VideoCapture(0)
    i = 0
    while(cap.isOpened()):
        ret, frame = cap.read()
        
        # This condition prevents from infinite looping
        # incase video ends.
        if ret == False:
            break
        if i!=64: 
            # Save Frame by Frame into disk using imwrite method
            dim = (28,28)
            img=cv2.resize(frame,dim)
            #cv2.imwrite(str(i)+'.jpg', img)
            #img = change_brightness(img, value=-100) #decreases
            cv2.imwrite("images/"+str(i)+".jpg", img)
            i += 1
            print(i)
        else:
            break
        
    cap.release()
    cv2.destroyAllWindows()


    import os
    import random
    from PIL import Image, ImageOps
    import numpy as np

    for j in range(0,8):
        for i in range(0,8):
            # read the images
            img1 = cv2.imread('images/'+str(j*8+i)+".jpg")
            if i!=0:
                # vertically concatenates images 
                # of same width 
                im_v = cv2.hconcat([im_v, img1])
            else:
                im_v = img1
        if j!=0:
            im_h = cv2.vconcat([im_h, im_v])
        else:
            im_h = im_v
    # show the output image
    cv2.imwrite('dataset/train/2_finger_slider/'+str(datax)+'.jpg',im_h)