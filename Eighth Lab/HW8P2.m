clear;
close all;
Dog = imread('DBS_GoldRetriever_1280.jpg'); %read in the image
[x_locations,y_locations,intensities] = impixel(Dog); %select pixels on the image
imshow(Dog, []); %show the actual image

hold on;
plot(x_locations, y_locations, 'r*'); %plot points on the image
hold off;
figure;
boxplot(intensities, 'Labels', {'Red', 'Green', 'Blue'}); %make boxplot of intensities
xlabel('Color')
ylabel('Intensity')

numb_clicked_points = size(x_locations, 1); %number of points clicked on the image
stats_file = fopen('my_point_stats.txt', 'w'); %open the file to be edited
fprintf(stats_file, '%s %s %s %s %s \r\n', 'x', 'y', 'red', 'green', 'blue'); %optional: add column names
for i = 1:numb_clicked_points %from 1 to number of clicked points
    fprintf(stats_file, '%d %d %d %d %d', x_locations(i),y_locations(i),intensities(i,:)); %add each value as a separate column in the text file
    fprintf(stats_file, '\r\n'); %return and make a new line
end

fclose(stats_file); %close the file
