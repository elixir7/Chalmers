function q=min_integral(f,I,n,k)
% min_integral - ber�knar integralen av f(x) p� intervallet I.
%
%   Syntax:
%           q =  min_integral(f,I,n,k)
%   Argument:
%           f   - funktionshandtag: pekar p� namnet till en funktionsfil eller
%                 till en anonym funktion. T.ex. f=@funk eller f = @(x)sin(x.^2)
%           I   - 1x2 matris, anger ett intervall I=[a b]
%           n   - positivt heltal, stegl�ngden ges av: h=(b-a)/n d�r n �r antalet delintervall.
%           k   - kvadraturmetod
%   Returnerar:
%           q - ett tal
%   Beskrivning:
%           Programmet ber�knar ett approximativt v�rde p� integralen
%           av f(x) �ver intervallet I med antingen rektangelmetoden v�nster (k=1),
%           rektangelmetoden h�ger (k=2), mittpunktsmetoden (k=3) eller 
%           trapetsmetoden (k=4).
%   Exempel:
%           q=min_integral(@cos,[0, pi/2],100,2)

    a=I(1);
    b=I(2);
    h=(b-a)/n;
   
    x = linspace(a, b, n+1);
    
    g = @(x1, x2) (x1 + x2)/2;
    
    switch k
        case 'lower'
            q = sum(h * f(x(1:n)));
        case 'upper'
            q = sum(h * f(x(2:n+1)));
        case 'midpoint'
            q = sum(h * f(g(x(1:n), x(2:n+1))));
        case 'trapeze'
            q = sum(h/2 * ( f(x(1:n)) + f(x(2:n+1)) ));
    end
    
    
end