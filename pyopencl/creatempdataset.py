import cv2
import numpy as np
import mediapipe as mp
mp_drawing = mp.solutions.drawing_utils
mp_drawing_styles = mp.solutions.drawing_styles
mp_hands = mp.solutions.hands
classes=['0_pinch_index','1_palm_tilt','2_finger_slider','3_pinch_pinky','4_slow_swipe','5_fast_swipe','6_push','7_pull','8_finger_rub','9_circle','10_palm_hold']
# For static images:
IMAGE_FILES = 'dataset/train/'+classes[0]+"/"

for i in range(0,1):
    img = cv2.imread(IMAGE_FILES+str(i)+".jpg")
    testimg = np.zeros((28,28,3),dtype=np.uint8)
    for fr in range(0,3):
        x2=0
        for x in range (fr*28,fr*28+28):
            y2=0
            for y in range(fr*28,fr*28+28):
                for z in range(0,3):
                    testimg[x2][y2][z] = img[x][y][z]
                y2=y2+1
            x2=x2+1
    # For static images:
    with mp_hands.Hands(
        static_image_mode=True,
        max_num_hands=1,
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
print(img.shape)
print(testimg.shape)
cv2.imshow("test",img)
cv2.waitKey(1000)
cv2.imshow("test2",testimg)
cv2.waitKey(1000)
cv2.imwrite("test.jpg",testimg)

