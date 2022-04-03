import cv2
import numpy as np
import mediapipe as mp
import time
mp_drawing = mp.solutions.drawing_utils
mp_drawing_styles = mp.solutions.drawing_styles
mp_hands = mp.solutions.hands
nofsmples=11
nofframes=64
classes=['0_pinch_index','10_palm_hold','1_palm_tilt','2_finger_slider','3_pinch_pinky','4_slow_swipe','5_fast_swipe','6_push','7_pull','8_finger_rub','9_circle']
classidx=10
files=[]
for idx2 in range(0,nofsmples):
    resultarr=[]
    cap = cv2.VideoCapture(0)
    # For webcam input:
    for fr in range(0,nofframes):
        with mp_hands.Hands(
            model_complexity=0,
            max_num_hands=1,
            min_detection_confidence=0.5,
            min_tracking_confidence=0.5) as hands:
            success, image = cap.read()
            if not success:
                print("Ignoring empty camera frame.")
            # If loading a video, use 'break' instead of 'continue'.
                continue
            # To improve performance, optionally mark the image as not writeable to
            # pass by reference.
            image.flags.writeable = False
            image = cv2.cvtColor(image, cv2.COLOR_BGR2RGB)
            results = hands.process(image)
            # Draw the hand annotations on the image.
            image.flags.writeable = True
            image = cv2.cvtColor(image, cv2.COLOR_RGB2BGR)
            image_height, image_width, _ = image.shape
            if results.multi_hand_landmarks:
                for hand_landmarks in results.multi_hand_landmarks:
                    mp_drawing.draw_landmarks(
                        image,
                        hand_landmarks,
                        mp_hands.HAND_CONNECTIONS,
                        mp_drawing_styles.get_default_hand_landmarks_style(),
                        mp_drawing_styles.get_default_hand_connections_style())
                    # print(
                    #     f'Wrist coordinates: (',
                    #     f'{hand_landmarks.landmark[mp_hands.HandLandmark.WRIST].x * image_width}, '
                    #     f'{hand_landmarks.landmark[mp_hands.HandLandmark.WRIST].y * image_height})'
                    # )
                    resultarr.append(str(hand_landmarks.landmark[mp_hands.HandLandmark.WRIST].x * image_width))
                    resultarr.append(str(hand_landmarks.landmark[mp_hands.HandLandmark.WRIST].y * image_height))
                    resultarr.append(str(hand_landmarks.landmark[mp_hands.HandLandmark.INDEX_FINGER_TIP].z*10000))
            else:
                resultarr.append(0.0)
                resultarr.append(0.0)
                resultarr.append(0.0)
            # Flip the image horizontally for a selfie-view display.
            #cv2.imshow('MediaPipe Hands', cv2.flip(image, 1))
            #cv2.waitKey(1000)
            #time.sleep(1)
            print(idx2,fr)
            print(len(resultarr))
    resultarr.append(str(classidx))
    cap.release()
    files.append(resultarr)

#print(resultarr)
#print(len(resultarr))
import csv
names=[]
for i in range(0,nofframes):
    names.append('frame_'+str(i)+"_x")
    names.append('frame_'+str(i)+"_y")
    names.append('frame_'+str(i)+"_z")
names.append('class')
#print(files)
with open('datasettomp/train/'+classes[classidx]+'/dataset.csv', 'w') as f: 
    write = csv.writer(f) 
    write.writerow(names)
    for i in range(0,nofsmples): 
        write.writerow(files[i])