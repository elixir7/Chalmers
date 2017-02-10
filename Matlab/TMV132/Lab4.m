% cardioiden
clf
shg
t=linspace(0,2*pi,200);
x=2*cos(t)-cos(2*t); y=2*sin(t)-sin(2*t);
for i=1:length(t)
    plot(cos(t),sin(t),'b'), hold on
    plot(2*cos(t(i))+cos(t),2*sin(t(i))+sin(t),'g')
    plot(x(1:i),y(1:i),'r',x(i),y(i),'mo'), hold off
    axis equal, axis([-3.2 3.2 -3.2 3.2]), title('Cardioid')
    pause(0.01)
end

%% Uppgift 1
% Rita ut en cykloid med parameterframst?llning
t = linspace(0, 10*pi);
x = t - sin(t);
y = 1 - cos(t);
plot(x,y)
axis equal
title('cykloiden');

%% Uppgift 2
% Rita upp en ellips mha parameterframst?llning
u = 100;
t = linspace(0, 2*pi, u);

% x-riktning
a = 1;

% y-riktninig
b = 0.5; 

% mittpunkt (2, 1)
p = 2; 
q = 1;

x = p + a*cos(t);
y = q + b*sin(t);

plot(x,y)
axis equal, grid on
title('ellips')

%% Uppgift 3
% Rita tangenten i en punkt t0,
% rita ?ven normalen till tangent
% och markera punkten.
t0 = 2.3;
s = [-0.5 0.5];
x0 = p + a*cos(t0);
y0 = q + b*sin(t0);

dx0 = a * sin(t0);
dy0 = b * -cos(t0);

hold on
plot(x0 + s*dx0, y0 + s*dy0, 'm');  %tangent
plot(x0 + s*dy0, y0 - s*dx0,'c');   %normalen
plot(x0, y0, 'ro', 'markersize', 2, 'linewidth', 2); %lilla cirkeln
hold off
axis([0.5 3.5 0 2])

%% Uppgift 4

L = sum( sqrt( (x(2:end)-x(1:end-1)).^2 + (y(2:end)-y(1:end-1)).^2));

L

fun = @(t) sqrt( (a .* sin(t).^2) + (b .* -cos(t)).^2 );

s = integral(fun ,0, 2*pi)

