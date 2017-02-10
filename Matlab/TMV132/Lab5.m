%% Exempel

% Funktion
f=@(t,u)-u+sin(t)+cos(t);

% B?rjan, slut
a=0; b=4; 

% Bygennelse villkor
ua=1;

% Antal steg
N=10; 

%Stegl?ngd
h=(b-a)/N;

% Alla x- v?rden
t=a+(0:N)*h;

% Skapar en array lika stor som t med med bara nollor 
U=zeros(size(t));

% S?tter f?rsta v?rdet i arrayen till begynelse villkoret
U(1)=ua;

% Matar in y-v?rden i arrayen
% t(n) ger x v?rde
% U(n) ger f?rdeg?ende y v?rde i loopen
% Tar f?reg?ende punkts y v?rde och adderar dess lutning i f?reg?ende punkt 
% och multiplicerar med delta x
for n=1:N
    U(n+1) = U(n) + h*f(t(n),U(n));
end

plot(t,U)

%% Uppgift 1

f = @(t, u) cos(3*t) - sin(5*t)*u;
a = 0;
b = 15;
ua = 2;

k0 = 0.1;
N0 = (b-a)/k0;
h0 = (b-a)/N0;

k1 = 0.01;
N1 = (b-a)/k1;
h1 = (b-a)/N1;

k2 = 0.001;
N2 = (b-a)/k2;
h2 = (b-a)/N2;


t0 = a + (0:N0)*h0;
t1 = a + (0:N1)*h1;
t2 = a + (0:N2)*h2;

U0 = zeros(size(t0));
U0(1) = ua;

U1 = zeros(size(t1));
U1(1) = ua;

U2 = zeros(size(t2));
U2(1) = ua;

for n=1:N0
   U0(n+1) = U0(n) + h0 * f(t0(n), U0(n));
end

for n=1:N1
   U1(n+1) = U1(n) + h1 * f(t1(n), U1(n));
end

for n=1:N2
   U2(n+1) = U2(n) + h2 * f(t2(n), U2(n));
end

hold on
plot(t0, U0, 'g')
plot(t1, U1, 'b')
plot(t2, U2, 'r')
hold off

%% Uppgift 2
f = @(t, u) cos(3*t) - sin(5*t)*u;
ua = 2;
I = [0 15];
h = 0.01;

[t, U] = min_ode(f, I, ua, h);
plot(t, U)

%% Uppgift 3 a)
f = @(t, u) t.^2;
I = [1 3];
ua = 1;
h = 0.01;

[t, U] = min_ode(f, I, ua, h);

hold on
funkA(t, U);
hold off

%% b)
f = @(t, u) exp(t);
I = [0 2];
ua = 1;
h = 0.01;

[t, U] = min_ode(f, I, ua, h);

hold on
funkB(t, U)
hold off

%% c)?
f = @(t, u) -t .* u;
I = [0 3];
ua = 1;
h = 0.1;

[t, U] = min_ode(f, I, ua, h);

hold on
    funkC(t, U);
hold off

%% d)
f = @(t, u) -5 .* u;
I = [0 1];
ua = 2;
h = 0.01;

[t, U] = min_ode(f, I, ua, h);

hold on
funkD(t, U);
hold off

%% Uppgift 4
f = @(t, u) cos(3*t) - sin(5*t)*u;
a = 0;
b = 15;
ua = 2;

[t, U] = ode45(f, [a b], ua);
[r, J] = min_ode(f, [a b], ua, 0.00001);

hold on
plot(t, U, 'r')
plot(r, J, 'b')
hold off






