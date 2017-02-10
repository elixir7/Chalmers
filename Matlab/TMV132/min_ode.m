function [t,U]=min_ode(f,I,ua,h)
    % min_ode - l?ser begynnelsev?rdesproblemet f?r f?rsta ordningens differential-
    %           ekvationen u'=f(t,u), u(a)=ua.
    %
    %   Syntax:
    %           [t,U]=min_ode(f,I,ua,h)
    %   Argument:
    %           f   - funktionshandtag: pekar p? namnet till en funktionsfil eller
    %                 till en anonym funktion, t.ex. f=@funk
    %           I   - 1x2 matris, anger ett intervall I=[a b]
    %           ua  - ett tal, anger begynnelsev?rdet
    %           h   - positivt tal, anger stegl?ngden
    %   Returnerar:
    %           t -  en kolonnvektor, ber?kningsnoderna t(i)
    %           U -  en kolonnvektor, U(i) ?r approximationen i
    %                tidpunkten t(i)
    %   Beskrivning:
    %           Programmet ber?knar en approximativ l?sning av begynnelsev?rdes-
    %           problemet  u'=f(t,u), a<t<b; u(a)=ua, med Eulers metod.
    %           Programmet anv?nder konstant stegl?ngd h.
    %   Exampel:
    %           [t,U]=min_ode(@fun, [0, 20], 10, 1e-3)
    a = I(1);
    b = I(2);
    N = (b-a)/h;
    t = a + (0:N)*h;

    U = zeros(size(t));
    U(1) = ua;

    for n=1:N
       U(n+1) = U(n) + h * f(t(n), U(n));
    end


end