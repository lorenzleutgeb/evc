%
% Copyright 2016 Vienna University of Technology.
% Institute of Computer Graphics and Algorithms.
%

function[P1P2_saved, P2P3_saved, P3P1_saved, Normal_normalized, P1P2_length, P2P3_length, P3P1_length, Area, alpha, beta, gamma, angles_sum, angles_max, angles_min, angles_avg] = Triangles()
%% General Hints:
% If you want to check your implementation you can:
% -) Set a breakpoint to access variables at a certain point in the 
% script. You can inspect their contents in the 'Workspace' window
% (The 'Workspace' window is usually on the right side of Matlab. 
%  If it is hidden, you can open it in the menu: Home/Environment/Layout/Show/Workspace).
% -) Leave out the ';' at the end of a statement/line so the result will be
% printed out in the command window.
% -) Do not rename the predefined variables, or else our test-system won't
% work (which is bad for both parties ;) )
%% I. Triangles
%% 1) Construct 3 Vectors representing 3 Points that define a triangle.
% Create the points P1, P2 and P3 with the following coordinates
% P1 =
%      1+G      -(1+B)      -(1+C)
% P2 =
%      -(1+E)   -(1+A)      1+F
% P3 =
%      -(1+D)   1+C         -(1+B)
% Where A,B,C,D,E,F,G are digits of your matriculation number in the following order:
% matriculation number: 'ABCDEFG'

A = 1;
B = 1;
C = 2;
D = 7;
E = 8;
F = 4;
G = 2;

P1 = [ 1 + G, -(1 + B), -(1 + C) ];
P2 = [ -(1 + E), -(1 + A), 1 + F ];
P3 = [ -(1 + D), 1 + C, -(1 + B) ];

%% 2) Construct the 3 vectors of the triangle: P1P2, P2P3 and P3P1
% P1P2 is pointing from P1 to P2
% P2P3 is pointing from P2 to P3
% P3P1 is pointing from P3 to P1

P1P2 = P1 - P2;
P2P3 = P3 - P2;
P3P1 = P1 - P3;

% your results are saved for later evaluation:
P1P2_saved = P1P2; % DON'T OVERRIDE P1P2_saved !!!
P2P3_saved = P2P3; % DON'T OVERRIDE P2P3_saved !!!
P3P1_saved = P3P1; % DON'T OVERRIDE P3P1_saved !!!

%% 3) Calculate the length of each edge
% The positive length or magnitude of a vector is also known as the euclidian 
% 'norm' of this vector. 
% ATTENTION: you are not allowed to use the function 'norm' for this task,
% but you can compare the results of your calculation with the results you
% get by using the built-in Matlab function 'norm'.

P1P2_length = sqrt(P1P2(1) ^ 2 + P1P2(2) ^ 2 + P1P2(3) ^ 2);
P2P3_length = sqrt(P2P3(1) ^ 2 + P2P3(2) ^ 2 + P2P3(3) ^ 2);
P3P1_length = sqrt(P3P1(1) ^ 2 + P3P1(2) ^ 2 + P3P1(3) ^ 2);

%% 4) Compute the face normal of the triangle
% You can use the functions from MatlabBasics.m
% equivalents(e.g. cross, dot, norm, etc.).
% normalize the normal!

Normal = cross(P1P2, P2P3);
Normal_normalized = Normal ./ norm(Normal);

%% 5) Compute the Area of your triangle
% You can use functions you have programmed until now or their Matlab
% equivalents(e.g. cross, dot, norm, etc.).
% Beware of the direction of your vectors!

Area = norm(cross(-P1P2, P2P3)) / 2;

%% 6) Calculate the 3 angles of your triangle (in degrees)
% Name them 'alpha' at P1, 'beta' at P2 and 'gamma' at P3
% Beware of the direction and length of your vectors!
% You may use built-in Matlab functions.
% Use the matlab function 'acosd' to get the arccosine in degrees.
% Check your solution: Does the sum of your angles add up to the right amount?
% Save the exact sum of the three angles to 'angles_sum'.
% Save the maximum of the three angles to 'angles_max'.
% Save the minimum of the three angles to 'angles_min'.
% Save the arithmetic mean of the three angles to 'angles_avg' (Check the
% command 'mean)

alpha = acosd(dot(P1P2, -P3P1) / (norm(P1P2) * norm(P3P1)));
beta = acosd(dot(-P1P2, P2P3) / (norm(P1P2) * norm(P2P3)));
gamma = acosd(dot(-P2P3, P3P1) / (norm(P2P3) * norm(P3P1)));

angles = [alpha, beta, gamma];

% check the sum
angles_sum = sum(angles);
angles_max = max(angles);
angles_min = min(angles);
angles_avg = mean(angles);

end
