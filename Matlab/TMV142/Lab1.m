% Uppgift 1
%% a
A = [1 3; 5 -2];
b = [6; 13];
c = rref([A b])


l1=@(x1)(b(1)-A(1,1)*x1)/A(1,2);
l2=@(x1)(b(2)-A(2,1)*x1)/A(2,2);

x1=linspace(0,10,2);

plot(x1,l1(x1),'b','linewidth',2), hold on
plot(x1,l2(x1),'g','linewidth',2)
hold off

xlabel('x_1'), ylabel('x_2')
axis equal, axis([2 4 0 2])

%% b

A = [1 3; 2 6];
b = [5; 16];
%b = [5; 12];
c = rref([A b])

l1=@(x1)(b(1)-A(1,1)*x1)/A(1,2);
l2=@(x1)(b(2)-A(2,1)*x1)/A(2,2);

x1=linspace(0,10,2);

plot(x1,l1(x1),'b','linewidth',2), hold on
plot(x1,l2(x1),'g','linewidth',2)
hold off

xlabel('x_1'), ylabel('x_2')
axis equal, axis([0 2 1 3])


%% Uppgift 2
% a
clear all;
clc; clf; 
A = [-3 1 2; 3 -2 1; -1 5 1];
b = [2; 1; 1];


l1=@(x1,x2)(b(1)-A(1,1)*x1-A(1,2)*x2)/A(1,3);
l2=@(x1,x2)(b(2)-A(2,1)*x1-A(2,2)*x2)/A(2,3);
l3=@(x1,x2)(b(3)-A(3,1)*x1-A(3,2)*x2)/A(3,3);

x1=linspace(-1,1,30); x2=linspace(-1,1,30);

[X1,X2]=meshgrid(x1,x2);

surf(X1,X2,l1(X1,X2),'facecolor','b'), hold on
surf(X1,X2,l2(X1,X2),'facecolor','g')
surf(X1,X2,l3(X1,X2),'facecolor','c')

r = rref([A b])
%Planen sk?r varandra i punkten (0,0,1)

x=[0;0;1];

plot3(x(1),x(2),x(3),'ro','markersize',5,'linewidth',4)

xlabel('x_1'), ylabel('x_2'), zlabel('x_3')
axis([-1 1 -1 1 -4 7]), axis vis3d, grid on, box on, hold off

%% b
A = [-3 1 2; 3 -2 1; 3 -4 7];
b = [2; 1; 1];


l1=@(x1,x2)(b(1)-A(1,1)*x1-A(1,2)*x2)/A(1,3);
l2=@(x1,x2)(b(2)-A(2,1)*x1-A(2,2)*x2)/A(2,3);
l3=@(x1,x2)(b(3)-A(3,1)*x1-A(3,2)*x2)/A(3,3);

x1=linspace(-1,1,30); x2=linspace(-1,1,30);

[X1,X2]=meshgrid(x1,x2);

surf(X1,X2,l1(X1,X2),'facecolor','b'), hold on
surf(X1,X2,l2(X1,X2),'facecolor','g')
surf(X1,X2,l3(X1,X2),'facecolor','c')

r = rref([A b])
% Saknar punkt d?r alla planen sk?r varandra

xlabel('x_1'), ylabel('x_2'), zlabel('x_3')
axis([-1 1 -1 1 -4 7]), axis vis3d, grid on, box on, hold off

%% c
A = [-3 1 2; 3 -2 1; 3 -4 7];
b = [2; 1; 7];


l1=@(x1,x2)(b(1)-A(1,1)*x1-A(1,2)*x2)/A(1,3);
l2=@(x1,x2)(b(2)-A(2,1)*x1-A(2,2)*x2)/A(2,3);
l3=@(x1,x2)(b(3)-A(3,1)*x1-A(3,2)*x2)/A(3,3);

x1=linspace(-1,1,30); x2=linspace(-1,1,30);

[X1,X2]=meshgrid(x1,x2);

surf(X1,X2,l1(X1,X2),'facecolor','b'), hold on
surf(X1,X2,l2(X1,X2),'facecolor','g')
surf(X1,X2,l3(X1,X2),'facecolor','c')

xt=@(t)[-5/3+(5/3)*t;-3+3*t;t];
P=[xt(0) xt(2)];
plot3(P(1,:),P(2,:),P(3,:),'r','linewidth',3), hold off

r = rref([A b])
% Sk?r varandra i en linje

xlabel('x_1'), ylabel('x_2'), zlabel('x_3')
axis([-1 1 -1 1 -4 7]), axis vis3d, grid on, box on, hold off







