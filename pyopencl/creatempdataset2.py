import cv2
import numpy as np
import mediapipe as mp
mp_drawing = mp.solutions.drawing_utils
mp_drawing_styles = mp.solutions.drawing_styles
mp_hands = mp.solutions.hands
classes=['0_pinch_index','1_palm_tilt','2_finger_slider','3_pinch_pinky','4_slow_swipe','5_fast_swipe','6_push','7_pull','8_finger_rub','9_circle','10_palm_hold']
# For static images:
nofsmpls=1
nofimgs=1
IMAGE_FILES = 'datasettomp/train/'+classes[0]+"/"
def change_brightness(img, value=30):
    hsv = cv2.cvtColor(img, cv2.COLOR_BGR2HSV)
    h, s, v = cv2.split(hsv)
    v = cv2.add(v,value)
    v[v > 255] = 255
    v[v < 0] = 0
    final_hsv = cv2.merge((h, s, v))
    img = cv2.cvtColor(final_hsv, cv2.COLOR_HSV2BGR)
    return img

for datax in range(0,nofsmpls):
    # Opens the inbuilt camera of laptop to capture video.
    cap = cv2.VideoCapture(0)
    i = 0
    while(cap.isOpened()):
        ret, frame = cap.read()
        
        # This condition prevents from infinite looping
        # incase video ends.
        if ret == False:
            break
        if i!=nofimgs: 
            # Save Frame by Frame into disk using imwrite method
            dim = (224,224)
            img=cv2.resize(frame,dim)
            #cv2.imwrite(str(i)+'.jpg', img)
            img = change_brightness(img, value=30) #decreases
            cv2.imwrite("images/"+str(i)+".jpg", img)
            i += 1
            print(i)
        else:
            break
        
    cap.release()
    cv2.destroyAllWindows()

    for i in range(0,nofsmpls):
        for idx in range(0, nofimgs):
            testimg=cv2.imread("images/"+str(i)+".jpg")
            # For static images:
            with mp_hands.Hands(
                static_image_mode=True,
                max_num_hands=2,
                min_detection_confidence=0.5) as hands:
                # Read an image, flip it around y-axis for correct handedness output (see
                # above).
                image = cv2.flip(testimg, 1)
                # Convert the BGR image to RGB before processing.
                results = hands.process(image)

                # Print handedness and draw hand landmarks on the image.
                print('Handedness:', results.multi_handedness)
                print(results.multi_hand_landmarks)
                if not results.multi_hand_landmarks:
                    i=i+1
                    continue
                image_height, image_width, _ = image.shape
                annotated_image = image.copy()
                for hand_landmarks in results.multi_hand_landmarks:
                    print('hand_landmarks:', hand_landmarks)
                    print(
                        f'Index finger tip coordinates: (',
                        f'{hand_landmarks.landmark[mp_hands.HandLandmark.INDEX_FINGER_TIP].x * image_width}, '
                        f'{hand_landmarks.landmark[mp_hands.HandLandmark.INDEX_FINGER_TIP].y * image_height})'
                    )
                    mp_drawing.draw_landmarks(
                        annotated_image,
                        hand_landmarks,
                        mp_hands.HAND_CONNECTIONS,
                        mp_drawing_styles.get_default_hand_landmarks_style(),
                        mp_drawing_styles.get_default_hand_connections_style())

                # Draw hand world landmarks.
                if not results.multi_hand_world_landmarks:
                    continue
                for hand_world_landmarks in results.multi_hand_world_landmarks:
                    mp_drawing.plot_landmarks(
                    hand_world_landmarks, mp_hands.HAND_CONNECTIONS, azimuth=5)
