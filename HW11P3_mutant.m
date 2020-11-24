clear;
clc;
close all;

Spindle_array = zeros(1,68);
time_lapse_vector = zeros(1,68);

for i = 1:68
    fname = sprintf('RGB%04d.tif', i-1);
    img = imread(fname);
    
    Ss = fspecial('gaussian', 7, 1);
    filter_Ss = imfilter(img, Ss, 'symmetric');
    
    Ls = fspecial('gaussian', 28, 4);
    filter_Ls = imfilter(img, Ls, 'symmetric');
    
    sub = filter_Ss - filter_Ls;
    
    max_sub = max(sub(:));
    min_sub = min(sub(:));
    
    norm_sub = (sub - min_sub) ./ (max_sub - min_sub);
    
    norm_sub = double(norm_sub);
    
    mutant = graythresh(norm_sub);
    BW = im2bw(norm_sub,mutant);
    
    My_centroids = regionprops(BW,'centroid');
    centroids_xy = cat(1, My_centroids.Centroid);
    
    figure;
    imshow(img,[], 'InitialMagnification','fit');
    hold on;
    plot(centroids_xy(:,1),centroids_xy(:,2),'r*', 'MarkerSize',8);
    pause;
    hold off;
    
    SpindleLength = ((centroids_xy(1,1) - centroids_xy(2,1))^2 + ((centroids_xy(1,2) - centroids_xy(2,2))^2))^0.5;
    Spindle_array(i) = SpindleLength;
    time_lapse_vector(i) = i-1;
end

figure;
plot(time_lapse_vector, Spindle_array, 'b*');
xlabel('Time (minutes)')
ylabel('Spindle Length (pixels)')