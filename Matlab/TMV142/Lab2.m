%%Lab 2

%%

A  = [1, 2, 3; 4, 5, 6;]
b = size(A);
m = size(A, 1);
n = size(A, 2);
k = A(:,2)

%% Upg 1
A = [1, 4, 7, 10; 2, 5, 8, 11; 3, 6, 9, 12]
b = [4, 5, 6; 3, 2, 1; 1, 1, 1]
c = [1; 3; 5];
d = [0 2 4];
%% a

A(:,3) = c
b(2,:) = d

%% b 
A = [1, 4, 7, 10; 2, 5, 8, 11; 3, 6, 9, 12];
b = [4, 5, 6; 3, 2, 1; 1, 1, 1];
c = [1; 3; 5];
d = [0 2 4];

% Byter rader (1 & 3)
tempRow = A(3,:);
A(3,:) = A(1,:);
A(1,:) = tempRow

% Byter kolonner (2 & 4)
tempKolonn = A(:,4);
A(:,4) = A(:,2);
A(:,2) = tempKolonn

%% Upg 2
clear B

b1 = [4;3;1];
b2 = [5;2;1];
b3 = [6;1;1];

B = [b1 b2 b3]

%% Upg 3

clear A
A = [10 7 8 7; 7 5 6 5; 8 6 10 9; 7 5 9 10];


A11 = [A(1:2,1:2)]
A12 = [A(1:2,3:4)]
A21 = [A(3:4,1:2)]
A22 = [A(3:4,3:4)]

Y = [[A11 A12];[A21 A22]]

%% Upg 4

 A = [1 5 9; 2 6 10; 3 7 11; 4 8 12];
 B = [4 5 6; 3 2 1; 1 1 1;];
 x = [1; 1; 1];
 a = [-1 0 1];
 
 Ax = A*x
 Bx = B*x
 AB = A*B
 ax = a*x
 xa = x*a
 aB = a*B
 
 clear Ax
 
 %Ax ber?knad i matlab
m = 4;
n = 3;
y=zeros(m,1);
for i=1:m
    s=0;
    for j=1:n
       s=s+A(i,j)*x(j);
    end
    y(i)=s; 
end
y

%% Upg 5

A = [1 0 0; 0 1 0; 1 0 1];
B = [1 0 0; -2 1 0; 0 0 1];
C = [2 1 1; 4 1 0; -2 2 1];

A*(B*C)
(A*B)*C 

%%
A*(B + C)
A*B + A*C 
%%
(B+C)*A
B*A + C*A

%% b
A*C
C*A

B*C
C*A
%%
A*B
B*A


%% Upg 6
n = 9;
ett = ones(n,1)

A = spdiags( [-ett -ett 4*ett -ett -ett], [-3 -1 0 1 3], n,n);
b = [100; 20; 120; 80; 0; 100; 120; 40; 140];
FA = full(A)

A(3,4) = 0;
A(4,3) = 0;
A(6,7) = 0;
A(7,6) = 0;
FA = full(A)

x = A \ b


 
 















