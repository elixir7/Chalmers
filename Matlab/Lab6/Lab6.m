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
    disp([x1 h]);
    
    if abs(h)<tol
        break
    end
end
plot(x1, h, 'b--o')
x1

for k=1:kmax
    h=-f(x2)/Df(x2);
    x2 = x2 + h;
    disp([x2 h]);
    
    if abs(h)<tol
        break
    end
end
plot(x2, h, 'b--o')
x2

for k=1:kmax
    h=-f(x3)/Df(x3);
    x3 = x3 + h;
    disp([x3 h]);
    
    if abs(h)<tol
        break
    end
end
plot(x3, h, 'b--o')
x3

hold off



%% Uppgift 2
f = @(x) x.^3 - cos(4*x);
Df = @(x) 3*x.^2 + 4*sin(4*x);

A1 = min_newton(f, Df, -1, 0.5e-8) 
A2 = min_newton(f, Df, -0.5, 0.5e-8) 
A3 = min_newton(f, Df, 0.5, 0.5e-8) 


%% Uppgift 3