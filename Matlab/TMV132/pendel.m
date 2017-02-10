function f=pendel(t,u,g,l)
    c = 0.2;
    m = 0.1;
    f=[m*l*u(2)
    -m * g * sin(u(1)) - c*l*u(2)];
end