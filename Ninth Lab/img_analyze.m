function [blot_intensities] = img_analyze(fname)
    figure;
    imshow(fname, [], 'InitialMagnification','fit');
    hold on;
    blot_intensities = zeros(1,6);
    
    for i = 1:6
        [xcor, ycor, intensities] = impixel();
        
        avg_y = (ycor(1,1) + ycor(2,1))/2;
        diff_x = (xcor(2,1) - xcor(1,1))/2;
        top = avg_y + diff_x;
        bottom = avg_y - diff_x;
        
        plot([xcor(1,1) xcor(2,1)], [bottom bottom],'w');
        plot([xcor(1,1) xcor(2,1)], [top top], 'w');
        plot([xcor(1,1) xcor(1,1)], [top bottom], 'w');
        plot([xcor(2,1) xcor(2,1)], [top bottom], 'w');
        
        overall_fluor_sum = 0;
        
        for j = xcor(1,1):xcor(2,1)
            fluor_sum = 0;
            for k = bottom:top
                [x,y,P] = impixel(fname, j, k);
                fluor_sum = fluor_sum + P(1,2);
            end
            
            overall_fluor_sum = overall_fluor_sum + fluor_sum;
        end
        
        blot_intensities(i) = overall_fluor_sum;
    
    end
    
    hold off;