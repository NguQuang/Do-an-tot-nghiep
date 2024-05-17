# VD_2_IMG -> Detection(yolov7) -> Tracking(matlab)

### Task 1: VD_2_IMG
1. Mở file `vd_2_img.py`
2. Chạy lệnh
```python vd_2_img.py <input_video_path> <output_image_folder_path>```

Đầu ra là folder chứa ảnh index bắt đầu từ 000000.jpg

### Task 2:Detection (yolov7)
1. cd `./yolov7`
2. Chạy lệnh
```pip install -r requirements.txt```
3. Download model train [MODEL](https://drive.google.com/file/d/1t7p_Wvg_6bNDkRdh9ZBgZr4Z75Vh5kj8/view?usp=drive_link)
4. Chạy lệnh 
```python ./detect.py --weights <model_train_path> --sources <input_video_path> --save-txt```
5. Kết quả được lưu tại `./runs/detect`

Đầu ra là video được gán nhãn và file text det.txt chưa kết quả gán nhãn theo format YOLO

### Task 3: Tracking(matlab)
1. Mở `./matlab` bằng matlab
2.  Chạy lệnh
``` demo('<output_image_folder_path_task1>','<output_det.txt_path_task2>','<output_video_name>','','<folder_save_img_path>','<folder_save_result.txt>','<folder_save_video_path>')```

Ex: ```demo('/task3/task1/images', '/task3/task2/det.txt', 'test', '', '/task3/test', '/task3/test', '/task3/test'); ```

Đầu ra là video được theo vết, các khung hình được cắt ra từ video tracking, file det.txt lưu kết quả theo vết