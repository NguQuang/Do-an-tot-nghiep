# importing libraries
import cv2
import numpy as np
import sys
import os

# Check if correct number of arguments is given
if len(sys.argv) != 3:
    print("Usage: python file.py input-file output-folder")
    sys.exit(1)

# Read input file and output folder from command line arguments
input_file = sys.argv[1]
output_folder = sys.argv[2]

# Create a VideoCapture object and read from input file
cap = cv2.VideoCapture(input_file)

# Check if video opened successfully
if not cap.isOpened():
    print(f"Error opening video file {input_file}")
    sys.exit(1)

# Ensure the output folder exists
if not os.path.exists(output_folder):
    os.makedirs(output_folder)

i = 0
while cap.isOpened():
    # Capture frame-by-frame
    ret, frame = cap.read()

    if ret:
        # Generate filename with leading zeros, up to 6 digits
        s = f"{i:06d}"

        cv2.imwrite(os.path.join(output_folder, s + ".jpg"), frame)

        i += 1
        print(f"Saved frame {i}")

    # Break the loop if no more frames
    else:
        break

# When everything done, release the video capture object
cap.release()

# Closes all the frames
cv2.destroyAllWindows()
