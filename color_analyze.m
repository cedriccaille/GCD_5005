%define function at top and establish inputs/outputs
function [Rpixel_intensities, Gpixel_intensities, Bpixel_intensities] = color_analyze(fname, Rpixel_intensities, Gpixel_intensities, Bpixel_intensities)
   %read each filename into an image
   img = imread(fname);
   %display image in a window, magnifies and fits to window
   imshow(img, [], 'InitialMagnification', 'fit');
   %loop for each point clicked on the image
   for i = 1:3
       %allows user to click on image and mark points. records x-value,
       %y-value, and RGB pixel intensities for each point
       [x,y,P] = impixel();
       %store pixel intensities into respective arrays
       Rpixel_intensities(i) = P(i, 1);
       Gpixel_intensities(i) = P(i, 2);
       Bpixel_intensities(i) = P(i, 3);

   end
   
   %average values and write over arrays
   Rpixel_intensities = mean(Rpixel_intensities);
   Gpixel_intensities = mean(Gpixel_intensities);
   Bpixel_intensities = mean(Bpixel_intensities);