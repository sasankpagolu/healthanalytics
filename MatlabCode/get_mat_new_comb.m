function walking_final = get_mat_new_comb(filename,WINDOW_SIZE,SLIDE,value)

    fid = fopen(filename);
    walking = textscan(fid,'%f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %f %s','Delimiter',',');
    fclose(fid);
    walking(:,24) = [];
    walking = cell2mat(walking);
    walking = sortrows(walking,2);
    time = walking(:,2);
    walking = walking(:,3:23);
    walking(1,:) = [];
    time(1,:) = [];
    walking_final= [];
    for i = 1:3:size(walking,2)
        walking_features = compute_features_new(time,walking(:,i:i+2),WINDOW_SIZE,SLIDE,250);
        walking_final = [walking_final,walking_features];
    end
    walking_final  = [walking_final,ones(size(walking_final,1),1).*value];
end


    