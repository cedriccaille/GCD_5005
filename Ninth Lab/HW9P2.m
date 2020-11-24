clear;
clc;
close all;

microtubule_lengths = zeros(1,35);
peak_EB1_intensities = zeros(1,35);
c = 1; %counter

for i = 0:35
    fname = sprintf('growing_MT%04d.tif', i);
    img = imread(fname);
    
    imshow(img, [], 'InitialMagnification', 'fit');
    [x,y,P]=impixel(); %A is the assigned image name.
    Angle = (atan((y(2,1)-y(1,1))/(x(2,1)-x(1,1))))*180/3.1415;
    
    rotate_img = imrotate(img, Angle, 'nearest');
    imshow(rotate_img, [], 'InitialMagnification', 'fit');
    [x1,y1,P1]=impixel();
    
    y_avg = (y1(1,1) + y1(2,1))/2;
    length_pix = sqrt((y1(2,1)-y1(1,1))^2 +(x1(2,1)-x1(1,1))^2);
    microtubule_lengths(c) = length_pix;
    
    green_fluorescence = zeros(1,36);
    top = y_avg + 4;
    bottom = y_avg - 4;
    l = 1; %Iterator Variable
    
    for j = x1(1,1):x1(2,1)
        fluor_sum = 0;
        for k = bottom:top
            [x,y,P] = impixel(rotate_img, j,k);
            fluor_sum = fluor_sum + P(1,2);
        end
        green_fluorescence(l) = fluor_sum;
        l = l + 1;
    end
    
    peak_EB1_intensities(c) = max(green_fluorescence);
    c = c+1;
end

figure;
hold on;
subplot(2,1,1)
plot(microtubule_lengths, peak_EB1_intensities, 'rs');
xlabel('Microtubule Length')
ylabel('Peak Green Fluorescent Intensity')

subplot(2,1,2)
plot(green_fluorescence, '--go');
ylabel('Green Fluorescent Intensity')
xlabel('Maximum Microtubule Length')
hold off;
