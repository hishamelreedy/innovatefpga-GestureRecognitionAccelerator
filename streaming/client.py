import socket, pickle, struct
import numpy as np

# Create Socket
client_socket = socket.socket(socket.AF_INET,socket.SOCK_STREAM)
host_ip = '192.168.137.1'
port = 9999
client_socket.connect((host_ip,port))
data = b""
payload_size = struct.calcsize("Q")
im=[]
while True:
    while len(data) < payload_size:
        packet = client_socket.recv(4*1024) #4k
        if not packet: break
        data += packet
    packed_msg_size = data[:payload_size]
    data = data[payload_size:]
    msg_size = struct.unpack("Q",packed_msg_size)[0]
    while len(data) < msg_size:
        data += client_socket.recv(4*1024)
    frame_data = data[:msg_size]
    data = data[msg_size:]
    frame = pickle.loads(frame_data)
    print(frame)
    im=frame["cam"]
    break
    # cv2.imshow("Received",frame)
    # key = cv2.waitKey(1) & 0xFF
    # if key == ord('q'):
    #     break
print(im.shape)
# Reshape Input to be (3,224,224) instead of (224,224,3)
tmp = np.zeros((3,224,224))
for i in range(0,224):
    for j in range(0,224):
        for k in range(0,3):
            tmp[k][i][j] = im[i][j][k]
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
with open('acc.txt','w') as accfile:
    for i in range(0, len(frame["acc"])):
        accfile.write(str(frame["acc"][i]))
        accfile.write('\n')
import os
cmd = './gesturenet'
os.system(cmd)
client_socket.close()