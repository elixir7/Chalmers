%Exempel

u1=linspace(-2,2,30); 
u2=linspace(-2,2,30);

[U1,U2]=meshgrid(u1,u2);

F1=@(u1,u2)u1-u2; 
F2=@(u1,u2)u1.*u2; 
s=1.2;

quiver(U1,U2,F1(U1,U2),F2(U1,U2),s)
axis([-2 2 -2 2])

s1=[-1.2 -1.1 0.35 0.4]; % F?orsta-koordinater f?or fyra startpunkter
s2=[-2 -2 0.2 0.2]; % och deras andra-koordinater
h=streamline(U1,U2,F1(U1,U2),F2(U1,U2),s1,s2)
set(h,'Color','r','LineWidth',2)

%% Uppgift 1a

A=[1 -2; 3 -4]; u0=[-3; 5];

F=@(t,u)A*u;
[t,U]=ode45(F,[0 5],u0);

u1=linspace(-8,5,30); 
u2=linspace(-5,8,30);

[U1,U2]=meshgrid(u1,u2);

F1=A(1,1)*U1+A(1,2)*U2; 
F2=A(2,1)*U1+A(2,2)*U2;

quiver(U1,U2,F1,F2,0.9)

axis([-8 5 -5 8]), hold on
plot(U(:,1),U(:,2),'r','LineWidth',2)
%% Uppgift 1b

A=[0 3; -12 1]; u0=[2; 4];

F=@(t,u)A*u;
[t,U]=ode45(F,[0 6],u0);

u1=linspace(-100,100,30); 
u2=linspace(-100,100,30);

[U1,U2]=meshgrid(u1,u2);

F1=A(1,1)*U1+A(1,2)*U2; 
F2=A(2,1)*U1+A(2,2)*U2;

quiver(U1,U2,F1,F2,0.9)

axis([-100 100 -100 100]), hold on
plot(U(:,1),U(:,2),'r','LineWidth',2)

%% Uppgift 2
clc
%a
A = [-2 -5; 1 4];
[P, D] = eig(A)

u1=linspace(-2,3.5,30); 
u2=linspace(-2,2,30);

[U1,U2]=meshgrid(u1,u2);

%Determine the direction for each quiver on the mesh grid
F1=A(1,1)*U1+A(1,2)*U2;
F2=A(2,1)*U1+A(2,2)*U2;
s=1.3;

hold on
%plot all meshgrid quivers
quiver(U1,U2,F1,F2,s, 'k')

%P(:1) eigenVector
quiver(0,0, P(1,1), P(2,1), 'color', 'g', 'LineWidth', 1)
%P(:2) eigenVector
quiver(0,0, P(1,2), P(2,2), 'color', 'r', 'LineWidth', 1)

%Some particular solution determined by the initial condition u0
x = linspace(-1.5,3, 5);
y = linspace(0.75,-1, 5);
for i = 1:5
    u0 = [x(i);y(i)];
    F=@(t,u)A*u;
    [t,U]=ode45(F,[0 5],u0);
    plot(U(:,1), U(:,2),'b', 'LineWidth', 2)
end


hold off
axis([-2 3.5 -2 2])

% Eigenvalues are both real positiveand negative numbers
% Therefor the origin is a saddle point
%% b
clc
clf
A = [1 -2; 3 -4];
[P, D] = eig(A)

u1=linspace(-2,3.5,30); 
u2=linspace(-2,2,30);

[U1,U2]=meshgrid(u1,u2);

%Determine the direction for each quiver on the mesh grid
F1=A(1,1)*U1+A(1,2)*U2;
F2=A(2,1)*U1+A(2,2)*U2;
s=1.3;

hold on
%plot all meshgrid quivers
quiver(U1,U2,F1,F2,s, 'k')

%P(:1) eigenVector
quiver(0,0, P(1,1), P(2,1), 'color', 'g', 'LineWidth', 1)
%P(:2) eigenVector
quiver(0,0, P(1,2), P(2,2), 'color', 'r', 'LineWidth', 1)

%Some particular solution determined by the initial condition u0
x = linspace(-1.5,3, 5);
y = linspace(-2,2, 5);
for i = 1:5
    u0 = [x(i);y(i)/5];
    F=@(t,u)A*u;
    [t,U]=ode45(F,[0 10],u0);
    plot(U(:,1), U(:,2),'b', 'LineWidth', 2)
end


hold off
axis([-2 3.5 -2 2])

% Eigenvalues are real negative numbers
% Therefor the origin is a attractor/sink
%% c
clc
clf
A = [5 3; 3 5];
[P, D] = eig(A)

u1=linspace(-2,3.5,30); 
u2=linspace(-2,2,30);

[U1,U2]=meshgrid(u1,u2);

%Determine the direction for each quiver on the mesh grid
F1=A(1,1)*U1+A(1,2)*U2;
F2=A(2,1)*U1+A(2,2)*U2;
s=1.3;

hold on
%plot all meshgrid quivers
quiver(U1,U2,F1,F2,s, 'k')

%P(:1) eigenVector
quiver(0,0, P(1,1), P(2,1), 'color', 'g', 'LineWidth', 1)
%P(:2) eigenVector
quiver(0,0, P(1,2), P(2,2), 'color', 'r', 'LineWidth', 1)

%Some particular solution determined by the initial condition u0
x = linspace(-1.5,2.5, 5);
y = linspace(1.5,-1.5, 5);
for i = 1:5
    u0 = [x(i);y(i)/2];
    F=@(t,u)A*u;
    [t,U]=ode45(F,[0 5],u0);
    plot(U(:,1), U(:,2),'b', 'LineWidth', 2)
end


hold off
axis([-2 3.5 -2 2])

% Eigenvalues are real positive numbers
% Therefor the origin is a repeller/source

%% d
clc
clf
A = [1 4; -9 1];
[P, D] = eig(A)

u1=linspace(-2,3.5,30); 
u2=linspace(-2,2,30);

[U1,U2]=meshgrid(u1,u2);

%Determine the direction for each quiver on the mesh grid
F1=A(1,1)*U1+A(1,2)*U2;
F2=A(2,1)*U1+A(2,2)*U2;
s=1.3;

hold on
%plot all meshgrid quivers
quiver(U1,U2,F1,F2,s, 'k')

%P(:1) eigenVector
quiver(0,0, real(P(1,1)), real(P(2,1)), 'color', 'g', 'LineWidth', 1)
%P(:2) eigenVector
quiver(0,0, real(P(1,2)), real(P(2,2)), 'color', 'r', 'LineWidth', 1)

%Some particular solution determined by the initial condition u0
x = linspace(-1.5,2.5, 5);
y = linspace(1.5,-1.5, 5);
for i = 1:3
    u0 = [x(i)/2;y(i)/2];
    F=@(t,u)A*u;
    [t,U]=ode45(F,[0 5],u0);
    plot(U(:,1), U(:,2),'b', 'LineWidth', 2)
end


hold off
axis([-2 3.5 -2 2])

%Eigenvalues are complex but have a positive real part 
%Therefor the trajectories spiral outward 
%% e
clc
A = [-2 1; -8 2];
[P, D] = eig(A)

u1=linspace(-2,3.5,30); 
u2=linspace(-2,2,30);

[U1,U2]=meshgrid(u1,u2);

%Determine the direction for each quiver on the mesh grid
F1=A(1,1)*U1+A(1,2)*U2;
F2=A(2,1)*U1+A(2,2)*U2;
s=1.3;

hold on
%plot all meshgrid quivers
quiver(U1,U2,F1,F2,s, 'k')

%P(:1) eigenVector
quiver(0,0, real(P(1,1)), real(P(2,1)), 'color', 'g', 'LineWidth', 1)
%P(:2) eigenVector
quiver(0,0, real(P(1,2)), real(P(2,2)), 'color', 'r', 'LineWidth', 1)

%Some particular solution determined by the initial condition u0
x = linspace(-1.5,2.5, 5);
y = linspace(1.5,-1.5, 5);
for i = 1:3
    u0 = [x(i)/2;y(i)/2];
    F=@(t,u)A*u;
    [t,U]=ode45(F,[0 5],u0);
    plot(U(:,1), U(:,2),'b', 'LineWidth', 2)
end


hold off
axis([-2 3.5 -2 2])

% Eigenvalues are complex but the real part is 0
% Therefor the trajectory form a elippsis around the origin.










