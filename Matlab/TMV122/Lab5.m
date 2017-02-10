format long
f = @(x)(x-2.5).*exp(-0.5*(x-2).^2)+0.2;
x = linspace(-2, 7);

plot(x, f(x));
axis([-2 7 -1 1]), grid on;



%{
% Om Q < 0 har funktionen korsat x axeln.
a = -1;
b = 0;
Q = f(a)*f(b);
%}

%{
%Test av teckenbyte
m = (a + b)/2;
t = f(a)*f(m);
if t<0
    b = m;
else
    a = m;
end
%}

%Uppgift 4
Q = min_bisect(f, [-2 100], 1e-5)

%% Uppgift 5
x = linspace(0, 15);
plot(x, kastbana(x))
axis([0 15 -1 5]), set(gca,'XTick',0:1:15), grid on
X = min_bisect(@kastbana, [0, 15], 1e-3)
