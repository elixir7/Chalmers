%% Uppgift 1
f = @(x) 1.5 + sin(0.02 .* x.^2);
df = @(x) (0.04 .* x) .* cos(0.02 .* x.^2);
a = 0;
b = 25;
V = pi * integral(@(x)f(x).^2, a, b)
S = 2*pi * integral( @(x) abs(f(x)) .* sqrt(1+df(x).^2), a, b)

%% Uppgift 2
l = 0.1;
g = 9.82;
CONST = 4 * sqrt(l/g);

% t = utg?ngsvinklen
% x = nuvarande vinkel
g = @(t, x) CONST .* (1 ./ sqrt(1 - sin(t./2).^2 .* sin(x).^2));

c = 0;
d = pi/2;

a = 10;
b = 170;
% Fyll en array med vinklar (i rad)
x = linspace(a, b)*2*pi./360;
f = zeros(size(x));


for i=1:length(x)
   f(i) = integral(@(t) g(x(i), t ), c, d);
end

plot(x, f)


