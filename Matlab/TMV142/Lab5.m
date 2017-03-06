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

%a
A=[1 -2; 3 -4]; u0=[-3; 5];

F=@(t,u)A*u;
[t,U]=ode45(F,[0 5],u0);

u1=linspace(-8,5,30); u2=linspace(-5,8,30);

[U1,U2]=meshgrid(u1,u2);

F1=A(1,1)*U1+A(1,2)*U2; 
F2=A(2,1)*U1+A(2,2)*U2;

quiver(U1,U2,F1,F2,0.9)

axis([-8 5 -5 8]), hold on
plot(U(:,1),U(:,2),'r','LineWidth',2)

%% Uppgift 1b

A=[0 3; -12 1]; u0=[2; 4];

F=@(t,u)A*u;
[t,U]=ode45(F,[0 6],u0)

u1=linspace(-100,100,30); u2=linspace(-100,100,30);

[U1,U2]=meshgrid(u1,u2);

F1=A(1,1)*U1+A(1,2)*U2; 
F2=A(2,1)*U1+A(2,2)*U2;

quiver(U1,U2,F1,F2,0.9)

axis([-100 100 -100 100]), hold on
plot(U(:,1),U(:,2),'r','LineWidth',2)

%%

exp(2*3.5)





