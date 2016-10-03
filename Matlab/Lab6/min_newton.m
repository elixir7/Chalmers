
function x=min_newton(f,Df,x0,tol)
% min_newton - ber?knar nollst?lle till f(x) givet startapproximation x0.
%   Syntax:
%           x = min_newton(f,Df,x0,tol)
%   Argument:
%           f   - funktionshandtag: pekar p? namnet till en funktionsfil eller
%                 till en anonym funktion. T.ex. f=@funk eller f=@(x)cos(x)-x
%           Df  - funktionshandtag: pekar p? namnet till en funktionsfil eller
%                 till en anonym funktion som ger derivatan av f. 
%                 T.ex. f=@Dfunk eller Df=@(x)-sin(x)-1
%           x0  - ett tal som ger en startapproximation av nollst?llet.
%           tol - positivt tal som anger ?nskad noggrannhet f?r nollst?llet.
%   Returnerar:
%           x   - ett tal som ger approximativt nollst?lle.
%   Beskrivning:
%           Programmet ber?knar ett approximativt nollst?lle till f(x) med
%	    Newtons metod.
%   Exempel:
%           x = min_newton(@(x)cos(x)-x,@(x)-sin(x)-1,1.0,1e-5)

    x=x0; 
    kmax=10;
    
    for k=1:kmax
        h=-f(x)/Df(x);
        x = x + h;

        if abs(h)<tol
            break
        end
    end

    msg=sprintf('Varning: Det kr?vs mer ?n kmax=10 iterationer f?r att best?mma nollst?llet.');

    if k==kmax
        disp(msg)
    end
    
end