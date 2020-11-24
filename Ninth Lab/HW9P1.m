%HW9 Top Level Script

clear;
clc;
close all;

fname = imread('acetylation.tif');
[acetylated_blot_intensities] = img_analyze(fname);
fname2 = imread('loading_control.tif');
[loading_control_intensities] = img_analyze(fname2);
normalized_intensity = acetylated_blot_intensities ./ loading_control_intensities;
times = [0 10 20 30 60 90];
plot(times, normalized_intensity)
xlabel('Time (min)')
ylabel('Normalized Intensity')

fclose('all');