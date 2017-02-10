bullar = 0;

for i=1:35
    bullar = bullar + 30000*1.04^i;
end
bullar

%%

skuld = 1500000;

renta = 50000 * 0.03;
amortering = 50000 - renta;

year = 0;

while skuld>0
    year = year + 1;
    skuld = skuld - amortering;
end

year
    
