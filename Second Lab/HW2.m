clear;

%Problem 1
%Part A
I = [1,2,8,4,9,10]
%Part B
J = [1;2;8;4;9;10]
%Part C
K = [1,2;8,4;9,10]
%Part D
L = [1,2,8;4,9,10]

%Problem 2
%Part A
fahrenheight_temp = [-100:5:-50;-50:5:0;0:5:50;50:5:100]
%Part B
celsius_temp = round(((fahrenheight_temp - 32) .* 5) ./ 9)
%Part C
winter_temp_deg_F = fahrenheight_temp(3,3)
summer_temp_deg_C = celsius_temp(4,7)
%Part D
fahrenheight_temp(1,5) = 100
celsius_temp(3,10) = 100

%Problem 3
%Part A
My_array = [0:3:12;7:2:15;0:2:8]
%Part B
My_array = My_array + 1
%Part C
My_array(1,:) = 3
%Part D
My_array = My_array .* 2
%Part E
My_array(1,3:4) = 10
%Part F
My_array = My_array - 3
%Part G
My_array(2,:) = My_array(2,:) - 10
%Part H
My_array(:,4) = ((My_array(:,4) - 1) ./ 2)
%Part I
My_array(2,3) = My_array(2,3) - 6
%Part J
My_array = My_array .^ 2
%Part K
My_array = My_array'

%Problem 4
Initial_array = [1,5,8,9,15,30;4,5,6,7,3,2;6,7,4,3,2,3;-3,-5,-7,-9,-10,-3]
My_sub_array_1 = Initial_array(:,2:3)
My_sub_array_2 = Initial_array(3,3:6)
My_sub_array_3 = Initial_array(1:2,1:2)
My_sub_array_4 = Initial_array(2:4,:)









