clear;
clc;
close all;

fluorescence_per_nuclei = zeros(1,10);

for i = 1:10;
    fname = sprintf('hsp7%05d.tif', i);
    img = imread(fname);
    
    noise_filt = fspecial('gaussian',7,1);
    fil_img = imfilter(img,noise_filt,'symmetric');
    
    bkgrd_filt = fspecial('gaussian',35,5);
    bkgrd_img = imfilter(img,bkgrd_filt,'symmetric');
    
    process_img = fil_img - bkgrd_img;
    
    max_sub = max(process_img(:));
    min_sub = min(process_img(:));
    norm_img = (process_img - min_sub) ./ (max_sub - min_sub);
    
    norm_img = double(norm_img);
    
    thresh_mask = graythresh(norm_img);
    
    BW_img = im2bw(norm_img,thresh_mask);
    
    detected_nuclei_edges = edge(BW_img);
    labeled_nuclei = bwlabel(detected_nuclei_edges);
    num_nuclei = max(labeled_nuclei(:));
    
    BW_img = uint8(BW_img);
    
    nucleus_only_img = BW_img .* img;
%     imshow(nucleus_only_img, [], 'InitialMagnification','fit');
    
    fluorescence_per_nuclei(i) = sum(sum(nucleus_only_img(:,:,2)))/num_nuclei;
    
end

stem(fluorescence_per_nuclei, 'r')
ylabel('Hsp70 fluorescence per nucleus')
xlabel('Distance from leading edge')

