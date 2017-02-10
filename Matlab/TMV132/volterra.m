function f=volterra(t,u)
    a=0.5; b=0.3; c=0.2; d=0.05;
    f=[ a*u(1)-b*u(1)*u(2)
    -c*u(2)+d*u(1)*u(2)];
end