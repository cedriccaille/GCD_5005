% segmentation by thresholding
clear; close all; clc;

high_SNR = imread('imageDisks.tif'); %open images

high_SNR = double(high_SNR); %allows decimal points rather than integers

% figure
% imshow(high_SNR, []); %scale the images for gray levels

% filter noise
Ss = fspecial('gaussian', 14, 2); %h = fspecial('gaussian', hsize, small sigma)hsize is the base of the gaussian; 
% hsize is usually seven times the sigma
filter_Ss = imfilter(high_SNR, Ss, 'symmetric'); %symmetric prevents image washing out; boundary condition

% figure 
% imshow(filter_Ss, [])

% filter background
Ls = fspecial('gaussian', 210, 30); %h = fspecial('gaussian', hsize, high sigma)
filter_Ls = imfilter(high_SNR, Ls, 'symmetric');

% figure 
% imshow(filter_Ls, [])

% subtract the background image from the noise image

sub = filter_Ss - filter_Ls;

% figure
% imshow(sub, [])

% normalize the image

max_sub = max(sub(:));
min_sub = min(sub(:));

norm_sub = (sub - min_sub)./(max_sub-min_sub);

%threshold and convert to binary image


disks = graythresh(norm_sub); %thresholding the image
BW = im2bw(norm_sub,disks); %making the image into binary

% figure
% imshow(BW)

%% now meaasure some things about your objects!

My_centroids = regionprops(BW, 'centroid');
centroids_xy = cat(1, My_centroids.Centroid);
% figure;
% imshow(high_SNR,[]);
% hold on;
% plot(centroids_xy(:,1),centroids_xy(:,2),'y*','MarkerSize',14);

perimeter = regionprops(BW, 'Perimeter');
area = regionprops(BW, 'Area');

perimeter_array = [perimeter.Perimeter];
area_array = [area.Area];

% figure;
% 
% subplot(1,2,1)
% histogram(perimeter_array);
% xlabel('Perimeter Length');
% ylabel('# of Objects');
% 
% subplot(1,2,2)
% histogram(area_array);
% xlabel('Area Size');
% ylabel('# of Objects');

intensity_structure = regionprops(BW,high_SNR,'MeanIntensity');
intensities_array = [intensity_structure.MeanIntensity];

figure;
plot(centroids_xy(:,1), intensities_array);
xlabel('Centroid X Coordinates');
ylabel('Intensity');

 