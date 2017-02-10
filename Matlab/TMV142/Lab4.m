% Lab 4
clc
% Uppgift 1
xmin = -10;
xmax = 10;
ymin = -10;
ymax = 10;

a = 1; b = -1; c = 4; d = 1;
X = [xmin xmax xmax xmin];
Y = [ymin ymin ymax ymax];
Z = (d - a*X - b*Y)/c;

n = [1; -1; 4];
x = [3; 0; 3]
alfa = (d - dot(n,x)) / dot(n,n);
xHatt = x + alfa*n
xR = x + 2*alfa*n
xArrow = x - xHatt; 
mir = xHatt - x;



hold on
fill3(X,Y,Z, 'g', 'facealpha', 0.7)
% Normalen i en punkt i planet
quiver3(1, 0, 0, 1, -1, 4)

% Random punkt
scatter3(x(1,1), x(2,1), x(3,1))
text(3, 0.3, 3, '$\mathbf{x}$', 'interpreter', 'latex', 'fontsize', 12)

% Random punkts ortogonal projektion i planet
scatter3(xHatt(1,1), xHatt(2,1)+ 0.5, xHatt(3,1))
text(xHatt(1,1), xHatt(2,1), xHatt(3,1), '$\hat{\mathbf{x}}$', 'interpreter', 'latex', 'fontsize', 12)

% Pil fr?n x^ till x
quiver3(xHatt(1,1), xHatt(2,1), xHatt(3,1), xArrow(1,1), xArrow(2,1), xArrow(3,1))

%Randompunkts spegling i planet
scatter3(xHattMirrored(1,1), xHattMirrored(2,1), xHattMirrored(3,1))
text(xR(1,1), xR(2,1), xR(3,1), '$\mathbf{x}_r$', 'interpreter', 'latex', 'fontsize', 12)

%Pil fr?n x^ till x_r
quiver3(xHatt(1,1), xHatt(2,1), xHatt(3,1), mir(1,1), mir(2,1), mir(3,1))
xlabel('x'), ylabel('y'), grid on, hold off





