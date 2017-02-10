% Lab 3

%% Uppg 1
% X-kordinater f?r triangeln
X = [ 1 2 3 1];
% Y-kordinater f?r triangeln
Y = [ 1 2 1 1];
clc
plot(0,0,'ko','linewidth',2,'markersize',2), hold on % origo

fill(X,Y,'c','edgecolor','k','linewidth',1)
axis equal, axis([-5 5 0 6]), pause(1)
% Hur mycket triangel skall roteras med
v=pi/6; 
% Linj?r transformation med hj?lp av vinkeln
A=[cos(v) -sin(v); sin(v) cos(v)];
% Translerar t1 i x led och t2 i y led i varje steg
t=[-0.6;0.3];

P=[X;Y];
for i=1:3
    % Varje koordinatpar (X, Y) = [X;Y] roteras med vinkeln pi/6 genom att
    % applicera den linj?ra transformationen A
    P = A*P; 
   
    % Translerar sedan punkterna med hj?lp av den linj?ra avbildningen t
    % ones(size(X)) kr?vs f?r att skapa en matris d?r varje kolumn vektor
    % har [-0.6; 0.3] som sedan skall adderas p? varje enskilt kordinatpar
    size(X)
    ones(size(X))
    t*ones(size(X))
    P = P + t*ones(size(X));
    
    fill(P(1,:),P(2,:),'c','edgecolor','r','linewidth',1), pause(1)
end

hold off

%% Uppg 2
clc
q = sqrt(2/3);
% H har kolumner (3 entries) som representerar kordinaten f?r 1 punkt
H = [ (2*sqrt(2))/3 -sqrt(2)/3 -sqrt(2)/3 0; 0 q  -q 0; -1/3 -1/3 -1/3 1];
% S har rader (4 entries -> 4 sidor p? en tetrahed) som representerar
% vilka punkter som finns p? vilken sida
S = [1 3 4; 1 2 4; 2 3 4; 1 2 3];

figure(1), clf, hold on
% G? igenom alla rader i S ( alla sidor p? tetraheden)
for i=1:size(S,1)
    %Ta ut en radvektor med alla punkter p? den nuvarande sidan
    Si = S(i,:);
    % Ta ut alla x(1), y(2), z(3) punkter f?r sidan med punkterna fr?n Si
    % och fyll i som ett plan
    % Fill tar allts? radvaktor med x, y, z och ritar sedan planet.
    fill3(H(1,Si), H(2,Si), H(3,Si), 'g', 'facealpha', '0.7')
end
axis equal, axis tight, axis off, hold off, view(20,10)


%% Uppg 3
clc
q = sqrt(2/3);
H = [ (2*sqrt(2))/3 -sqrt(2)/3 -sqrt(2)/3 0; 0 q  -q 0; -1/3 -1/3 -1/3 1]
S = [1 3 4; 1 2 4; 2 3 4; 1 2 3];


v = 3*pi/2;
v2 = pi;
% Linj?rtransformation som roterar kring x axeln
A = [1 0 0; 0 cos(v) -sin(v); 0 sin(v) cos(v)];
% Linj?rtransformation som roterar kring y axeln
B = [cos(v2) 0 sin(v2); 0 1 0; -sin(v2) 0 cos(v2)];
% Translera i x, y, z p? varje kordinatpar
t = [-1; -0.5; -0.6];



figure(1), clf, hold on
for i=1:size(S,1)
    Si = S(i,:);
    fill3(H(1,Si), H(2,Si), H(3,Si), 'k', 'facealpha', '0.6')
end
% Rotate H around X 
H = A * H;
% Print first rotated Tetra
for i=1:size(S,1)
    Si = S(i,:);
    fill3(H(1,Si), H(2,Si), H(3,Si), 'r', 'facealpha', '0.6')
end
% Translate Tetra
H = H + t*ones(size(H(1,:)));

% Paint second Tetra
for i=1:size(S,1)
    Si = S(i,:);
    fill3(H(1,Si), H(2,Si), H(3,Si), 'g', 'facealpha', '0.5')
end
% Rotate H around y
H = B * H;
% Paint third Tetra
for i=1:size(S,1)
    Si = S(i,:);
    fill3(H(1,Si), H(2,Si), H(3,Si), 'b', 'facealpha', '0.4')
end
axis equal,axis([-5 5 -5 5 -5 5]), box on, grid on,hold off, view(20,10)

%% Uppgift 4
H = [ (2*sqrt(2))/3 -sqrt(2)/3 -sqrt(2)/3 0; 0 q  -q 0; -1/3 -1/3 -1/3 1];

ax = [-5 200 -50 50 -50 50];
v = pi/8;
kmax = (2*pi)/v;
% Rotation linear transformation
A = [1 0 0; 0 cos(v) -sin(v); 0 sin(v) cos(v)];
% Scaling linear transformation
s = 1.04;
B = [s 0 0; 0 s 0; 0 0 s];
t = [0.3; -0.5; 0.5];

clf
hold on
% Rita ut tetraheaden fr?n b?rjan
for i=1:size(S,1)
    Si = S(i,:);
    fill3(H(1,Si), H(2,Si), H(3,Si), 'g', 'facealpha', '0.7')
end
hold off
axis equal, axis(ax), box on, grid on 
pause(0.5)

%Start animating
for k=1:5*kmax
   clf
   H = A*H;
   for i=1:size(H,2)
        H(:,i) = H(:,i) + t;
   end
   for i=1:size(H,2)
        H(:,i) = B*H(:,i);
   end
   
   hold on
   for i=1:size(S,1)
       Si = S(i,:);
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
       fill3(H(1,Si), H(2,Si), H(3,Si), color, 'facealpha', '0.4')
   end
   hold off
   axis equal, axis(ax), box on, grid on
   pause(0.01)
end





