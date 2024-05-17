function writeTxt(seq_name,track_struct_path,save_path,dataset)

load([track_struct_path,'/',seq_name,'.mat']);

%% UA-Detrac dataset
if strcmp(dataset,'UA-Detrac')>0
    X = track_struct.tracklet_mat.xmin_mat';
    Y = track_struct.tracklet_mat.ymin_mat';
    W = track_struct.tracklet_mat.xmax_mat'-X+1;
    H = track_struct.tracklet_mat.ymax_mat'-Y+1;
    W(X<0) = 0;
    H(X<0) = 0;
    Y(X<0) = 0;
    X(X<0) = 0;
    
    fileID = fopen([save_path,'/',seq_name,'_LX.txt'],'w');
    for r = 1:size(X,1)
        for c = 1:size(X,2)
            fprintf(fileID,'%f',X(r,c));
            if c~=size(X,2)
                fprintf(fileID,',');
            else
                fprintf(fileID,'\n');
            end
        end
    end
    fclose(fileID);
    
    fileID = fopen([save_path,'/',seq_name,'_LY.txt'],'w');
    for r = 1:size(X,1)
        for c = 1:size(X,2)
            fprintf(fileID,'%f',Y(r,c));
            if c~=size(X,2)
                fprintf(fileID,',');
            else
                fprintf(fileID,'\n');
            end
        end
    end
    fclose(fileID);
    
    fileID = fopen([save_path,'/',seq_name,'_W.txt'],'w');
    for r = 1:size(X,1)
        for c = 1:size(X,2)
            fprintf(fileID,'%f',W(r,c));
            if c~=size(X,2)
                fprintf(fileID,',');
            else
                fprintf(fileID,'\n');
            end
        end
    end
    fclose(fileID);
    
    fileID = fopen([save_path,'/',seq_name,'_H.txt'],'w');
    for r = 1:size(X,1)
        for c = 1:size(X,2)
            fprintf(fileID,'%f',H(r,c));
            if c~=size(X,2)
                fprintf(fileID,',');
            else
                fprintf(fileID,'\n');
            end
        end
    end
    fclose(fileID);
end

%% MOT dataset
if strcmp(dataset,'MOT')>0
    xmin_mat = track_struct.tracklet_mat.xmin_mat;
    ymin_mat = track_struct.tracklet_mat.ymin_mat;
    xmax_mat = track_struct.tracklet_mat.xmax_mat;
    ymax_mat = track_struct.tracklet_mat.ymax_mat;
    class_mat = track_struct.tracklet_mat.class_mat; 
    det_score_mat = track_struct.tracklet_mat.det_score_mat;
    N_id = size(xmin_mat,1);
    N_fr = size(xmin_mat,2);
    fileID = fopen([save_path,'/',seq_name,'.txt'],'w');
    for t = 1:N_fr
        for n = 1:N_id
            if xmin_mat(n,t)==-1
                continue
            end
            xmin = round(xmin_mat(n,t));
            ymin = round(ymin_mat(n,t));
            w = round(xmax_mat(n,t))-xmin;
            h = round(ymax_mat(n,t))-ymin;
            class_id = class_mat{n,t}; 
            score = det_score_mat(n,t); 
            fprintf(fileID,'%d,%d,%d,%d,%d,%d,%f,%d,%d,%d,%d\n',t,n,xmin,ymin,...
                w,h,score, -1,-1,-1,class_id);
        end
    end
    fclose(fileID);
end
