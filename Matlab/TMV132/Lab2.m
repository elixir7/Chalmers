%% Uppgift 1

%V?nster
%Antal Uppdelning
n = 100;

%Startv?rde
a = 0;

%Slutv?rde
b = 1;

f = @(x)x.*sin(x);

% Delar upp v?rat intervall, 
%n + 1 g?r att vi f?r 101st delintervall f?r att kunna k?ra lower/upper
%riemannsumms
x = linspace(a, b, n+1);

%Hur st?rt v?rat dX ?r
h = (b-a)/n;

%Ber?knar alla staplars area och adderar dem
s = sum(h * f(x(1:n)))

% H?ger
s = sum(h * f(x(2:n+1)))

% Mittpunkt
g = @(x1, x2) (x1 + x2)/2;
s = sum(h * f(g(x(1:n), x(2:n+1))))

%Trapets
s = sum(h/2 * ( f(x(1:n)) + f(x(2:n+1)) ))

%% Uppgift 2

%% Uppgift 3

f = @(x) exp(-x.^2);
g = @(x) 1 ./ (1+x.^2);
h = @(x) tan(sqrt(x));

A = min_integral(f, [0 1], 50, 'lower')
B = min_integral(g, [0 1], 200, 'upper')
C = min_integral(h, [0 1], 100, 'midpoint')


%% Uppgift 4
f = @(x)x.*sin(x);
a = 0;
b = 1;
n = 100;
x = linspace(a, b, n+1);
h = (b-a)/n;


A = min_integral(f, [0 1], 50, 'lower')
B = min_integral(f, [0 1], 50, 'upper')
C = min_integral(f, [0 1], 50, 'midpoit')
D = min_integral(f, [0 1], 50, 'trapeze')












