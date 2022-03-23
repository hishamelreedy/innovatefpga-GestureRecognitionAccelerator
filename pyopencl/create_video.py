import cv2
def change_brightness(img, value=30):
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    h, s, v = cv2.split(hsv)
    v = cv2.add(v,value)
    v[v > 255] = 255
    v[v < 0] = 0
    final_hsv = cv2.merge((h, s, v))
    img = cv2.cvtColor(final_hsv, cv2.COLOR_HSV2BGR)
    return img
for datax in range(0,1):
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
            cv2.imwrite("testvideo/"+str(i)+".jpg", img)
            i += 1
            print(i)
        else:
            break