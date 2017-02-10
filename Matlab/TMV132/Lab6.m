%% Uppgift 1
u0=[0.5;0.3];
[t,U]=ode45(@volterra,[0 80],u0);
figure(1), clf
plot(t,U(:,1),t,U(:,2),'r--')
legend('Bytesdjur','Rovdjur')
xlabel('Tiden'), ylabel('Population')
title('Volterra-Lotka')

%% Uppgift 2
g=9.81; l=0.1; 
theta0=[30:20:110]*pi/180;
tspan=linspace(0,200,200);

for k=1:length(theta0)
    u0=[theta0(k);0];
    [t,U]=ode45(@(t,u)pendel(t,u,g,l), tspan, u0);
    subplot(1,2,1), plot(t,U(:,1)), hold on
    subplot(1,2,2), plot(U(:,1),U(:,2)), hold on
end

subplot(1,2,1), hold off
xlabel('$t$','interpreter','latex','fontsize',12)
ylabel('$\theta(t)$','interpreter','latex','fontsize',12),

subplot(1,2,2), hold off
xlabel('$\theta(t)$','interpreter','latex','fontsize',12)
ylabel('$\dot{\theta}(t)$','interpreter','latex','fontsize',12)