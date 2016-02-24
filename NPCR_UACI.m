function [npcr, uaci] = NPCR_UACI()

f1 = imread('pic/peppers_c_2.bmp');
f1 = double(f1);

f2 = imread('pic/peppers_changed_c_2.bmp');
f2 = double(f2);

npcr = NPCR(f1, f2)

uaci = UACI2(f1, f2)