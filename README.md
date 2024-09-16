# Traffic Tracking: A Visual Processing Project at UNLV - Las Vegas

## Background Subtraction and Object Detection in Video

This project focuses on background subtraction and object detection in video, developed as an introductory exercise in visual processing. Here's an overview of the workflow:

### How It Works:

1. **Video Initialization:**
   - The video file is read, and the frame dimensions are extracted.

2. **Parameter Setup:**
   - Variables for True Positives (TP), False Positives (FP), and False Negatives (FN) are initialized.
   - The parameter "Alfa" is set for background subtraction.

3. **Initial Background:**
   - The first frame is used as the initial background for future comparison.

4. **Frame-by-Frame Processing:**
   - **a. Grayscale Conversion:** The current frame is converted to grayscale.
   - **b. Background Update:** A weighted average of the background and current frame is computed.
   - **c. Foreground Extraction:** The absolute difference between the background and current frame is taken to identify the foreground.
   - **d. Morphological Operations:** Dilation and erosion are applied to enhance the foreground mask.
   - **e. Object Detection:** Blob analysis detects objects and their bounding boxes.
   - **f. Ground Truth Comparison:** The detected bounding boxes are compared with ground truth annotations.
   - **g. TP/FP/FN Updates:** Based on the overlap ratio between detected objects and ground truth.
   - **h. Visualization:** The frame is displayed with both the ground truth and detected bounding boxes.
   - **i. Background Refresh:** The background is updated for the next frame.

5. **Final Evaluation:**
   - After all frames are processed, the final TP, FP, and FN counts are displayed.

### Purpose:

This project aims to evaluate the performance of object detection algorithms by comparing detected objects against ground truth annotations. It provides an analysis based on TP, FP, and FN values to assess the algorithm's accuracy on the given video dataset.

---

Feel free to explore the code and modify it for your own object detection and video processing experiments!
