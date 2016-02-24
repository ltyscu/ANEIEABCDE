p = imread('brain_c2.bmp');
p = double(p);
npcr = zeros(1, 1000);
uaci = zeros(1, 1000);

for i = 1 : 1000
    pp = imread(sprintf('%s%d%s', '.\pic\brain\c2\brain', i, '.bmp'));
    pp = double(pp);
    npcr(i) = NPCR(p, pp);
    if npcr(i) == 0
        display(i);
        pause;
    end;
    uaci(i) = UACI2(p, pp);
end;


% min(npcr) 
% max(npcr)
mean(npcr)

 
% min(uaci) 
% max(uaci)
mean(uaci)