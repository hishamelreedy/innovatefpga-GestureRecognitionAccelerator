import serial, re
import time

arduino = serial.Serial(port='COM3', baudrate=9600, timeout=.1)
def read():
    time.sleep(0.05)
    data = arduino.readline()
    return data
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
        print(j,adxlarr[i],adxlarr[i+1],adxlarr[i+2])
    if value == b'Start Demo: Simple Read\r\n':
        i=-1
        j=0
        start=1
        print(value)
    if j>62:
        break

print("Finished")