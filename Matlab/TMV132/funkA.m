function y=funkA(t, U)
    plot(t, U, 'b')
    x = linspace(1, 3, 1000);
    % Gjord f?r hand
    y = (x.^3) ./ 3 + (2/3);
    plot(x, y, 'r')
end