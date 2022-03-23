import re
my_file = open("accel.txt", "r")
content = my_file.read()
content_list = re.split('\t|\n',content)
my_file.close()
import csv
classnames=['0_pinch_index','1_palm_tilt','2_finger_slider','3_pinch_pinky','4_slow_swipe','5_fast_swipe','6_push','7_pull','8_finger_rub','9_circle','10_palm_hold']
idx=19
classidx=9
print(classnames[classidx])
with open('acceldataset/'+classnames[classidx]+'/'+str(idx)+'.csv', 'w', newline='') as accfile:
    writer = csv.writer(accfile)
    row = ['wristX','wristY','wristZ','class_type']
    writer.writerow(row)
    for i in range (0,16):
        row = [content_list[i*3],content_list[i*3+1],content_list[i*3+2],classnames[classidx]]
        writer.writerow(row)
