% Example
td=[-1 0 1 2 3 4 6 7]'; % t-data
 yd=[-0.75 0.3 3 4 5.6 7 6.4 8.4]'; % y-data
 A=[ones(size(td)) td]; % Designmatrisen
 x=A\yd; 
 a=x(1) 
 b=x(2) % Minsta-kvadratl?osningen
 n=length(td); % Antalet m?atdata
 e=norm(A*x-yd)/sqrt(n) % Kvadratiska medelfelet
 
 %% Uppgift 1
 %a
 
 td=[5 6 7 8 9 10]';
 yd=[19.5888 23.4043 25.5754 29.1231 31.9575 35.8116]';
 A=[ones(size(td)) td]; % Designmatrisen
 x=A\yd
 a=x(1); 
 b=x(2); % Minsta-kvadratl?sningen
 n=length(td); % Antalet m?tdata
 e=norm(A*x-yd)/sqrt(n) % Kvadratiska medelfelet
 
 
 f = @(x) a+b*x;
 
 %b
 hold on
 
 plot(td, yd, '*')
 plot(td, f(td))
 
 hold off
 
 %% Uppgift 2
 clc
 td=[1 2 3 4 5 6 7 8 9 10 11 12]';
 yd=[-0.9 -0.9 2.0 6.0 11.6 15.5 16.6 16.2 12.8 9.1 4.4 1.0]';
 A=[ones(size(td)) sin(12.*td) cos(12.*td)] % Designmatrisen
 x=A\yd;
 a=x(1); 
 b=x(2);
 c=x(3);% Minsta-kvadratl?sningen
 n=length(td); % Antalet m?atdata
 e=norm(A*x-yd)/sqrt(n) % Kvadratiska medelfelet
 
 
 f = @(x) a + b*sin(12*x) + c*cos(12*x);
 
 hold on
 plot(td, yd, '*')
 plot(td, f(td))
 
 
 hold off
 
 %% Uppgift 3
 clc
 
 A=[ones(size(td)) sd td]; % Designmatrisen
 x=A\yd;
 a=x(1); 
 b=x(2);
 c=x(3);
 n=length(td);
 e=norm(A*x-yd)/sqrt(n) % Kvadratiska medelfelet
  
 f = @(t,r) a + b*t + c*r;
  
 X = [40 80 80 40];
 Y = [29 29 33 33];
 Z = f(X,Y);
 
 hold on

 scatter3(sd, td, yd, 'r')
 ylabel('y')
 zlabel('z')
 xlabel('x')
 
 fill3(X,Y,Z, 'b', 'facealpha', 0.5)
 
 hold off, box on, grid on,  rotate3d on, view(3) 
 
 
 
 
 
 
 
 