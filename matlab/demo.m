function demo(img_path, det_path, seq_name, ROI_path, img_save_path, result_save_path, video_save_path)
    % close all % Bạn có thể giữ lại lệnh này nếu muốn đóng tất cả các cửa sổ đồ thị trước khi chạy
    % clear     % Xóa lệnh này hoặc thay thế nó bằng clearvars nếu bạn không muốn xóa tất cả các biến
    clc
 

    %% dataset path
    % img_path = 'C:\Users\buildpc.shop\Desktop\1';
    % det_path = 'C:\Users\buildpc.shop\Desktop\DATN\yolov7\runs\detect\exp48\det.txt';
    % seq_name = 'test';
    % ROI_path = [];
    % img_save_path = 'C:\Users\buildpc.shop\Desktop\New folder';
    % result_save_path = 'C:\Users\buildpc.shop\Desktop\New folder';
    % video_save_path = 'C:\Users\buildpc.shop\Desktop\New folder';

    %% parameter setting
    param.det_score_thresh = 0.1;   % detection score threshold, [0,1]
    param.IOU_thresh = 0.4;         % IOU threshold for detection asscociation 
                                    % across frames, [0,1]
    param.color_thresh = 0.15;      % color threshold for detection asscociation 
                                    % across frames, [0,1]                              
    param.lambda_time = 25;         % time interval cost
    param.lambda_split = 0.35;      % tracklet separation cost
    param.lambda_reg = 0.2;         % smoothness cost
    param.lambda_color = 0.25;      % color change cost
    param.lambda_grad = 8;          % velocity change cost

    %% tracklet clustering tracking
    TC_tracker(img_path,det_path,ROI_path,param,img_save_path,seq_name,...
        result_save_path,video_save_path);
end
