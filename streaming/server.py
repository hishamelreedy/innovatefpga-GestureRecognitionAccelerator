from http import server
import socket, cv2, pickle, struct
import serial, re
import time

arduino = serial.Serial(port='COM7', baudrate=9600, timeout=.1)
def read():
    time.sleep(0.05)
    data = arduino.readline()
    return data
# Socket Creation
server_socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
host_name = socket.gethostname()
host_ip = socket.gethostbyname(host_name)
print('Host IP:',host_ip)
port = 9999
socket_address = (host_ip, port)

# Socket Bind
server_socket.bind(socket_address)

# Socket Listen
server_socket.listen(5)
print("Listening At: ",socket_address)

# Socket Accept
while True:
    client_socket, addr = server_socket.accept()
    print('Got Connection From: ', addr)
    if client_socket:
        vid = cv2.VideoCapture(0)
        i=0
        while(vid.isOpened()):
            img, frame = vid.read()
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
            #cv2.imshow('Transmitting',frame)
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
        cv2.imwrite('IMG.jpg',im_h)
        # test image
        im = cv2.imread('gestures/circle.jpg')

        # Collect Adxl data
        j=0
        start=0
        adxlarr=[]
        while True:
            value = read()
            if start==1:
                if i==-1:
                    i=0
                    j=0
                else:
                    i=i+3
                    j=j+1
                adxlarr.append(re.split('\t|\n',value.decode("utf-8"))[0])
                adxlarr.append(re.split('\t|\n',value.decode("utf-8"))[1])
                adxlarr.append(re.split('\t|\n',value.decode("utf-8"))[2])
                #print(j,adxlarr[j],adxlarr[j+1],adxlarr[j+2])
            if value == b'Start Demo: Simple Read\r\n':
                i=-1
                j=0
                start=1
                print(value)
            if j>62:
                break
        print("Finished")

        with open("acc2.txt") as file:
            lines = [line.rstrip() for line in file]
        #print(lines)
        for i in range(0,64*3):
            adxlarr[i] = float(lines[i])
        for co in range(0,192,3):
            print(co,adxlarr[co],adxlarr[co+1],adxlarr[co+2])
        
        msgdat = {"cam":im,"acc":adxlarr}
        a = pickle.dumps(msgdat)
        message = struct.pack("Q",len(a))+a
        client_socket.sendall(message)
        # key = cv2.waitKey(1) & 0xFF
        # if key == ord('q'):
        client_socket.close()
        break