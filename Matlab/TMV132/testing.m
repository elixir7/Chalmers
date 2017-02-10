clear all
A = [2 0 -6; 0 1 2; 3 6 -2]
b = [-8; 3; -4]
E = rref([A b])
x = E(:,4)