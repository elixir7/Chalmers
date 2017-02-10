function y=funkD(t, U)
    plot(t, U, 'b')
    
    % Gjord f?r hand
    x = linspace(0, 1, 100);
    y = -2 * -exp(-5*x);
    plot(x, y, 'r')
end