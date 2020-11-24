clear;
clc;
close all;

n = input('How many students are there in class? ');
for i = 1:n
    students(i).ID = input('Enter student ID number ');
    students(i).hw(1) = input('Enter HW 1 Grade ');
    students(i).hw(2) = input('Enter HW 2 Grade ');
    students(i).hw(3) = input('Enter HW 3 Grade ');
    students(i).midterm = input('Enter Midterm Grade ');
    students(i).final = input('Enter Final Grade ');
    
    students(i).total = (students(i).hw(1) + students(i).hw(2) + students(i).hw(3) + students(i).midterm + students(i).final);
    students(i).hwmean = (students(i).hw(1) + students(i).hw(2) + students(i).hw(3)) / 3;
    
    students(i)
end

hold on;
subplot(1,6,1);
bar(students(1).hw);
axis([0 4 0 10]);
xlabel('HW Number')
ylabel('HW Grade Student 1')

subplot(1,6,2);
bar(students(2).hw);
axis([0 4 0 10]);
xlabel('HW Number')
ylabel('HW Grade Student 2')

subplot(1,6,3);
bar(students(3).hw);
axis([0 4 0 10]);
xlabel('HW Number')
ylabel('HW Grade Student 3')

subplot(1,6,4);
bar(students(4).hw);
axis([0 4 0 10]);
xlabel('HW Number')
ylabel('HW Grade Student 4')

subplot(1,6,5);
bar(students(5).hw);
axis([0 4 0 10]);
xlabel('HW Number')
ylabel('HW Grade Student 5')

subplot(1,6,1);
bar(students(6).hw);
axis([0 4 0 10]);
xlabel('HW Number')
ylabel('HW Grade Student 6')