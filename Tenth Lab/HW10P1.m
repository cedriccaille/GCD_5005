clear;
clc;
close all;

%read in the image
img_disks = imread('imageDisks.tif');
%convert matrix to decimals
img_disks = double(img_disks);

%show initial image
figure;
imshow(img_disks,[], 'InitialMagnification','fit');

%filter noise and show new image
my_noise_filter = fspecial('gaussian',14,2);
fil_img = imfilter(img_disks, my_noise_filter, 'symmetric');
figure;
imshow(fil_img,[], 'InitialMagnification','fit');

%filter background and show new image
my_bkgrd_filter = fspecial('gaussian',140,20);
bkgrd_img = imfilter(img_disks,my_bkgrd_filter,'symmetric');
figure;
imshow(bkgrd_img,[], 'InitialMagnification','fit');

%band-pass filter
my_processed_img = fil_img - bkgrd_img;
figure;
imshow(my_processed_img, [], 'InitialMagnification','fit');

%normalize image
max_sub = max(my_processed_img(:));
min_sub = min(my_processed_img(:));
norm_img = (my_processed_img - min_sub) ./ (max_sub - min_sub);

%make threshold mask
my_thres_mask = graythresh(norm_img);
%apply mask
BW_img = im2bw(norm_img, my_thres_mask);
%show product
figure;
imshow(BW_img, [], 'InitialMagnification','fit');

%find edges
my_edge_det = edge(BW_img);
figure;
imshow(my_edge_det, [], 'InitialMagnification','fit');

%count objects
labeled_list = bwlabel(my_edge_det);
RGB_img = label2rgb(labeled_list);
figure;
imshow(RGB_img, [], 'InitialMagnification','fit');








