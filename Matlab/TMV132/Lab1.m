%% Graf och axlar
xa=-8; 
xb=8; 
s=0.01; 
ya=-6; 
yb=6;

% Med s>0 undviker vi singulariteten i x=0.
xv=linspace(xa,-s); 
xh=linspace(s,xb);
f=@(x)(x.^2+2*x+4)./(2*x);
plot(xv,f(xv),'blue',xh,f(xh),'blue','LineWidt',2)

axis equal, axis([xa xb ya yb]), grid on
xlabel('x'), ylabel('y'), title('y = (x^2 +2x +4) / 2x')
hold on
%% Asymptoter
x=[xv xh]; y=x/2+1;
plot(x,y,'--red',[0 0],[ya yb],'--red')
text(2.3,1.7,'y = x/2 + 1'), text(-1.7,3,'x = 0')
%% Max och min
plot(-2,-1,'oblack',2,3,'oblack')
text(-1.8,-0.7,'(-2,-1)'), text(1.8,3.6,'(2, 3)')
hold off

%% Uppgift 1

f = @(x) ((x.^2 -1).^2).^(1/3);
x = linspace(-3, 3);
plot(x, f(x), 'blue', 'LineWidth', 2);

axis equal, axis([-3 3 -0.5 4]), grid on
xlabel('x'), ylabel('y'), title('y = ((x^2-1)^2)^(1/3)')
hold on
plot(-sqrt(3),2^(2/3),'oblack',sqrt(3),2^(2/3),'oblack')
text(-sqrt(3),2^(2/3),'(-sqrt(3),2^(2/3))')
text(sqrt(3),2^(2/3),'(sqrt(3), 2^(2/3))')
plot(-1, 0,'oblack', 1, 0,'oblack', 0, 1,'oblack')
text(-1, 0, '(-1, 0)')
text(1, 0, '(1, 0)')
text(0, 1, '(0, 1)')
hold off

%% Uppgift 2
% Rita ut 4 st grafer i Adams

% Top Left 
subplot(2, 2, 1)

f = @(x) x ./ (1 - x.^2);
s = 0.01;
xf1 = -5;
xf2 = -1 - s;
xf3 = -1 + s;
xf4 = 1 - s;
xf5 = 1 + s;
xf6 = 4;

xLin1 = linspace(xf1, xf2);
xLin2 = linspace(xf3, xf4);
xLin3 = linspace(xf5, xf6);

plot(xLin1, f(xLin1), 'blue', xLin2, f(xLin2), 'blue', xLin3, f(xLin3), 'blue')
axis([xf1 xf6 -4 4]), grid on


% Top Right
subplot(2, 2, 2)
g = @(x) x.^3 ./ (1 - x.^4);

x = linspace(-5, 4, 1000);

plot(x, g(x), 'blue')
axis([xf1 xf6 -4 4]), grid on


% Bottom Left
subplot(2, 2, 3)
h = @(x) (x.^3 - x) ./ sqrt(x.^6 + 1);

plot(x, h(x), 'blue')
axis([xf1 xf6 -4 4]), grid on

% Bottom Right
subplot(2, 2, 4)
k = @(x) x.^3 ./ sqrt(abs(x.^4 - 1));

plot(x, k(x), 'blue')
axis([xf1 xf6 -4 4]), grid on

%% Uppgift 3
% L?s om Latex
