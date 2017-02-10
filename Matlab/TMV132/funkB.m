function y=funkB(t, U)
    plot(t, U, 'b')
    
    % Gjord f?r hand
    x = linspace(0, 2, 1000);
    y = exp(x);
    plot(x, y, 'r')
end