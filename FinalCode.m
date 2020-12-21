clear; clc; close all;

%initialize 3 arrays to put into function
Rpixel_intensities = zeros(1,3);
Gpixel_intensities = zeros(1,3);
Bpixel_intensities = zeros(1,3);

%write movie, assign framerate, and open object
aviobj = VideoWriter('mymovie.avi');
aviobj.FrameRate = 1;
open(aviobj);

%loop for each image analyzed
for i = 1:11
    %assign fname with filename for each image. first image is
    %"chameleon02_RGB.tif" which explains the need for i+1
    fname = sprintf('chameleon%02d_RGB.tif', i+1);
    %call function, input arrays and fname
    [Rpixel_intensities, Gpixel_intensities, Bpixel_intensities] = color_analyze(fname, Rpixel_intensities, Gpixel_intensities, Bpixel_intensities);
    %create structure called "color_intensities", create fields for Red,
    %Green, and Blue, and assign a pixel intensity value to it. each field
    %has a new row for each image
    color_intensities(i).R = Rpixel_intensities;
    color_intensities(i).G = Gpixel_intensities;
    color_intensities(i).B = Bpixel_intensities;
    
    %code for barplots to put in movie. figure command used to smooth out
    %plots in movie. hold on to plot each bar in the same graph, and color
    %each bar based on pixel color
    figure
    hold on;
    bar(1, color_intensities(i).R, 'r');
    bar(2, color_intensities(i).G, 'g'); 
    bar(3, color_intensities(i).B, 'b');
    hold off;
    %label and define axes
    ylabel('Pixel Intensity');
    axis([0 4 50 250])
    set(gca, 'xtick', [1:3], 'xticklabel', {'Red', 'Green', 'Blue'})
    %each plot for each image is stored as a frame, and the frame is
    %written to the movie
    frame = getframe(gcf);
    writeVideo(aviobj, frame);
    
end

%calculate standard error for each field in the structure to make error
%bars
STErr_R = std([color_intensities.R]) / length([color_intensities.R]);
%need to repeat the standard error value for the length of values in each
%structure field. The sterror value has to correspond to each data point
err_R = repelem([STErr_R],length([color_intensities.R]));
STErr_G = std([color_intensities.G]) / length([color_intensities.G]);
err_G = repelem([STErr_G],length([color_intensities.G]));
STErr_B = std([color_intensities.B]) / length([color_intensities.B]);
err_B = repelem([STErr_B],length([color_intensities.B]));
%plot a line graph for each structure field with error bars at each data
%point
errorbar([color_intensities.R], err_R, 'r');
%use hold on to plot all values and lines on same graph
hold on;
errorbar([color_intensities.G], err_G, 'g');
errorbar([color_intensities.B], err_B, 'b');
%make axes limits
axis([0 12 50 250])
%axes labels
ylabel('Pixel Intensity');
xlabel('Chameleon Color');
%assign names for the x-axis
names = {'', 'Scarlet', 'Fuschia', 'Grass', 'Yellow', 'Lemon', 'Teal', 'Aqua', 'Brown', 'Indigo', 'Dark Red', 'Brick', ''};
set(gca, 'xtick', [0:12], 'xticklabel', names)
xtickangle(45)
%close off plot
hold off;

%close movie to save
close(aviobj);


