clear;
clc;
close all;

my_img = imread('brdu.tif');
my_img2 = imread('dapi.tif');

my_img = double(my_img);
my_img2 = double(my_img2);

noise_filter = fspecial('gaussian',14,2);
fil_img = imfilter(my_img, noise_filter,'symmetric');
fil_img2 = imfilter(my_img2, noise_filter, 'symmetric');

bkgrd_filter = fspecial('gaussian',140,20);
bkgrd_img = imfilter(my_img, bkgrd_filter, 'symmetric');
bkgrd_img2 = imfilter(my_img2, bkgrd_filter, 'symmetric');

process_img = fil_img - bkgrd_img;
process_img2 = fil_img2 - bkgrd_img2;

max_sub = max(process_img(:));
max_sub2 = max(process_img2(:));
min_sub = min(process_img(:));
min_sub2 = min(process_img2(:));
norm_img = (process_img - min_sub) ./ (max_sub - min_sub);
norm_img2 = (process_img2 - min_sub2) ./ (max_sub2 - min_sub2);

thresh_mask = graythresh(norm_img);
thresh_mask2 = graythresh(norm_img2);

BW_img = im2bw(norm_img, thresh_mask);
BW_img2 = im2bw(norm_img2, thresh_mask2);

edge_det = edge(BW_img);
edge_det2 = edge(BW_img2);

labeled_list = bwlabel(edge_det);
labeled_list2 = bwlabel(edge_det2);
RGB_img = label2rgb(labeled_list);
RGB_img2 = label2rgb(labeled_list2);
figure;
imshow(RGB_img,[],'InitialMagnification','fit');
figure;
imshow(RGB_img2,[],'InitialMagnification','fit');

number_obj = max(labeled_list(:));
number_obj2 = max(labeled_list2(:));

perc_incorp = (number_obj2 / number_obj) * 100;




