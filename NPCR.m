function [npcr] = NPCR(f1, f2)

[M, N] = size(f1);
d = 0.000000;
for i = 1 : M
    for j = 1 : N
        if f1(i, j) ~= f2(i, j)         
           d = d + 1;
        end
    end
end
npcr = d / (M * N);

