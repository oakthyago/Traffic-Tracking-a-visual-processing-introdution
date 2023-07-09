# Traffic Tracking was a visual processing introdution work made on UNLV - Las Vegas

# Background Subtraction and Object Detection in Video

This code performs background subtraction and object detection in a video. Here's a summary of how it works:

1. The code starts by reading the video file and extracting the dimensions of the frames.

2. It initializes variables for TP (True Positive), FP (False Positive), and FN (False Negative) counts, as well as a parameter called "Alfa" for background subtraction.

3. The first frame of the video is taken as the initial background.

4. The code then goes through each frame of the video and performs the following steps:

   a. Convert the current frame to grayscale and calculate the updated background using a weighted average of the previous background and the current frame.

   b. Compute the absolute difference between the current frame and the updated background to obtain the foreground.

   c. Apply morphological operations (dilation and erosion) to enhance the foreground mask.

   d. Perform blob analysis to detect objects in the foreground and obtain their bounding boxes.

   e. Read the ground truth bounding box annotations from a file.

   f. Compare the detected bounding boxes with the ground truth annotations to determine the overlap ratio.

   g. Update the TP, FP, and FN counts based on the overlap ratio and the number of objects in the ground truth annotations.

   h. Display the original frame with ground truth and detected bounding boxes.

   i. Update the background frame for the next iteration.

5. After processing all the frames, the code displays the final TP, FP, and FN counts.

The purpose of this code is to evaluate the performance of object detection algorithms by comparing the detected bounding boxes with ground truth annotations. It calculates TP, FP, and FN values to assess the accuracy of the object detection algorithm on the given video dataset.
