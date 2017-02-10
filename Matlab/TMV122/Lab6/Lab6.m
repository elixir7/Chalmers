%% Uppgift 1
f = @(x) x.^3 - cos(4*x);
x = linspace(-2, 1);

xHor = [-2 -1 0 1];
yHor = [0 0 0 0];

hold on
plot(xHor,yHor, 'g')
plot(x, f(x), 'b')


axis([-2 1 -1.5 1]), grid on

% Det finns 3st l?sningar
% x1 = -1
% x2 = -0.5
% x3 = 0.5


Df = @(x) 3*x.^2 + 4*sin(4*x);
x1 = -1;
x2 = -0.5;
x3 = 0.5;

kmax=10;
tol=0.5e-8;
for k=1:kmax
    h=-f(x1)/Df(x1);
    x1 = x1 + h;
    if abs(h)<tol
        break
    end
end
plot(x1, h, 'b--o');
x1

for k=1:kmax
    h=-f(x2)/Df(x2);
    x2 = x2 + h;
    
    if abs(h)<tol
        break
    end
end
plot(x2, h, 'b--o');
x2

for k=1:kmax
    h=-f(x3)/Df(x3);
    x3 = x3 + h;
    
    if abs(h)<tol
        break
    end
end
plot(x3, h, 'b--o');
x3

hold off



%% Uppgift 2
f = @(x) x.^3 - cos(4*x);
Df = @(x) 3*x.^2 + 4*sin(4*x);

A1 = min_newton(f, Df, -1, 0.5e-8) 
A2 = min_newton(f, Df, -0.5, 0.5e-8) 
A3 = min_newton(f, Df, 0.5, 0.5e-8) 


%% Uppgift 3
f = @(x) 0.5*(x - 2).^2 - 2*cos(2*x) - 1.5;
Df = @(x) (x-2) + 4*sin(2*x);

y = @(x) x.^3 - cos(4*x);
Dy = @(x) 3*x.^2 + 4*sin(4*x);

x = linspace(-5, 5, 1000);


hold on

plot([-1000 1000],[0 0], 'g') 
plot(x, f(x), 'b');
plot(x, y(x), 'r');


axis([-2 5 -3 2]), grid on

A1 = min_newton(f, Df, -0.5, 0.5e-8);
plot(A1, h, 'b--o');
A2 = min_newton(f, Df, 1, 0.5e-8);
plot(A2, h, 'b--o');
A3 = min_newton(f, Df, 2, 0.5e-8);
plot(A3, h, 'b--o');
A4 = min_newton(f, Df, 4, 0.5e-8);
plot(A4, h, 'b--o');

Y1 = min_newton(y, Dy, -1, 0.5e-8)
plot(Y1, h, 'r--o');
Y2 = min_newton(y, Dy, -0.5, 0.5e-8)
plot(Y2, h, 'r--o');
Y3 = min_newton(y, Dy, 0.5, 0.5e-8)
plot(Y3, h, 'r--o');

hold off

%% Uppgift 4
f = @(x)(3 + sin(2*x)) ./ (1 + exp(0.03*x.^2)) - 1.2;
x = linspace(-15, 15, 1000);

xHor = [-7 -6 -5 -4 -3 -2 -1 0 1 2 3 4 5 6 7];
yHor = [0 0 0 0 0 0 0 0 0 0 0 0 0 0 0];
 

hold on

plot(xHor,yHor, 'g');
plot(x, f(x), 'b');

axis([-7 7 -1.5 1]), grid on

for i = 1:1:6
    [xPos, yPos] = ginput(1);
    A = fzero(f, xPos)
    plot(A, 0, 'r--o');
end

hold off

%% Extra

A = fakultet(6)
















