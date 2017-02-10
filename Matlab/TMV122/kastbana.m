function y=kastbana(x)
    y0 = 1.85; 
    v=10; 
    g=9.81; 
    theta=45; 
    t=theta*pi/180;
    a = g/(2*v^2*cos(t)^2); 
    b = v^2*sin(2*t)/(2*g); 
    c = v^2*sin(t)^2/(2*g);
    y = y0-a*(x-b).^2+c;
end