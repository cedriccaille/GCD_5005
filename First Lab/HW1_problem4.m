%Problem #4: Random Number Generation
rng('shuffle') % seeds program using MATLAB clock
my_uniform_1 = rand % generates random number between 0 and 1, assigns to variable
my_uniform_2 = rand * 100 % random number between 0 and N, where N = 100, assigns to variable
my_uniform_3 = (rand*(25 - 2)) + 2 % random number between 2 and 25

my_gaussian_1 = randn % makes 1 gaussian random with mean = 0, SD = 1
my_gaussian_2 = (randn*10) + 5 % gaussian random with SD = 10 and mean = 5