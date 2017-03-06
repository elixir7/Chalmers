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
% Rita planet
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
scatter3(xR(1,1), xR(2,1), xR(3,1))
text(xR(1,1), xR(2,1), xR(3,1), '$\mathbf{x}_r$', 'interpreter', 'latex', 'fontsize', 12)

%Pil fr?n x^ till x_r
quiver3(xHatt(1,1), xHatt(2,1), xHatt(3,1), mir(1,1), mir(2,1), mir(3,1))
xlabel('x'), ylabel('y'), grid on, hold off


%% Uppgift 2
clc
clf

q = sqrt(2/3);
H = [ (2*sqrt(2))/3 -sqrt(2)/3 -sqrt(2)/3 0; 0 q  -q 0; -1/3 -1/3 -1/3 1];
Hmir = zeros(3,4);
S = [1 3 4; 1 2 4; 2 3 4; 1 2 3];

%Normalvektorn f?r planet
n = [1; -1; 4];

%Translate tetrahed 3 steps up
t = [0; 0; 3];
H = H + t*ones(size(H(1,:)));

xmin = -10;
xmax = 10;
ymin = -10;
ymax = 10;

a = 1; b = -1; c = 4; d = 1;
X = [xmin xmax xmax xmin];
Y = [ymin ymin ymax ymax];
Z = (d - a*X - b*Y)/c;

% pP = matrix for the tetrahed points on the plane
pP = zeros(3, 4);

hold on
%Paint plane
fill3(X,Y,Z, 'g', 'facealpha', 0.7)

P = eye(3,3) - (1/dot(n,n)) * n*transpose(n);
P2 = eye(3,3) - (2/dot(n,n)) * n*transpose(n);
beta = (d/dot(n,n))*n;

K = P*H + beta*ones(size(H(1,:)));
K2 = P2*H + beta*ones(size(H(1,:)));
%Paint normal tetrahed
for i=1:size(S,1)
    Si = S(i,:);
    fill3(H(1,Si), H(2,Si), H(3,Si), 'c', 'facealpha', '0.5')
end

%Paint the projection of the tetrahed in the plane and the reflection. 
for i=1:size(S,1)
    Si = S(i,:);
    %Tetrahed in the plane
    fill3(K(1,Si), K(2,Si), K(3,Si), 'c', 'facealpha', '0.5')
    %Tetrahed reflection
    fill3(K2(1,Si), K2(2,Si), K2(3,Si), 'c', 'facealpha', '0.5')
end

grid on, hold off, view(20,10)

%% Uppgift 3

phi=pi/15;
A=[1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)];

v=[1;3;-1]; v=v/norm(v); Z=null(v'); P=[v,Z];

if det(P)<0, P(:,[2 3])=P(:,[3 2]); end

Av=P*A*P';
x=[0.5; 0.2; 0.5];

plot3(x(1),x(2),x(3),'o'), hold on
for i=1:30
    x=Av*x;
    plot3(x(1),x(2),x(3),'o')
end

plot3([-v(1) v(1)],[-v(2) v(2)],[-v(3) v(3)],'r','linewidth',3)
box on, grid on, hold off
axis equal, axis([-2 2 -2 2 -2 2]), axis vis3d



%% Uppgift 4

clc
clf
phi=pi/11;
kMax = (2*pi)/phi
%Rotaion matrix
A=[1 0 0; 0 cos(phi) -sin(phi); 0 sin(phi) cos(phi)];

%v1 axeln 
v1=[8;4;-12]; v=v1/norm(v1); Z=null(v'); P=[v,Z];

if det(P)<0, P(:,[2 3])=P(:,[3 2]); end

q = sqrt(2/3);
H = [ (2*sqrt(2))/3 -sqrt(2)/3 -sqrt(2)/3 0; 0 q  -q 0; -1/3 -1/3 -1/3 1];
S = [1 3 4; 1 2 4; 2 3 4; 1 2 3];

Av=P*A*P';

% Scaling matrix
s = 1.01;
B = [s 0 0; 0 s 0; 0 0 s];


%Translate tetrahed 3 steps up
t = [0; 0; 4];
H = H + t*ones(size(H(1,:)));

hold on

%Paint red line
plot3([-v1(1) v1(1)],[-v1(2) v1(2)],[-v1(3) v1(3)],'r','linewidth',3)

%Paint first non-rotated tetrahed
for i=1:size(S,1)
    Si = S(i,:);
    fill3(H(1,Si), H(2,Si), H(3,Si), 'c', 'facealpha', '0.5')
end
axis equal, axis([-15 15 -15 15 -15 15]), box on, grid on, hold off


%Loop one rotation
for k=1:5*kMax
   clf
   %Rotate all points
   H = Av*H;
   for i=1:size(H,2)
        H(:,i) = B*H(:,i);
   end
   
   hold on
   plot3([-v1(1) v1(1)],[-v1(2) v1(2)],[-v1(3) v1(3)],'r','linewidth',3)
   clear rand
   rand = randi([1 5],1);
   switch rand
       case 1
           color = 'b';
       case 2
           color = 'c';
       case 3
           color = 'm';
       case 4
           color = 'y';
       case 5
           color = 'g';
       otherwise
           color = 'k';
   end
       
   for i=1:size(S,1)
       Si = S(i,:);
       
       fill3(H(1,Si), H(2,Si), H(3,Si), color, 'facealpha', '0.4')
   end
   hold off
   
   axis equal, axis([-15 15 -15 15 -15 15]), box on, grid on, view(3)
   pause(0.01)
end





