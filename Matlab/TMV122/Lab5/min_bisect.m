function m=min_bisect(f,I,tol)
% min_bisect - ber?knar nollst?lle till f(x) p? intervallet I.
%   Syntax:
%           x = min_bisect(f,I,tol)
%   Argument:
%           f   - funktionshandtag: pekar p? namnet till en funktionsfil eller
%                 till en anonym funktion. T.ex. f=@funk eller f=@(x)cos(x)-x
%           I   - 1x2 matris, anger ett intervall I=[a,b]. Funktionen m?ste 
%                 v?xla tecken p? intervallet.
%           tol - positivt tal som anger ?nskad noggrannhet f?r nollst?llet.
%   Returnerar:
%           x   - ett tal som ger approximativt nollst?lle.
%   Beskrivning:
%           Programmet ber?knar ett approximativt nollst?lle till f(x) p?
%           intervallet I med intervallhalveringsmetoden.
%   Exempel:
%           x = min_bisect(@(x)cos(x)-x,[0,1],1e-5)
	   
    a = I(1);
    b = I(2);
    m = (a+b)/2;

    msg = sprintf('??? Felaktig anv?ndning ==> min_bisect \n Funktionen m?ste v?xla tecken p? intervallet.');
	     
    if f(a)*f(m) > 0 && f(b)*f(m) > 0
        disp(msg)
        m=[];
        return 
    else
        while b-a > tol
            m = (a+b)/2;
            p1 = f(a)*f(m);
            p2 = f(b)*f(m);
            
            if p1<0 && p2<0
                a1 = a;
                b1 = m;
                while b1 - a1 > tol
                   m1 = (a1 + b1)/2;
                   t1 = f(a1)*f(m1);
                   if t1 < 0
                       b1 = m1;
                   else
                       a1 = m1;
                   end
                end
                
                a2 = m;
                b2 = b;
                while b2 - a2 > tol
                    m2 = (a2 + b2)/2;
                    t2 = f(a2)*f(m2);
                    if t2 < 0
                        b2 = m2;
                    else
                        a2 = m2;
                    end
                end
                
                m = [m1 m2];
                return
     
            elseif p1<0
                b = m;
            elseif p2<0
                a = m;
            end 
            
        end
        return
    end
end