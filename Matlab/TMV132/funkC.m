function y=funkC(t, U)
    plot(t, U, 'b')
   
    x = linspace(0, 3, 100);
    y = exp(-1*(power(x,2)/2));
    plot(x, y, 'r')
end